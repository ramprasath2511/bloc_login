part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}
class UserInitial extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UserLoaded extends UserState{
final String result;

  UserLoaded(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];

}

class UserFailure extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
