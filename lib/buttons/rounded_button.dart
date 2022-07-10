import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;

  final VoidCallback onPressed;

  const RoundedButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.shade100,
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 40.0,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
