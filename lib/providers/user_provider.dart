import "package:flutter/material.dart";
import "package:frontend/models/user_model.dart";
import "package:frontend/services/authentication_service.dart";
import "package:frontend/services/user_service.dart";

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _user;

  UserProvider() {
    _user = null;
  }

  Future<void> fetchUserCredential() async {
    try {
      final UserModel user = await _userService.fetchUser(
        email: MakerSyncAuthentication().getUserEmail
      );

      notifyListeners();
    } catch (error) {
      print('Failed to fetch user: $error');
    }
  }
  
}