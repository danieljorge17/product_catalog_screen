import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF035BA8),
            Color(0xFF0389D2),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextInputBox(
                labelName: "Código de Barras",
                hintText: "Ex: 7891033811663",
              ),
              const SizedBox(height: 24),
              const TextInputBox(
                labelName: "Nome do produto",
                hintText: "Ex: Coca-cola Lata",
              ),
              const SizedBox(height: 24),
              const TextInputBox(
                labelName: "Nome do estabelecimento",
                hintText: "Ex: Supermercado São Jorge - Centro",
              ),
              const SizedBox(height: 24),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    Flexible(
                      child: TextInputBox(
                        labelName: "Peso",
                        hintText: "Ex: 12,5",
                        key: _key,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const AnimatedDropdownButton(
                      optionsList: [
                        ["kg", "quilograma"],
                        ["g", "grama"],
                        ["mg", "miligrama"]
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedDropdownButton extends StatefulWidget {
  const AnimatedDropdownButton({Key? key, required this.optionsList})
      : super(key: key);
  final List<List<String>> optionsList;

  @override
  State<AnimatedDropdownButton> createState() => _AnimatedDropdownButtonState();
}

class _AnimatedDropdownButtonState extends State<AnimatedDropdownButton> {
  final double heightButton = 60;
  final double widthButton = 80;

  final TextStyle dropdownButtonHeadline = const TextStyle(
    fontSize: 16,
    color: Color(0xFFFFFFFF),
    fontWeight: FontWeight.bold,
  );
  final TextStyle dropdownButtonOptions = const TextStyle(
    fontSize: 12,
    color: Color(0xFF468FF2),
  );
  final TextStyle dropdownButtonTagline = const TextStyle(
    fontSize: 10,
    color: Color(0xC0FFFFFF),
  );
  final Color backgroundButtonColor = const Color(0xFF0389D2);
  Color backgroundDropdownColor = const Color(0xFF0389D2);
  final Color setBackgroundDropdownColor = const Color(0xFFF5F5F5);

  // final TextStyle dropdownButtonHeadline = const TextStyle(
  //   fontSize: 16,
  //   color: Color(0xFF468FF2),
  //   fontWeight: FontWeight.bold,
  // );
  // final TextStyle dropdownButtonOptions = const TextStyle(
  //   fontSize: 12,
  //   color: Color(0xFF468FF2),
  // );
  // final TextStyle dropdownButtonTagline = const TextStyle(
  //   fontSize: 10,
  //   color: Color(0xFFB2B2B2),
  // );
  // final Color backgroundButtonColor = const Color(0xFFFFFFFF);
  // final Color backgroundDropdownColor = const Color(0xFFF5F5F5);

  bool isOpen = false;
  BorderRadius borderButton = BorderRadius.circular(24);
  double heightDropdown = 60;
  List<String> optionChosed = ["", ""];

  @override
  void initState() {
    super.initState();
    optionChosed = widget.optionsList[0];
  }

  void _switchOptions(int index) {
    setState(() {
      // print(widget.optionsList[index][0]);
      // print(index);
      optionChosed = widget.optionsList[index];
      _openCloseDropdown();
    });
  }

  void _openCloseDropdown() {
    setState(() {
      if (isOpen) {
        borderButton = BorderRadius.circular(24);
        heightDropdown = 60;
        isOpen = false;
        backgroundDropdownColor = backgroundButtonColor;
      } else {
        borderButton = const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24));
        heightDropdown = 116 + 32 * (widget.optionsList.length - 1);
        backgroundDropdownColor = setBackgroundDropdownColor;
        isOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOutSine,
          height: heightDropdown,
          width: widthButton,
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(heightButton / 2),
              topRight: Radius.circular(heightButton / 2),
              bottomLeft: const Radius.circular(24),
              bottomRight: const Radius.circular(24),
            ),
            color: backgroundDropdownColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: heightButton,
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      _switchOptions(0);
                    },
                    child: Text(
                      widget.optionsList[0][1],
                      style: dropdownButtonOptions,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      _switchOptions(1);
                    },
                    child: Text(
                      widget.optionsList[1][1],
                      style: dropdownButtonOptions,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      _switchOptions(2);
                    },
                    child: Text(
                      widget.optionsList[2][1],
                      style: dropdownButtonOptions,
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
              ]),
        ),
        InkWell(
          onTap: _openCloseDropdown,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            height: heightButton,
            width: widthButton,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: borderButton,
              color: backgroundButtonColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  optionChosed[0],
                  style: dropdownButtonHeadline,
                ),
                Text(
                  optionChosed[1],
                  style: dropdownButtonTagline,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
