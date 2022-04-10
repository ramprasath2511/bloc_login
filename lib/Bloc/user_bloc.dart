
import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../Model/usermodel.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

 String email;
 String password;


UserBloc(this.email, this.password) : super(UserLoading());


  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
      if(event is LogedIn){
        if(event.email.isEmpty || event.password.isEmpty){
          yield(UserFailure());
        }else {
          yield(UserLoading());
          String result = await Userservice().loginAuth( event.email,event.password);{

            yield (UserLoaded(result));
          }
    }
        }
      }
    }



