import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/theme/colors.dart';
import '../constants/theme/sizes.dart';
import '../constants/theme/text_style.dart';

class DefaultTextInput extends StatelessWidget {
  final String label;
  final EdgeInsets contentPadding;
  final Color borderColor;
  final Color fillColor;
  final double radius;
  final Widget icon;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;

  const DefaultTextInput({
    Key? key,
    required this.label,
    this.contentPadding = const EdgeInsets.all(AppSizes.s16),
    this.borderColor = AppColors.primaryColor,
    this.fillColor = AppColors.backgroundColor,
    this.radius = AppSizes.s24,
    this.icon = const Icon(
      Icons.search_outlined,
      color: AppColors.white,
      size: AppSizes.s24,
    ),
    this.controller,
    this.suffixWidget,
    this.validator,
    this.onChange,
    this.onEditingComplete,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.words,
    this.focusNode,
    this.textAlignVertical,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.done,
    this.textStyle = AppTextStyles.defaultText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      focusNode: focusNode,
      obscureText: obscureText,
      onChanged: onChange,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        prefixIcon: Transform.translate(
          offset: const Offset(AppSizes.s4, 0),
          child: icon,
        ),
        isDense: true,
        label: Transform.translate(
          offset: const Offset(AppSizes.s4, 0),
          child: Text(
            label,
            style: AppTextStyles.defaultText,
            textScaleFactor: 1,
          ),
        ),
        contentPadding: contentPadding,
        errorStyle: const TextStyle(
          color: Colors.redAccent,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
}
