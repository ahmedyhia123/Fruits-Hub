
import 'dart:convert';

import 'package:fruits_hub/Core/services/shared_preference.dart';
import 'package:fruits_hub/Features/auth/data/models/user_model.dart';
import 'package:fruits_hub/Features/auth/domain/entites/user.dart';

UserEntity getUser(){
  final jsonString = SharedPreferenceHelper.getString('user');
  final userEntity = UserModel.fromDataBase(jsonDecode(jsonString));
  return userEntity;
  
}