import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/views/my_widgets/tree_view/tree_item.dart';
import 'package:wallet_core_managment/views/my_widgets/tree_view/tree_management_provider.dart';
import '../../../providers/theme_provider.dart';
import 'tree_list_widget.dart';

class TreeGroupWidget<T> extends StatelessWidget {
  final List<TreeItem<T>> items;
  final ThemeProvider theme;
  final Function(T) onItemClick;
  const TreeGroupWidget({
    Key? key,
    required this.items,
    required this.theme,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TreeManagementProvider<T>>(
          create: (_) => TreeManagementProvider<T>(items),
        ),
      ],
      child: _TreeGroupWidget<T>(onItemClick: onItemClick, theme: theme),
    );
  }
}

class _TreeGroupWidget<T> extends StatelessWidget {
  final ThemeProvider theme;
  final Function(T) onItemClick;
  const _TreeGroupWidget({
    Key? key,
    required this.theme,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<TreeManagementProvider<T>, TreeManagementState<T>>(
      selector: (context, provider) => provider.state,
      builder: (context, state, child) => TreeListWidget<T>(
        items: state.items,
        onExpandOrCollapse:
            context.read<TreeManagementProvider<T>>().onItemExpansionClick,
        onItemClick: (item) {
          context.read<TreeManagementProvider<T>>().onItemSelectionClick(item);
          onItemClick(item);
        },
        textStyle: TextStyle(color: theme.fontColor3),
      ),
    );
  }
}
