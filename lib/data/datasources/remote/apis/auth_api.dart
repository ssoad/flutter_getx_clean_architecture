import 'dart:io';

import 'package:get/get.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/services/local_storage_service.dart';
import '../api_endpoint.dart';
import '../core/api_provider.dart';
import '../core/api_request.dart';


enum AuthType {
  register,
  login,
  socialLogin,
  logout,
  currentUser,
  forgotPasswordSendEmail,
  forgotPasswordVerifyCode,
  checkEmailExist,
  checkPhoneExist,
  setNewPassword,
  deleteUser,
}

enum SocialProvider { google, facebook, twitter, apple }

class AuthAPI implements IHTTPRequest {
  final AuthType type;
  SocialProvider? socialProvider;
  String? id;
  String? name;
  String? callingCode;
  String? phone;
  String? email;
  String? photoUrl;
  String? password;
  String? cPassword;
  String? code;

  AuthAPI._(
      {required this.type,
      this.socialProvider,
      this.id,
      this.password,
      this.name,
      this.email,
      this.photoUrl,
      this.callingCode,
      this.phone,
      this.code,
      this.cPassword});

  AuthAPI.checkEmailExist(String email)
      : this._(type: AuthType.checkEmailExist, email: email);

  AuthAPI.checkPhoneExist(String phone)
      : this._(type: AuthType.checkPhoneExist, phone: phone);

  AuthAPI.login(String username, String password)
      : this._(type: AuthType.login, email: username, password: password);

  AuthAPI.register(String name, String email, String callingCode, String phone,
      String password, String cPassword)
      : this._(
            type: AuthType.register,
            name: name,
            email: email,
            callingCode: callingCode,
            phone: phone,
            password: password,
            cPassword: cPassword);

  AuthAPI.socialLogin(String id, String name, String email, String photoUrl,
      SocialProvider socialProvider)
      : this._(
            type: AuthType.socialLogin,
            socialProvider: socialProvider,
            id: id,
            name: name,
            email: email,
            photoUrl: photoUrl);

  AuthAPI.logout() : this._(type: AuthType.logout);

  AuthAPI.forgotPassword(String email)
      : this._(type: AuthType.forgotPasswordSendEmail, email: email);

  AuthAPI.forgotPasswordVerifyCode(String email, String code)
      : this._(
            type: AuthType.forgotPasswordVerifyCode, email: email, code: code);
  AuthAPI.currentUser() : this._(type: AuthType.currentUser);

  AuthAPI.setNewPassword(String email, String password, String cPassword)
      : this._(
            type: AuthType.setNewPassword,
            email: email,
            password: password,
            cPassword: cPassword);
  AuthAPI.deleteUser() : this._(type: AuthType.deleteUser);

  @override
  String get endpoint => APIEndpoint.BASE_URL;

  @override
  String get path {
    switch (type) {
      case AuthType.checkEmailExist:
        return APIEndpoint.CHECK_EMAIL_EXIST;
      case AuthType.checkPhoneExist:
        return APIEndpoint.CHECK_PHONE_EXIST;
      case AuthType.register:
        return APIEndpoint.SIGN_UP;
      case AuthType.login:
        return APIEndpoint.LOGIN;
      case AuthType.forgotPasswordSendEmail:
        return APIEndpoint.FORGOT_PASSWORD_SEND_EMAIL;
      case AuthType.forgotPasswordVerifyCode:
        return APIEndpoint.FORGOT_PASSWORD_VERIFY_CODE;
      case AuthType.setNewPassword:
        return APIEndpoint.SET_NEW_PASSWORD;
      case AuthType.socialLogin:
        switch (socialProvider) {
          case SocialProvider.google:
            return APIEndpoint.SOCIAL_LOGIN_GOOGLE;
          case SocialProvider.facebook:
            return APIEndpoint.SOCIAL_LOGIN_FACEBOOK;
          // case SocialProvider.twitter:
          //   return APIEndpoint.TWITTER_LOGIN;
          case SocialProvider.apple:
            return APIEndpoint.SOCIAL_LOGIN_APPLE;
          default:
            return "";
        }
      case AuthType.logout:
        return APIEndpoint.LOGOUT;
      case AuthType.currentUser:
        return APIEndpoint.GET_PROFILE;
      case AuthType.deleteUser:
        return APIEndpoint.DELETE_USER;
      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthType.checkEmailExist:
        return HTTPMethod.post;
      case AuthType.checkPhoneExist:
        return HTTPMethod.post;
      case AuthType.register:
        return HTTPMethod.post;
      case AuthType.login:
        return HTTPMethod.post;
      case AuthType.socialLogin:
        return HTTPMethod.post;
      case AuthType.logout:
        return HTTPMethod.post;
      case AuthType.forgotPasswordSendEmail:
        return HTTPMethod.post;
      case AuthType.forgotPasswordVerifyCode:
        return HTTPMethod.post;
      case AuthType.setNewPassword:
        return HTTPMethod.post;
      case AuthType.currentUser:
        return HTTPMethod.get;
      case AuthType.deleteUser:
        return HTTPMethod.post;
      default:
        return HTTPMethod.get;
    }
  }

  @override
  Map<String, String> get headers {
    switch (type) {
      case AuthType.currentUser:
        return {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${Get.find<LocalStorageService>().apiToken!}',
          HttpHeaders.acceptHeader: 'application/json',
        };

      case AuthType.logout:
        return {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${Get.find<LocalStorageService>().apiToken!}'
        };

      case AuthType.deleteUser:
        return {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${Get.find<LocalStorageService>().apiToken!}'
        };
      default:
        return {HttpHeaders.contentTypeHeader: 'application/json'};
    }
  }

  @override
  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  @override
  get body {
    switch (type) {
      case AuthType.checkEmailExist:
        return {"email": email};

      case AuthType.checkPhoneExist:
        return {"phone": phone};

      case AuthType.register:
        return {
          "name": name,
          "email": email,
          "calling_code": callingCode,
          "phone": phone,
          "password": password,
          "c_password": cPassword
        };
      case AuthType.login:
        return {
          "identity": email,
          "password": password,
          "device_token": Get.find<LocalStorageService>().firebaseDeviceToken!
        };
      case AuthType.socialLogin:
        return {
          "id": id,
          "name": name,
          "email": email,
          "photoUrl": photoUrl,
          "device_token": Get.find<LocalStorageService>().firebaseDeviceToken!
        };
      case AuthType.forgotPasswordSendEmail:
        return {
          "email": email,
        };
      case AuthType.forgotPasswordVerifyCode:
        return {
          "email": email,
          "verfication_code": code,
        };
      case AuthType.setNewPassword:
        return {
          "email": email,
          "password": password,
          "confirm_password": cPassword,
        };
      default:
        return {};
    }
  }

  @override
  Future request() {
    return HTTPProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
