import 'package:appwrite/appwrite.dart';
import '../../common/constant.dart';
import 'dart:developer';

class AuthDataProvider {
  // Create an appwrite client instance
  final Account account = Constant.appwriteAccount;

  // Create new User
  Future createUser() async {
    try {
      final user = await account.create(
          userId: ID.unique(),
          email: 'demo@appwrite.io',
          password: 'password',
          name: 'Demo User');
      print('User created succesfuly');
      inspect(user);
      return user;
    } catch (e) {
      print(e);
    }
  }

  // Perform the login request using the appwrite SDK
  Future login(String email, String password) async {
    try {
      final response = await account.createEmailSession(
        email: email,
        password: password,
      );
      print('login success');
      inspect(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  // Perform the logout request using the appwrite SDK
  Future logout() async {
    await account.deleteSession(sessionId: 'current');
  }
}
