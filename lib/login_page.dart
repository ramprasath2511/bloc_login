import 'package:bloc_login/Bloc/user_bloc.dart';
import 'package:bloc_login/Model/usermodel.dart';
import 'package:bloc_login/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

double _headerHeight = 250;

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  Future<String>? login;
  bool isLoading = false;
  bool checkboxValue = false;
   late String email,password;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger;
  late String username, pass;
 String result ="";
  UserState? initialState ;



  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  key: ValueKey("login_email"),
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Enter your user name'),
                                  validator: (val) =>
                                  (val!.isEmpty
                                      ? 'Please enter your Name'
                                      : null),
                                  controller: _emailController,
                                  onSaved: (val) {
                                    email = val!;
                                  },
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  key: ValueKey("password"),
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  controller: _passwordController,
                                  onSaved: (val) {
                                    password = val!;
                                  },
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),*/
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                    decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                    child: ElevatedButton(
                                      style: ThemeHelper().buttonStyle(),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                        child: Text(
                                          'Sign In'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<UserBloc>(context).add(LogedIn(_emailController.text, _passwordController.text) );
                                        if(state is Userloaded)
                                        {
                                          scaffoldMessenger.showSnackBar(
                                              SnackBar(content: Text(
                                                  UserLoaded(result)
                                                      .toString())));
                                        }

                                      },
                                    ),
                                  ),

                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Register',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));*/
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme
                                            .of(context)
                                            .accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
