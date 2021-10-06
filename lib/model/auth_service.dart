import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Myuser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return Myuser(user.uid, user.email!);
  }

  Stream<Myuser?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<Myuser?> signinWithEmailandPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<Myuser?> createWithEmailandPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

class Myuser {
  String uid;
  String email;

  Myuser(this.uid, this.email);
}
