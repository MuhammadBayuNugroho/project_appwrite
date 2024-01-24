import 'package:appwrite/appwrite.dart';

class Constant {
  static const String endPoint = 'https://cloud.appwrite.io/v1'; //end point
  static const String projectId = 'YOUR-PROJECT-ID'; // enter your project id
  static const String databaseId = 'YOUR-DATABASE-ID'; // enter your database id

  static Client appwriteClient =
      Client().setEndpoint(endPoint).setProject(projectId);

  static Account appwriteAccount = Account(appwriteClient);
}
