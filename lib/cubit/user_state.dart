 import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}
final class SignInSuccess extends UserState {}
final class SignInLoading extends UserState {}
final class UploadProfileImage extends UserState {}
final class SignInFailure extends UserState {
  final String errorMessage;

  SignInFailure(this.errorMessage);
}


/// Sign up

 final class SignUpSuccess extends UserState {
  final String message;
  SignUpSuccess({required this.message});
 }
 final class SignUpLoading extends UserState {}
 final class SignUpFailure extends UserState {
   final String errorMessage;
   SignUpFailure({required this.errorMessage});
 }



 /// Sign up

 final class GetUserSuccess extends UserState {
   final UserModel user;
   GetUserSuccess({required this.user});
 }
 final class GetUserLoading extends UserState {}
 final class GetUserFailure extends UserState {
   final String message;
   GetUserFailure({required this.message});
 }