import 'package:flutter/services.dart';

class CapitalizeInputFormatter extends TextInputFormatter {
  @override

  // aca formateamos el texto input

  // - siempre que la primera letra sea mayuscula
  TextEditingValue formatEditUpdate(_, TextEditingValue newValue) {
    // new value es el nuevo texto ingresado en el campo
    final text = newValue.text.trim();

    // si el texto esta vacio
    // asi quitamos los espacios en blanco del input
    if (text.isEmpty) {
      return newValue;
    }

    // aca tomamos el primer caraceter del texto y lo pasamos a mayusciula luego todo lo demas normal
    final newText = '${text[0].toUpperCase()}${text.substring(1, text.length)}';

    // retorno un valor de tipo texteditingvalue
    return newValue.copyWith(
      selection: TextSelection(
        baseOffset: newText.length,
        extentOffset: newText.length,
      ),
      text: newText,
      composing: TextRange(start: 0, end: newText.length),
    );
  }
}
