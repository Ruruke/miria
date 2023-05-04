import 'package:flutter/cupertino.dart';
import 'package:flutter_misskey_app/providers.dart';
import 'package:flutter_misskey_app/view/common/account_scope.dart';
import 'package:flutter_misskey_app/view/common/misskey_note.dart';
import 'package:flutter_misskey_app/view/common/pushable_listview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misskey_dart/misskey_dart.dart';

class ClipDetailNoteList extends ConsumerWidget {
  final String id;

  const ClipDetailNoteList({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PushableListView<Note>(initializeFuture: () async {
      final account = AccountScope.of(context);
      final response = await ref
          .read(misskeyProvider(account))
          .clips
          .notes(ClipsNotesRequest(clipId: id));
      ref.read(notesProvider(account)).registerAll(response);
      return response.toList();
    }, nextFuture: (latestItem) async {
      final account = AccountScope.of(context);
      final response = await ref
          .read(misskeyProvider(account))
          .clips
          .notes(ClipsNotesRequest(clipId: id, untilId: latestItem.id));
      ref.read(notesProvider(account)).registerAll(response);
      return response.toList();
    }, itemBuilder: (context, item) {
      return MisskeyNote(note: item);
    });
  }
}