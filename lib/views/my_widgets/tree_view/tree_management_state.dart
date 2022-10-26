part of 'tree_management_provider.dart';

class TreeManagementState<T> extends Equatable {
  final List<TreeItem<T>> items;
  const TreeManagementState({
    required this.items,
  });

  @override
  List<Object?> get props => [items];
}
