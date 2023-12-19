
import 'package:dartz/dartz.dart';

import '../common/success/success.dart';
import '../entities/user.dart';
import '../../core/exception/app_exception.dart';

abstract class IAuthRepository {
  Future<Either<AppException, ServerSuccess>> register(
      String name,
      String email,
      String callingCode,
      String phone,
      String password,
      String cPassword);
  Future<Either<AppException, User>> login(String email, String password);
  Future<Either<AppException, User>> loginWithGoogle();
  Future<Either<AppException, User>> loginWithFacebook();
  Future<Either<AppException, User>> loginWithApple();
  Future<Either<AppException, ServerSuccess>> logout();
  Future<Either<AppException, ServerSuccess>> forgotPassword(String email);
  Future<Either<AppException, ServerSuccess>> verifyCode(
      String email, String code);
  Future<Either<AppException, ServerSuccess>> setNewPassword(
      String email, String password, String cPassword);
  Future<Either<AppException, User>> getCurrentUser();
  Future<Either<AppException, ServerSuccess>> deleteUser();
}
