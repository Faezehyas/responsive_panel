import 'package:flutter/material.dart';

class MyTableWidget extends StatelessWidget {
  Color? headerBackgroundColor;
  Color? oddBackgrounColor;
  List<Widget> headers;
  List<List<Widget>>? data;
  MyTableWidget(
      {required this.headers,
      this.data,
      this.headerBackgroundColor,
      this.oddBackgrounColor});

  ScrollController _rowScrollContrller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _rowScrollContrller,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: headerBackgroundColor,
                ),
                child: Row(
                  children: headers,
                ),
              ),
              if (data != null)
                ...data!
                    .map((e) => Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: data!.indexOf(e).isOdd
                                ? oddBackgrounColor
                                : null,
                          ),
                          child: Row(
                            children: e,
                          ),
                        ))
                    .toList()
            ],
          ),
        )
      ],
    );
  }
}
