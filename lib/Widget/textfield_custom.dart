import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextfieldCustom extends StatelessWidget {
  final String text;
  final IconData Picon;
  final IconData? Sicon;
  TextEditingController controlar = TextEditingController();

  new({
    super.key,
    required this.text,
    required this.Picon,
    this.Sicon,
    required this.controlar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      child: TextFormField(
        controller: controlar,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter the ${text}";
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Picon),
          suffixIcon: Icon(Sicon),
          labelText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
