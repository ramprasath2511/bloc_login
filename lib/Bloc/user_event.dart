part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LogedIn extends UserEvent{

  final String email;
  final String password;

  LogedIn(this.email, this.password);

  @override
  List<Object?> get props => [email,password];
}
class LogedOut extends UserEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

}
class Registered extends UserEvent{
  final String email;
  final String password;
  final String username;
  final String? profilePic;

  Registered(this.email, this.password, this.username, this.profilePic);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}