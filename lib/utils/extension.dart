import 'package:wallet_core_managment/utils/enums.dart';
import 'package:wallet_core_managment/utils/utils.dart';
import 'package:wallet_core_managment/views/my_widgets/tree_view/tree_item.dart';

import '../models/tree_test_model.dart';

extension TreeItemListExt<T> on List<TreeItem<T>> {
  List<TreeItem<T>> toggleExpansion(T? item) {
    return List.generate(
      length,
      (index) => this[index].toggleExpansion(item),
    );
  }

  List<TreeItem<T>> toggleSelection(T? item) {
    return List.generate(
      length,
      (index) => this[index].toggleSelection(item),
    );
  }
}

extension TreeTestModelListExt on List<TreeTestModel> {
  List<TreeItem<TreeTestModel>> get toTreeItems => map((e) => TreeItem(
        children: e.children.toTreeItems,
        isExpanded: false,
        item: e,
        title: e.title,
        isSelected: false,
      )).toList();
}

extension NumberParsing on num {
  double w() => this * media.size.width / 100;

  double h() => this * media.size.height / 100;
}

extension IsEn on MyLocaleMode {
  bool get isEn {
    switch (this) {
      case MyLocaleMode.en:
        return true;
      case MyLocaleMode.fa:
        return false;
    }
  }
}

extension IsDark on MyThemeMode {
  bool get isDark {
    switch (this) {
      case MyThemeMode.dark:
        return true;
      case MyThemeMode.light:
        return false;
    }
  }
}
