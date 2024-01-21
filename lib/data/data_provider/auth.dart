import 'package:appwrite/appwrite.dart';
import '../../common/constant.dart';

Client client = Client().setEndpoint(endPoint).setProject(projectId);

Account account = Account(client);
// Database database = Database(client, databaseId: databaseId);
