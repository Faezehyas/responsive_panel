import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/views/my_widgets/tree_view/tree_item.dart';
import '../../../providers/theme_provider.dart';
import '../../../utils/utils.dart';
import 'tree_list_widget.dart';

class TreeChildWidget<T> extends StatelessWidget {
  final TreeItem<T> item;
  final Function(T) onExpandOrCollapse;
  final Function(T) onItemClick;
  final TextStyle textStyle;
  const TreeChildWidget({
    Key? key,
    required this.item,
    required this.onExpandOrCollapse,
    required this.onItemClick,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerWidget,
          _childWidget,
        ],
      ),
    );
  }

  Widget get _headerWidget => Builder(
        builder: (context) => Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => onItemClick(item.item),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: context
                    .read<ThemeProvider>()
                    .fontColor1
                    .withOpacity(item.isSelected ? .4 : 0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: item.hasChildren
                              ? () => onExpandOrCollapse(item.item)
                              : null,
                          child: Visibility(
                            visible: item.hasChildren,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainInteractivity: false,
                            maintainState: true,
                            child: AnimatedRotation(
                              turns: item.isExpanded ? .25 : 0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: textStyle.color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 6),
                        child: AnimatedDefaultTextStyle(
                          style: textStyle.copyWith(
                            fontFamily: context.read<LocaleProvider>().regularFontFamily,
                            color: textStyle.color
                                ?.withOpacity(item.isExpanded ? 1 : .8),
                          ),
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                          child: Text(item.title),
                        ),
                      ),
                    ),
                    AnimatedCrossFade(
                      duration: Duration(milliseconds: 300),
                      sizeCurve: Curves.ease,
                      firstCurve: Curves.ease,
                      secondCurve: Curves.ease,
                      firstChild: const SizedBox(height: 32),
                      secondChild: Checkbox(
                        value: true,
                        fillColor: MaterialStateProperty.all(
                          context.read<ThemeProvider>().primaryColor,
                        ),
                        side: BorderSide(
                          width: 0.5,
                          color:
                              context.read<ThemeProvider>().fontColor2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: null,
                      ),
                      crossFadeState: item.isSelected
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _childWidget => Builder(
        builder: (context) => AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          sizeCurve: Curves.ease,
          firstCurve: Curves.ease,
          secondCurve: Curves.ease,
          crossFadeState: item.isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox(width: double.infinity),
          secondChild: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: TreeListWidget(
              items: item.children,
              onExpandOrCollapse: onExpandOrCollapse,
              onItemClick: onItemClick,
              textStyle: textStyle,
            ),
          ),
        ),
      );
}
