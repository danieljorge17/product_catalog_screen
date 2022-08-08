//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         AnimatedContainer(
//           curve: Curves.easeInOutSine,
//           height: heightDropdown,
//           width: widthButton,
//           duration: const Duration(milliseconds: 250),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(heightButton / 2),
//               topRight: Radius.circular(heightButton / 2),
//               bottomLeft: const Radius.circular(24),
//               bottomRight: const Radius.circular(24),
//             ),
//             color: backgroundDropdownColor,
//           ),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: heightButton,
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () {
//                       _switchOptions(0);
//                     },
//                     child: Text(
//                       widget.optionsList[0][1],
//                       style: dropdownButtonOptions,
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () {
//                       _switchOptions(1);
//                     },
//                     child: Text(
//                       widget.optionsList[1][1],
//                       style: dropdownButtonOptions,
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () {
//                       _switchOptions(2);
//                     },
//                     child: Text(
//                       widget.optionsList[2][1],
//                       style: dropdownButtonOptions,
//                     ),
//                   ),
//                 ),
//                 const Flexible(
//                   flex: 1,
//                   child: SizedBox(),
//                 ),
//               ]),
//         ),
//         InkWell(
//           onTap: _openCloseDropdown,
//           child: AnimatedContainer(
//             curve: Curves.easeInOut,
//             height: heightButton,
//             width: widthButton,
//             alignment: Alignment.center,
//             duration: const Duration(milliseconds: 250),
//             decoration: BoxDecoration(
//               borderRadius: borderButton,
//               color: backgroundButtonColor,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   optionChosed[0],
//                   style: dropdownButtonHeadline,
//                 ),
//                 Text(
//                   optionChosed[1],
//                   style: dropdownButtonTagline,
//                 ),
//                 const SizedBox(),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }