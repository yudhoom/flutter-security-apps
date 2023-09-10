import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  // Obtain shared preferences.
  static const _keyUsername = 'keyUsername';
  static const _keyActivation = 'activation';
  static const _keyName = 'name';
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyAccessTokenRefreshed = 'accessTokenRefreshed';
  static const _keySelfieStatus = 'keySelfieStatus';
  static const _keyUserContact = 'keyUserContact';
  static const _keyUserGender = 'keyUserGender';
  static const _images = 'images';
  static const _usernamePhone = 'keyUsernamePhone';

  static setUsername(String username) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyUsername, username);
  }

  static getUsername() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  static setActivate(String activeStatus) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyActivation, activeStatus);
  }

  static getActivate() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyActivation);
  }

  static setName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  static getName() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  static setAccessToken(String accessToken) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccessToken, accessToken);
  }

  static getAccessToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccessToken);
  }

  static setRefreshToken(String refreshToken) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyRefreshToken, refreshToken);
  }

  static getRefreshToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRefreshToken);
  }

  static deleteRefreshTokenRevoked() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyRefreshToken);
  }

  static setAccessTokenRefreshed(String accessTokenRefreshed) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccessTokenRefreshed, accessTokenRefreshed);
  }

  static getAccessTokenRefreshed(String accessTokenRefreshed) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccessTokenRefreshed);
  }

  static setSelfieStatus(String param) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keySelfieStatus, param);
  }

  static getSelfieStatus() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySelfieStatus);
  }

  static setUserContact(String param) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyUserContact, param);
  }

  static getUserContact() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserContact);
  }

  static setUserGender(String param) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyUserGender, param);
  }

  static getUserGender() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserGender);
  }

  static setImageUrlAfterUpload(String param) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_images, param);
  }

  static getImageUrlAfterUpload() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_images);
  }

  static setUsernamePhone(String param) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernamePhone, param);
  }

  static getUsernamePhone() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernamePhone);
  }
}
