import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:  Color(0x0A000000),
            blurRadius: 9,
            offset:  Offset(0, 2),
            
          )
        ]
      ),
      child: TextField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        keyboardType: TextInputType.text,
      
        decoration: InputDecoration(
          
          hintText: '   ابحث عن.......',
          hintStyle: Styles.semiBold16.copyWith(color: const Color(0xff949D9E)),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 13, top: 10, bottom: 10),
            child: SvgPicture.asset( Assets.assetsImagesSearchIcon ),
          ) ,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 13, top: 10, bottom: 10),
            child: SvgPicture.asset(  Assets.assetsImagesSettingIcon),
          ) ,
          
          contentPadding: const EdgeInsets.only(top: 20, bottom: 17, right: 20),
          
          filled: true,
          fillColor:  Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
