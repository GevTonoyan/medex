import 'package:firebase_database/firebase_database.dart';

const _passwordsDbName = 'passwords';
const _adminPasswordKey = 'adminPassword';

class AdminServiceImpl extends AdminService {
  final _databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<String> getPasswordHash() async {
    final snapshot = await _databaseRef.child('$_passwordsDbName/$_adminPasswordKey').get();
    return snapshot.value.toString();
  }
}

abstract class AdminService {
  Future<String> getPasswordHash();
}
