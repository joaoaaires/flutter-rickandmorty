import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final bool enable;
  final bool enableInteractiveSelection;
  final bool obscureText;
  final bool toggleObscureText;
  final bool isRequired;
  final bool autocorrect;
  final int maxLines;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final List<String? Function(String?)>? validators;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool border;

  const TextFormFieldCustom({
    Key? key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.onSaved,
    this.enable = true,
    this.enableInteractiveSelection = true,
    this.obscureText = false,
    this.toggleObscureText = false,
    this.isRequired = false,
    this.autocorrect = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.inputFormatters = const <TextInputFormatter>[],
    this.validators = const <String Function(String?)>[],
    this.prefixIcon,
    this.suffixIcon,
    this.border = false,
  }) : super(key: key);

  @override
  TextFormFieldCustomState createState() {
    return TextFormFieldCustomState();
  }
}

class TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool _showText = true;

  Widget? buildTogglePasswordButton() {
    if (!widget.toggleObscureText) {
      return widget.suffixIcon;
    }
    return IconButton(
      icon: Icon(!_showText ? Icons.visibility_off : Icons.visibility),
      color: Colors.grey,
      splashRadius: 2.0,
      onPressed: () {
        setState(() => _showText = !_showText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final borderSide = widget.border
        ? BorderSide(
            color: primaryColor,
            width: 0.8,
          )
        : BorderSide.none;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: borderSide,
    );

    return TextFormField(
      scrollPadding: const EdgeInsets.symmetric(horizontal: 30),
      onSaved: widget.onSaved,
      initialValue: widget.initialValue,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      obscureText: widget.toggleObscureText ? _showText : widget.obscureText,
      autocorrect: widget.autocorrect,
      enabled: widget.enable,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        hintMaxLines: widget.maxLines,
        fillColor: const Color(0xffF5F6FA),
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: buildTogglePasswordButton(),
      ),
      validator: (value) {
        if (widget.isRequired && value?.isEmpty == true) {
          return "Este campo é obrigatório";
        }

        final validators = widget.validators;

        if (validators == null) return null;

        if (validators.isEmpty) return null;

        for (var i = 0; i < validators.length; i++) {
          return validators[i](value);
        }

        return null;
      },
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
    );
  }
}
