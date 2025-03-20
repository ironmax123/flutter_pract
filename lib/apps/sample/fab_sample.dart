import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FabSamplePage extends HookWidget {
  const FabSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    ///　切り替えのbool値
    final visible = useState(true);

    /// スクロールのコントローラ
    final scrollController = useScrollController();

    /// スクロールのリスナー
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        /// 表示
        visible.value = true;
      } else {
        /// 非表示
        visible.value = false;
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fab Sample'),
      ),
      body: ListView.builder(
        /// スクロールの状態を管理
        controller: scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
      floatingActionButton: visible.value
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )

          /// 空のコンテナ
          : Container(),
    );
  }
}
