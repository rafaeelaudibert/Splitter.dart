import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/*
 *  States enum
 */
enum AuthState { loggedOut, authenticating, loginFailure, loggedIn }

/*
 *  Authentication bloc
 */
class AuthBloc implements BlocBase {
  // Variables
  String token;
  Map<String, dynamic> userInfo;
  final BuildContext context;
  final storage = new FlutterSecureStorage();

  // Constructor
  AuthBloc(this.context);

  // Stream Controllers
  final _authStream =
      BehaviorSubject<AuthState>(seedValue: AuthState.loggedOut);

  // Getters and Setters
  AuthState get state => _authStream.stream.value;
  Observable<AuthState> get stream => _authStream.stream;

  bool get isAuthenticating => _authStream.value == AuthState.authenticating;
  bool get isLoggedIn => _authStream.value == AuthState.loggedIn;
  bool get isLoggedOut => _authStream.value == AuthState.loggedOut;

  /* ---------------
   * Methods
   */

  Future<void> logIn(String email, String password) async {
    // Start authentication process
    _authStream.add(AuthState.authenticating);

    // Tries to login to the database with email and password
    final credentials = await _logIn(email, password);

    // If credentials.item1 is not null, it is the token received back from the DB
    if (credentials.item1 != null) {
      this.token = credentials.item1;

      this.userInfo = await _fetchUserInfo(email, this.token);
      await _persistToken(this.token);
      _retrieveToken();

      _authStream.add(AuthState.loggedIn);
    } else {
      print('Error: ${credentials.item2}');
      _authStream.add(AuthState.loginFailure);
    }
  }

  // Log outs from the system deleting the token
  Future<void> logOut() async {
    await _deleteToken();
    _authStream.add(AuthState.loggedOut);
  }

  // Persists the token in the storage
  Future<void> _persistToken(String token) async {
    await storage.write(key: 'token', value: token);
    return;
  }

  // Retrieves the token from the storage
  Future<String> _retrieveToken() async {
    final token = await storage.read(key: 'token');
    print('Token is $token');

    return token;
  }

  Future<Tuple2<String, String>> _logIn(String email, String password) async {
    /// Check in the DB if the credentials are correct
    await Future.delayed(Duration(seconds: 2));

    if (email == 'x' && password == 'z') {
      return Tuple2("token123456", null);
    } else {
      return Tuple2(null, "InvalidPasswordOrEmail");
    }
  }

  Future<void> _deleteToken() async {
    storage.delete(key: "token");
    return;
  }

  Future<Map<String, dynamic>> _fetchUserInfo(
      String email, String token) async {
    /// Get the user information
    await Future.delayed(Duration(seconds: 1));

    return {"Name": "abcde", "Age": 14};
  }

  // Dispose
  @override
  void dispose() async {
    await _authStream.close();
  }

  @override
  String toString() {
    return "| loggedOut: ${state == AuthState.loggedOut} | loggedIn: ${state == AuthState.loggedIn}| authenticating: ${state == AuthState.authenticating}| loginFailure: ${state == AuthState.loginFailure} ";
  }
}
