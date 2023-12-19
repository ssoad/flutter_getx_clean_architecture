import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  final String message;
  const Success(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerSuccess extends Success {
  const ServerSuccess(super.message);
}

class LocalSuccess extends Success {
  const LocalSuccess(super.message);
}
