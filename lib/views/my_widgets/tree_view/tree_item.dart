
import 'package:equatable/equatable.dart';
import 'package:wallet_core_managment/utils/extension.dart';

class TreeItem<T> extends Equatable {
  final String title;
  final T item;
  final List<TreeItem<T>> children;
  final bool isExpanded;
  final bool isSelected;

  const TreeItem({
    required this.children,
    required this.isExpanded,
    required this.item,
    required this.title,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [title, item, children, isExpanded, isSelected];

  TreeItem<T> toggleExpansion(T? item) => TreeItem<T>(
        children: children.toggleExpansion(item),
        isExpanded: this.item == item ? !isExpanded : isExpanded,
        item: this.item,
        title: title,
        isSelected: isSelected,
      );

  TreeItem<T> toggleSelection(T? item) => TreeItem<T>(
        children: children.toggleSelection(item),
        isExpanded: isExpanded,
        item: this.item,
        title: title,
        isSelected: this.item == item,
      );

  bool get hasChildren => children.isNotEmpty;
}
