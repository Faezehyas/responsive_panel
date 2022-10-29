import 'package:flutter/material.dart';

class MyTableWidget extends StatelessWidget {
  Color? headerBackgroundColor;
  Color? evenBackgrounColor;
  List<Widget> headers;
  List<List<Widget>> data;
  MyTableWidget(
      {required this.headers, required this.data, this.headerBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
              ...data
                  .map((e) => Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: data.indexOf(e).isEven
                              ? evenBackgrounColor
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
