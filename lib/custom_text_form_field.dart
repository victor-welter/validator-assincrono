import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  // Campos Obrigatórios
  final TextEditingController _controller;
  final Function(String) _onChanged;
  final dynamic Function(String) _validator;
  final String _hintText;
  final String _labelText;
  final String _errorText;

  //Campos opcionais
  final TextInputType _keyboardType;
  final TextCapitalization _textCapitalization;
  final ToolbarOptions _toolbarOptions;
  final AutovalidateMode _autovalidateMode;
  final List<TextInputFormatter> _inputFormatters;
  final int _maxLength;
  final bool _enabled;
  final bool _rigthAlignmentIcon;
  final bool _obscureText;
  final bool _autocorrect;
  final bool _autofocus;
  final bool _enableSuggestions;

  final Widget _icon;

  CustomTextFormField({
    // Campos Obrigatórios
    @required TextEditingController controller,
    @required Function(String) onChanged,
    @required dynamic Function(String) validator,
    @required String hintText,
    @required String labelText,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    ToolbarOptions toolbarOptions,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    List<TextInputFormatter> inputFormatter,
    int maxLength,
    bool enabled = true,
    bool rigthAlignmentIcon = true,
    bool obscureText = false,
    bool autocorrect = true,
    bool autofocus = false,
    bool enableSuggestions = true,
    Widget icon,
    String errorText,
  })  : this._controller = controller,
        this._onChanged = onChanged,
        this._validator = validator,
        this._labelText = labelText,
        this._hintText = hintText,
        this._keyboardType = keyboardType,
        this._textCapitalization = textCapitalization,
        this._toolbarOptions = toolbarOptions,
        this._autovalidateMode = autovalidateMode,
        this._inputFormatters = inputFormatter,
        this._maxLength = maxLength,
        this._enabled = enabled,
        this._rigthAlignmentIcon = rigthAlignmentIcon,
        this._obscureText = obscureText,
        this._autocorrect = autocorrect,
        this._autofocus = autofocus,
        this._enableSuggestions = enableSuggestions,
        this._icon = icon,
        this._errorText = errorText;

  Widget _positionIcon() {
    if (this._rigthAlignmentIcon) {
      return Positioned(
        top: 4,
        right: 4,
        child: this._icon,
      );
    }

    return Positioned(
      top: 5,
      left: 5,
      child: this._icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          // Campos Obrigatórios
          controller: this._controller,
          onChanged: this._onChanged,
          validator: this._validator,

          //Campos opcionais
          keyboardType: this._keyboardType,
          textCapitalization: this._textCapitalization,
          toolbarOptions: this._toolbarOptions,
          autovalidateMode: this._autovalidateMode,
          inputFormatters: this._inputFormatters,
          obscureText: this._obscureText,
          autocorrect: this._autocorrect,
          autofocus: this._autofocus,
          enabled: this._enabled,
          enableSuggestions: this._enableSuggestions,
          maxLength: this._maxLength,

          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: this._hintText,
            labelText: this._labelText,
            errorText: this._errorText,
            enabled: this._enabled,
            isDense: true,
            counterText: '',
            contentPadding: EdgeInsets.fromLTRB(
              this._icon != null && !this._rigthAlignmentIcon ? 50 : 12,
              20,
              this._icon != null && this._rigthAlignmentIcon ? 50 : 12,
              12,
            ),
          ),
          scrollPhysics: const BouncingScrollPhysics(),
        ),
        if (this._icon != null) _positionIcon(),
      ],
    );
  }
}
