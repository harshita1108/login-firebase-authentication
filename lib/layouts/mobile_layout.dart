import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final Image imageWidget;
  final Widget dataWidget;
  const MobileLayout(
      {Key? key, required this.imageWidget, required this.dataWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        children: [
          imageWidget,
          SizedBox(
            width: 300.0,
            child: dataWidget,
          )
        ],
      ),
    );
  }
}
