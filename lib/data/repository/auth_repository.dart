import '../../models/user.dart';
import '../data_provider/auth_data_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;
  final FlutterSecureStorage storage;

  AuthRepository({required this.authDataProvider, required this.storage});

  // Persist the user token using Flutter Secure Storage
  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  // Delete the user token using Flutter Secure Storage
  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  // Check if the user token exists using Flutter Secure Storage
  Future<bool> hasToken() async {
    String? token = await storage.read(key: 'token');
    return token != null;
  }

  // Perform the login using the user data provider and return the user
  Future<User> login(String email, String password) async {
    return User.fromMap(await authDataProvider.login(email, password));
    //= await authDataProvider.login(email, password);
  }
}
