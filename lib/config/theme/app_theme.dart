import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 119, 54, 223);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(
            selectedColor >= 0 &&
                selectedColor <=
                    _colorThemes.length -
                        1, // assert, sirve para poner una condicion, en este caso las opciones de colores van de 0 a 6
            'Colors must be between 0 and ${_colorThemes.length} ');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
