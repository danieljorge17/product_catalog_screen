import 'package:flutter/material.dart';

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

  bool isOpen = false;
  BorderRadius borderButton = BorderRadius.circular(24);

  List<String> optionChosed = ["", ""];

  @override
  void initState() {
    super.initState();
    optionChosed = widget.optionsList[0];
  }

  void _switchOptions(int index) {
    setState(() {
      optionChosed = widget.optionsList[index];
      _openCloseDropdown();
    });
  }

  void _openCloseDropdown() {
    setState(() {
      if (isOpen) {
        borderButton = BorderRadius.circular(24);

        isOpen = false;
        backgroundDropdownColor = backgroundButtonColor;
      } else {
        borderButton = const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24));

        backgroundDropdownColor = setBackgroundDropdownColor;
        isOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        AnimatedSize(
          curve: Curves.easeInOutSine,
          duration: const Duration(milliseconds: 250),
          child: Container(
            width: widthButton,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
              color: backgroundDropdownColor,
            ),
            child: isOpen
                ? ListView(shrinkWrap: true, children: [
                    SizedBox(
                      height: isOpen ? 8 : 0,
                    ),
                    if (isOpen)
                      for (int i = 0; i < widget.optionsList.length; i++)
                        InkWell(
                          onTap: () {
                            _switchOptions(i);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                widget.optionsList[i][1],
                                style: dropdownButtonOptions,
                              ),
                            ),
                          ),
                        ),
                    SizedBox(
                      height: isOpen ? 8 : 0,
                    ),
                  ])
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
