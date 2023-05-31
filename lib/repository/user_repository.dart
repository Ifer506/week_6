import '../data_source/local/local_dart_source.dart';
import '../data_source/remote/remote_data_source.dart';
import '../model/user.dart';

class UserRepository {
  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;

  UserRepository({required this.localDataSource, required this.remoteDataSource});

  bool hasNetwork = false;

  bool addUser(User user) {
    bool isAdded = false;
    if (hasNetwork) {
      isAdded = remoteDataSource.addUser(user);
    } else {
      isAdded = localDataSource.addUser(user);
    }
    return isAdded;
  }

  List<User> getUsers() {
    if (hasNetwork) {
      return remoteDataSource.getUsers();
    } else {
      return localDataSource.getUsers();
    }
  }
}
