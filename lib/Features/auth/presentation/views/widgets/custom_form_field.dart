import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    this.isPassword = false,
    required this.text, this.onSaved, this.validator,
  });
  final bool isPassword;
  final String text;
  final void Function(String?)? onSaved ;
  final String? Function(String?)? validator;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ,
      onSaved: widget.onSaved,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      obscureText: widget.isPassword ? isHidden : false,

      style: Styles.semiBold19,
      decoration: InputDecoration(
        suffixIcon:
            widget.isPassword
                ? Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: IconButton(
                    onPressed: () {
                      isHidden = !isHidden;
                      setState(() {});
                    },
                    icon: Icon(
                      color: const Color(0xffC9CECF),
                      isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                )
                : null,
        contentPadding: const EdgeInsets.only(top: 20, bottom: 17, right: 20),
        hintText: widget.text,
        hintStyle: Styles.bold16.copyWith(color: const Color(0xff949D9E)),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
