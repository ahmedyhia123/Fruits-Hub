import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class AoWidget extends StatelessWidget {
  const AoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
         Expanded(
          child: Divider(
            color: Color(0xffDDDFDF), // لون الخط الخفيف
            thickness: 1, // سمك الخط
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(' أو ', style: Styles.bold19),
        ),
        Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 1)),
      ],
    );
  }
}
