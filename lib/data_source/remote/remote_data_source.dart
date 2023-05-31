import '../../model/user.dart';

class RemoteDataSource {
  List<User> users = [];

  bool addUser(User user) {
    users.add(user);
    return true;
  }

  List<User> getUsers() {
    return users;
  }
}
