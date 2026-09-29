import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _currentUser = UserModel(
    id: '1',
    name: 'nana',
    email: 'nana@ghmail.com',
    role: 'Mahasiswa',
  );

  UserModel? get currentUser => _currentUser;
  String get username => _currentUser?.name ?? 'nana';
  String get email => _currentUser?.email ?? 'nana@ghmail.com';

  // Method untuk memperbarui nama dan email sekaligus
  void setUserCredentials(String name, String email) {
    _currentUser = UserModel(
      id: _currentUser?.id ?? DateTime.now().toString(),
      name: name,
      email: email.isNotEmpty ? email : 'nana@ghmail.com',
      role: _currentUser?.role ?? 'Mahasiswa',
    );
    notifyListeners();
  }

  // Tetap sediakan method lama untuk berjaga-jaga jika dipanggil di tempat lain
  void setUsername(String newName) {
    setUserCredentials(newName, _currentUser?.email ?? 'nana@ghmail.com');
  }

  void setUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}