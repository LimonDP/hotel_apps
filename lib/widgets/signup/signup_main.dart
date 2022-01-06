import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/data/signup.dart';
import 'package:hotel_app/data/user_provider.dart';
import 'package:provider/provider.dart';

class SignUpMainPage extends StatefulWidget {
  const SignUpMainPage({Key? key}) : super(key: key);

  @override
  State<SignUpMainPage> createState() => _SignUpMainPageState();
}

class _SignUpMainPageState extends State<SignUpMainPage> {
  bool _obscureText = true;
  final _signUpKey = GlobalKey<FormState>();

  var _savenewaccount = SignUp(
    userName: '',
    age: 0,
    password: '',
    userEmail: '',
  );

  void _saveSingup() {
    final _valideated = _signUpKey.currentState!.validate();
    if (!_valideated) {
      return;
    }
    _signUpKey.currentState!.save();
    Provider.of<UserProvider>(context, listen: false).addUser(_savenewaccount);
    Navigator.of(context).pushNamed('/log-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                //height: 420,
                decoration: BoxDecoration(
                  color: Color(0xFFffd394),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Form(
                    key: _signUpKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'User name',
                            hintStyle:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                            filled: true,
                            fillColor: Color(0xFFcaa382),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please ,Enter user name";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _savenewaccount = SignUp(
                              userName: newValue.toString(),
                              age: _savenewaccount.age,
                              password: _savenewaccount.password,
                              userEmail: _savenewaccount.userEmail,
                            );
                          },
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Age',
                            hintStyle:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                            filled: true,
                            fillColor: Color(0xFFcaa382),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please ,Enter your age";
                            } else if (value == 0) {
                              return "Please , Enter valid age";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _savenewaccount = SignUp(
                              userName: _savenewaccount.userName,
                              age: int.parse(newValue.toString()),
                              password: _savenewaccount.password,
                              userEmail: _savenewaccount.userEmail,
                            );
                          },
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Email Address',
                            hintStyle:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                            filled: true,
                            fillColor: Color(0xFFcaa382),
                          ),
                          validator: (value) {
                            String pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regex = RegExp(pattern);
                            if (value!.isEmpty || !regex.hasMatch(value)) {
                              return "Enter a valid email address";
                            }

                            null;
                          },
                          onSaved: (newValue) {
                            _savenewaccount = SignUp(
                              userName: _savenewaccount.userName,
                              age: _savenewaccount.age,
                              userEmail: newValue.toString(),
                              password: _savenewaccount.password,
                            );
                          },
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              hintText: 'password',
                              hintStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              filled: true,
                              fillColor: Color(0xFFcaa382),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              )),
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length <= 6) {
                              return "password min length 6";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _savenewaccount = SignUp(
                              userName: _savenewaccount.userName,
                              age: _savenewaccount.age,
                              userEmail: _savenewaccount.userEmail,
                              password: newValue.toString(),
                            );
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(175, 55),
                            primary: Color(0xFFcaa382),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                          ),
                          onPressed: _saveSingup,
                          child: Text(
                            'Create Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account.'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/log-in');
                        },
                        child: Row(
                          children: [
                            Text('Sign In'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.login),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
