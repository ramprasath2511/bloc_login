import 'package:bloc_login/Bloc/user_bloc.dart';
import 'package:bloc_login/Model/usermodel.dart';
import 'package:bloc_login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async{
  runApp( RsApp());
}

class RsApp extends StatefulWidget {
  @override
  _RsAppState createState() => _RsAppState();
}

class _RsAppState extends State<RsApp> {
  @override
  void initState() {
    super.initState();
  }

  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#8A02AE');
  String email ='';
  String password ='';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RS App',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home:BlocProvider<UserBloc>(
        create:  (_) => UserBloc( email, password ),
        child:Stack( children:[
         LoginPage(),

      ] ),
      ),
    );
  }
}

