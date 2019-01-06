import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

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
  String userInfo;
  final BuildContext context;

  // Constructor
  AuthBloc(this.context);

  // Stream Controllers
  final _authStream =
      BehaviorSubject<AuthState>(seedValue: AuthState.loggedOut);

  // Getters and Setters
  AuthState get state => _authStream.stream.value;
  Observable<AuthState> get stream => _authStream.stream;

  /* ---------------
   * Methods
   */

  Future<void> logIn(String email, String password) async {
    // Start authentication process
    _authStream.add(AuthState.authenticating);
    final result = await _getInfoFromDB(email, password);

    if (result.item1) {
      this.token = result.item2;
      this.userInfo = await _fetchUserInfo(this.token);
      _persistToken(this.token);

      _authStream.add(AuthState.loggedIn);
    } else {
      _authStream.add(AuthState.loginFailure);
    }
  }

  Future<void> logOut() async {
    await _deleteToken();
    _authStream.add(AuthState.loggedOut);
  }

  bool isLoggedOut() {
    return _authStream.value == AuthState.loggedOut;
  }

  Future<void> _persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<Tuple3<bool, String, String>> _getInfoFromDB(
      String email, String password) async {
    /// Check in the DB if the credentials are correct
    await Future.delayed(Duration(seconds: 2));

    // Error
    // return Tuple3(false, null, "error");

    // Success
    return Tuple3(true, "token", null);
  }

  Future<void> _deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<String> _fetchUserInfo(String token) async {
    /// Get the user information
    await Future.delayed(Duration(seconds: 1));
    return "Name: abcde";
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
