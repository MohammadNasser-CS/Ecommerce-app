import 'package:e_commerce/Utils/api_path.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password,String username);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<User?> getUser();
}

class AppAuthImplementation implements AuthServices {
  final _firebaseAuth = FirebaseAuth.instance;
  final firestore = FirestoreService.instance;
  @override
  Future<bool> login(String email, String password) async {
    UserCredential userData = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (userData.user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> register(String email, String password, String username) async {
    UserCredential userData = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userData.user != null) {
      final currentUserData = UserModel(
      id: userData.user!.uid,
      email: email,
      username: username, password: password,
    );
      await firestore.setData(
        path: ApiPath.user(currentUserData.id),
        data: currentUserData.toMap(),
      );
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User?> getUser() {
    return Future.value(_firebaseAuth.currentUser);
  }
}
