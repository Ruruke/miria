import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miria/model/account.dart';
import 'package:miria/view/common/account_scope.dart';
import 'package:miria/view/explore_page/explore_hashtags.dart';
import 'package:miria/view/explore_page/explore_highlight.dart';
import 'package:miria/view/explore_page/explore_role.dart';
import 'package:miria/view/explore_page/explore_users.dart';

@RoutePage()
class ExplorePage extends ConsumerStatefulWidget {
  final Account account;

  const ExplorePage({
    super.key,
    required this.account,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ExplorePageState();
}

class ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return AccountScope(
        account: widget.account,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("みつける"),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "ハイライト"),
                  Tab(text: "ユーザー"),
                  Tab(text: "ロール"),
                  Tab(text: "ハッシュタグ"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                ExploreHighlight(),
                ExploreUsers(),
                ExploreRole(),
                ExploreHashtags()
              ],
            ),
          ),
        ));
  }
}