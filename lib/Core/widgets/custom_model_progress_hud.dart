import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModelProgressHUD extends StatelessWidget {
  const CustomModelProgressHUD({
    super.key, required this.child, required this.isLoading,
  });
final bool isLoading;
final Widget child ;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: isLoading ,
    child: child );
  }
}