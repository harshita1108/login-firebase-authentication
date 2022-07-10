import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webChild;
  final Widget mobileChild;
  const ResponsiveLayout(
      {Key? key, required this.webChild, required this.mobileChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    Widget childWidget = mobileChild;
                    if (constraints.maxWidth > 400) {
                      childWidget = webChild;
                    }
                    return childWidget;
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
