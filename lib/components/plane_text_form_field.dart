import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/themes.dart';

class PlaneTextFormField extends StatefulWidget {
  final String? label;
  final bool? noLabel;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? password;
  final TextCapitalization? capitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? suffix;
  final String? typeInput;
  final bool? readOnly;
  final bool? autovalidateMode;
  final int? maxLinex;
  final int? maxLength;
  const PlaneTextFormField({
    super.key,
    this.label,
    this.noLabel = false,
    required this.hint,
    required this.controller,
    required this.validator,
    this.password = false,
    this.capitalization,
    this.keyboardType,
    this.textInputAction,
    this.suffix = false,
    this.typeInput,
    this.readOnly = false,
    this.autovalidateMode = false,
    this.maxLinex = 1,
    this.maxLength,
  });

  @override
  State<PlaneTextFormField> createState() => _PlaneTextFormFieldState();
}

class _PlaneTextFormFieldState extends State<PlaneTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.password!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.noLabel != null
            ? const SizedBox()
            : Text(widget.label!, style: PlaneFonts(context).labelTextField),
        widget.noLabel != null ? const SizedBox() : const SizedBox(height: 10),
        TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLinex,
          readOnly: widget.readOnly!,
          autovalidateMode: widget.autovalidateMode != null
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          inputFormatters: [
            widget.typeInput == 'number'
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.deny(RegExp("[/\\\\]")),
          ],
          cursorColor: PlaneColors.primary,
          obscureText: widget.password! ? _obscureText : false,
          validator: widget.validator,
          controller: widget.controller,
          textCapitalization: widget.capitalization ?? TextCapitalization.none,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          style: PlaneFonts(context).textField,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(5, 13, 0, 0),
            suffixIcon: widget.suffix!
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: _obscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  )
                : const SizedBox(),
            hintText: widget.hint,
            hintStyle: PlaneFonts(context).hintTextField,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: PlaneColors.grey,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: PlaneColors.primary,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: PlaneColors.grey,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
