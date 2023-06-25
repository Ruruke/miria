import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miria/model/account.dart';
import 'package:miria/model/image_file.dart';
import 'package:miria/providers.dart';
import 'package:miria/state_notifier/photo_edit_page/photo_edit_state_notifier.dart';
import 'package:miria/view/common/account_scope.dart';
import 'package:miria/view/dialogs/simple_confirm_dialog.dart';
import 'package:miria/view/photo_edit_page/clip_mode.dart';
import 'package:miria/view/photo_edit_page/color_filter_image_preview.dart';

@RoutePage<Uint8List?>()
class PhotoEditPage extends ConsumerStatefulWidget {
  final Account account;
  final MisskeyPostFile file;
  final void Function(Uint8List) onSubmit;

  const PhotoEditPage({
    required this.account,
    required this.file,
    required this.onSubmit,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => PhotoEditPageState();
}

class PhotoEditPageState extends ConsumerState<PhotoEditPage> {
  PhotoEditStateNotifier get photoEdit => ref.read(photoEditProvider.notifier);

  final renderingAreaKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    photoEdit.initialize(widget.file);
  }

  @override
  Widget build(BuildContext context) {
    return AccountScope(
      account: widget.account,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("写真編集"),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    photoEdit.clearSelectMode();
                    final confirm = await SimpleConfirmDialog.show(
                        context: context,
                        message: "保存しよる？",
                        primary: "保存する",
                        secondary: "もうちょっと続ける");

                    final result =
                        await photoEdit.createSaveData(renderingAreaKey);
                    if (result == null) return;
                    if (!mounted) return;
                    if (!mounted) return;
                    if (confirm == true) {
                      widget.onSubmit(result);
                      context.back();
                    }
                  },
                  icon: const Icon(Icons.save))
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    photoEdit.decideDrawArea(
                        Size(constraints.maxWidth, constraints.maxHeight));
                  });
                  return SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: ClipMode(
                            renderingGlobalKey: renderingAreaKey,
                          )));
                }),
              ),
              const ColorFilterImagePreview(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => photoEdit.crop(),
                    icon: const Icon(Icons.crop)),
                IconButton(
                    onPressed: () => photoEdit.rotate(),
                    icon: const Icon(Icons.refresh)),
                IconButton(
                    onPressed: () => photoEdit.colorFilter(),
                    icon: const Icon(Icons.palette_outlined)),
                IconButton(
                    onPressed: () =>
                        photoEdit.addReaction(widget.account, context),
                    icon: const Icon(Icons.add_reaction_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.info_outline))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
