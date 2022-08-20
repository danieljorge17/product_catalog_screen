import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: const Center(
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
