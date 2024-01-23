import 'package:appwrite/appwrite.dart';
import '../../models/user.dart';
import '../../common/constant.dart';

class AuthDataProvider {
  final Client client =
      Client().setEndpoint(Constant.endPoint).setProject(Constant.projectId);

  final Account account = Account(client);
}

// Create new User

Future createUser() async {
  final user = await account.create(
      userId: ID.unique(),
      email: 'demo@appwrite.io',
      password: 'password',
      name: 'Demo User');
  print('User created succesfuly');
}

class UserDataProvider {
  // Create an appwrite client instance
  final client = Client()
    ..setEndpoint('https://[ENDPOINT]/v1') // Your Appwrite Endpoint
    ..setProject('[PROJECT]') // Your Appwrite Project ID
    ..setSelfSigned(); // Do not use this in production

  // Create an appwrite account instance
  final account = Account(client);

  // Perform the login request using the appwrite SDK
  Future<User> login(String email, String password) async {
    final response = await account.createSession(
      email: email,
      password: password,
    );
    if (response.statusCode == 201) {
      return User.fromJson(response.data['user']);
    } else {
      throw Exception(response.data['message']);
    }
  }
}
