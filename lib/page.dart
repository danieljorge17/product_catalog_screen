import 'package:flutter/material.dart';
import 'package:product_catalog_screen/widgets/animated_dropdown.dart';
import 'package:product_catalog_screen/widgets/button.dart';
import 'package:product_catalog_screen/widgets/text_input.dart';

Map<String, dynamic> formFields = {
  'barcode': '',
  'product': '',
  'location': '',
  'weight': '0' as double,
  'weight_unid': '',
  'volume': '0' as double,
  'volume_unid': '',
  'size': '0' as double,
  'size_unid': '',
};

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Flexible(
                    child: TextInputBox(
                      labelName: "Peso",
                      hintText: "Ex: 12,5",
                    ),
                  ),
                  SizedBox(width: 16),
                  AnimatedDropdownButton(
                    optionsList: [
                      ["kg", "quilograma"],
                      ["g", "grama"],
                      ["mg", "miligrama"],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Flexible(
                    child: TextInputBox(
                      labelName: "Volume",
                      hintText: "Ex: 12,5",
                    ),
                  ),
                  SizedBox(width: 16),
                  AnimatedDropdownButton(
                    optionsList: [
                      ["l", "litro"],
                      ["ml", "mililitro"],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Flexible(
                    child: TextInputBox(
                      labelName: "Tamanho",
                      hintText: "Ex: 12,5",
                    ),
                  ),
                  SizedBox(width: 16),
                  AnimatedDropdownButton(
                    optionsList: [
                      ["m", "metro"],
                      ["cm", "centímetro"],
                      ["mm", "milímetro"],
                    ],
                  ),
                ],
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
