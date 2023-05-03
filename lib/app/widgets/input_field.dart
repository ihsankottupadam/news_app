import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    this.controller,
    this.hintText,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.prefix,
    this.inputFormatters,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.labelText,
  }) : super(key: key);
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool isPassword;
  final Widget? prefix;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword && !passwordVisible,
      controller: widget.controller,
      keyboardType: widget.inputType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        counterText: '',
        prefix: widget.prefix,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _toggglePasswordVisibility,
                icon: Icon(passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined))
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }

  _toggglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
}
