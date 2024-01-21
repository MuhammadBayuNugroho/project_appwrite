import 'package:appwrite/appwrite.dart';
import '../../common/constant.dart';

Client client =
    Client().setEndpoint(Constant.endPoint).setProject(Constant.projectId);

Account account = Account(client);

// Create new User

Future createUser() async {
  final user = await account.create(
      userId: ID.unique(),
      email: 'me@appwrite.io',
      password: 'password',
      name: 'My Name');
  print('User created succesfuly');
}
