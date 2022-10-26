import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallet_core_managment/utils/extension.dart';
import 'tree_item.dart';

part 'tree_management_state.dart';

class TreeManagementProvider<T> extends ChangeNotifier {
  TreeManagementProvider(List<TreeItem<T>> items) {
    _state = TreeManagementState<T>(items: items);
  }
  late TreeManagementState<T> _state;

  TreeManagementState<T> get state => _state;

  @protected
  void emit(TreeManagementState<T> state) {
    _state = state;
    notifyListeners();
  }

  void onItemExpansionClick(T? item) =>
      emit(TreeManagementState<T>(items: state.items.toggleExpansion(item)));

  void onItemSelectionClick(T? item) =>
      emit(TreeManagementState<T>(items: state.items.toggleSelection(item)));
}
