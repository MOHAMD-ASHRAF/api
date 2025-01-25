import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_in_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../core/functions/upload_image_to_api.dart';
import '../models/sign_up_model.dart';
import '../models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Profile Pic
  XFile? profilePic;

  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  SignInModel? user;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfileImage());
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoint.signup, isFormData: true, data: {
        ApiKey.name: signUpName.text,
        ApiKey.phone: signUpPhoneNumber.text,
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.confirmPassword: confirmPassword.text,
        ApiKey.location:
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        ApiKey.profilePic: await uploadImageToApi(profilePic!),
      });
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errorMessage: e.errorModel.errorMessage));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text,
      });
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(e.errorModel.errorMessage));
    }
  }

  getUSerProfile() async {
    try{
      emit(GetUserLoading());
      final response = await api
          .get(EndPoint.getUSerDataById(CacheHelper().getData(key: ApiKey.id)));
      emit(GetUserSuccess(user: UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetUserFailure(message: e.errorModel.errorMessage));
    }

  }
}
