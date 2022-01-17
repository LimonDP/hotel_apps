import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  String? _token;
  DateTime? _expiresIn;

  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCCrLw9fYF-47TTXGoTRiR68HWDeIOOyNI';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCCrLw9fYF-47TTXGoTRiR68HWDeIOOyNI';

    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    final responseData = json.decode(response.body);
    //print(json.decode(response.body));
    _token = responseData['idToken'];
    _expiresIn = DateTime.now().add(Duration(
      seconds: int.parse(responseData['expiresIn']),
    ));
    // print(_token);
    // print(_expiresIn);
    notifyListeners();
  }

  get token {
    if (_expiresIn != null &&
        _expiresIn!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
  }

  bool get isAuth {
    return token != null;
  }
}
