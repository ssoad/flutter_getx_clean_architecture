import 'package:flutter_getx_clean_architecture/core/usecases/no_param_usecase.dart';

class AuthUseCase implements NoParamUseCase {
  @override
  Future<void> execute() {
    return Future<void>.value();
  }
}
