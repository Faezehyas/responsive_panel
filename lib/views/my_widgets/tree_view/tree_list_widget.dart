import 'package:flutter/material.dart';
import 'package:wallet_core_managment/views/my_widgets/tree_view/tree_item.dart';
import 'tree_child_widget.dart';

class TreeListWidget<T> extends StatelessWidget {
  final List<TreeItem<T>> items;
  final Function(T) onExpandOrCollapse;
  final Function(T) onItemClick;
  final TextStyle textStyle;
  const TreeListWidget({
    Key? key,
    required this.items,
    required this.onExpandOrCollapse,
    required this.onItemClick,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsetsDirectional.only(end: 10),
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => TreeChildWidget(
        item: items[index],
        onExpandOrCollapse: onExpandOrCollapse,
        onItemClick: onItemClick,
        textStyle: textStyle,
      ),
    );
  }
}
