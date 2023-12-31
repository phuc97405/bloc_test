import 'package:bloc_test/core/components/text/custom_text.dart';
import 'package:bloc_test/core/constants/app/color_constants.dart';
import 'package:bloc_test/core/extensions/context_extensions.dart';
import 'package:bloc_test/core/extensions/num_extensions.dart';
import 'package:bloc_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/typedefs.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.title,
    this.isPassword = false,
    this.onSaved,
    this.keyboardType = TextInputType.text,
  });

  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final ValidatorFunction validator;
  final bool? isPassword;
  final TextInputType? keyboardType;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.ph,
        CustomText(
          widget.title ?? "",
          textStyle: context.textTheme.titleMedium,
        ),
        10.ph,
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onSaved: widget.onSaved,
          cursorColor: getIt<ColorConstants>().onPrimary,
          obscureText: widget.isPassword ?? false,
          style: GoogleFonts.montserrat(),
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorStyle: GoogleFonts.montserrat(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: getIt<ColorConstants>().onPrimary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: getIt<ColorConstants>().onPrimary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: getIt<ColorConstants>().onPrimary)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
