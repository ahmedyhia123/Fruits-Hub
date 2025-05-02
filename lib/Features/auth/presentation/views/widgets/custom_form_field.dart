import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    this.isPassword = false,
    required this.text, this.onSaved,
  });
  final bool isPassword;
  final String text;
  final void Function(String?)? onSaved ;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if( value == null|| value.isEmpty){
          return 'هذا الحقل مطلوب';
        }else{
          return null;
        }
      },
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
                      color: Color(0xffC9CECF),
                      isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                )
                : null,
        contentPadding: EdgeInsets.only(top: 20, bottom: 17, right: 20),
        hintText: widget.text,
        hintStyle: Styles.bold16.copyWith(color: Color(0xff949D9E)),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
