import 'package:flutter/material.dart';

class TextInputBox extends StatefulWidget {
  const TextInputBox(
      {this.isEnable = true,
      Key? key,
      required this.labelName,
      required this.hintText})
      : super(key: key);
  final bool isEnable;
  final String labelName;
  final String hintText;

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 60,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _controller,
        expands: true,
        maxLines: null,
        enabled: widget.isEnable,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: Colors.white30,
            padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
            icon: const Icon(Icons.clear_rounded),
            onPressed: _controller.clear,
          ),
          contentPadding: const EdgeInsets.only(left: 24, top: 12, bottom: 12),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: widget.labelName,
          floatingLabelStyle: const TextStyle(color: Colors.white70),
          labelStyle: TextStyle(
              color: widget.isEnable ? Colors.white54 : Colors.black12),
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}
