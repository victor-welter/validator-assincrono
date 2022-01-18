import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  // Campos Obrigatórios
  final TextEditingController _controller;
  final Function(String) _onChanged;
  final dynamic Function(String) _validator;
  final String _errorText;

  // Campos opcionais
  final TextInputType _keyboardType;
  final TextCapitalization _textCapitalization;
  final AutovalidateMode _autovalidateMode;

  CustomTextFormField({
    // Campos Obrigatórios
    @required TextEditingController controller,
    @required Function(String) onChanged,
    @required dynamic Function(String) validator,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    String errorText,
  })  : this._controller = controller,
        this._onChanged = onChanged,
        this._validator = validator,
        this._keyboardType = keyboardType,
        this._textCapitalization = textCapitalization,
        this._autovalidateMode = autovalidateMode,
        this._errorText = errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Campos Obrigatórios
      controller: this._controller,
      onChanged: this._onChanged,
      validator: this._validator,

      // Campos opcionais
      keyboardType: this._keyboardType,
      textCapitalization: this._textCapitalization,
      autovalidateMode: this._autovalidateMode,
      scrollPhysics: const BouncingScrollPhysics(),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        errorText: this._errorText,
        isDense: true,
      ),
    );
  }
}
