import 'package:offline_database_assign/repository.dart';
import 'package:offline_database_assign/usermodel.dart';

class Userservice {
  late Repository repository;

  Userservice() {
    repository = Repository();
  }

  saveUser(UserModel? userModel) async {
    return await repository.insertData("myTable", userModel!.userMap());
  }

  displayUser() async {
    return await repository.getData("myTable");
  }

  updateUser(UserModel? userModel) async {
    return await repository.updateData("myTable", userModel!.userMap());
  }

  deleteUser(UserModel? userModel) async {
    return await repository.deleteData("myTable", userModel!.userMap());
  }
}
