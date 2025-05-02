import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/app_colors.dart';
import 'package:fruits_hub/Core/utils/constants.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class TermAndCon extends StatefulWidget {
  const TermAndCon({super.key});

  @override
  State<TermAndCon> createState() => _TermAndConState();
}

class _TermAndConState extends State<TermAndCon> {
  bool chkBox = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: Offset(14, -6),
          child: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              checkColor: Colors.white,
              side: BorderSide(color: Color(0xff949D9E).withOpacity(0.5)),
              activeColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6,
                ), // زوّد الرقم حسب ما تحب شكل الزاوية
              ),
              value: chkBox,
              onChanged: (value) {
                chkBox = !chkBox;
                setState(() {});
              },
            ),
          ),
        ),

        SizedBox(
          width:
              MediaQuery.of(context).size.width - (kHorizontalPadding * 2) - 50,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: Styles.semiBold16.copyWith(color: Color(0xff949D9E)),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: Styles.semiBold16.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

      //  Text('من خلال إنشاء حساب ، فإنك توافق على'),
   //     Text('الشروط\n والأحكام الخاصة بنا'),