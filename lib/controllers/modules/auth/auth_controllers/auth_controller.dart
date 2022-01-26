import 'dart:developer';

import 'package:appgangapp/global_widgets/show_get_dialog.dart';
import 'package:appgangapp/models/user_model.dart';
import 'package:appgangapp/pages/hometab.dart';
import 'package:appgangapp/services/firestore/firestore_service_users.dart';
import 'package:appgangapp/views/list_gangas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repitePasswordController = TextEditingController();

  RxBool obscureTextPassword = true.obs;
  RxBool obscureTextRePassword = true.obs;

  RxBool checkBoxValue = false.obs;

  //Rx<XFile>? sampleImage = XFile("").obs;

  Rx<XFile?> sampleImage = Rx<XFile?>(null);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaanging = FirebaseMessaging.instance;

  Rxn<User>? firebaseUser = Rxn<User>();
  Rxn<UserModel>? firestoreUser = Rxn<UserModel>();

  @override
  void onReady() async {
    //run every tine auth state change
    ever(firebaseUser!, handleAuthChanged);

    //firebaseUser!.bindStream(user);
    super.onReady();
  }

//Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      if (firebaseUser!.value?.isAnonymous == false)
        firestoreUser!.bindStream(streamFirestoreUser());
    }

    if (_firebaseUser == null) {
      Get.offAll(const HomePageTab());
    } else {
      Get.offAll(ListGangas());
    }
  }

  //Stream de firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    return _db
        .doc('users/${firebaseUser!.value!.uid}')
        .snapshots()
        .map((snapshot) {
      var userReturn =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);

      return userReturn;
    });
  }

  Future<User> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();

    //print(result.user!.isAnonymous);
    //print(result.user!);

    UserModel _newUser = UserModel(
        uid: null, name: "Anonimo", photoUrl: null, email: "Email Anonimo");

    firestoreUser!.value = _newUser;

    return result.user!;
  }

  //EL Usuario que retorna Google Sign-In puede ser nulo si el usuario cancela por eso se pone ?
  Future<User?> signInGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      //print(googleUser.email);
      //print(googleUser);
      //print(result.user!.displayName);
      //print(result.user!.email);
      //print(result.user!.photoURL);
      //print(result.user!.uid);

      UserModel _newUser = UserModel(
          uid: result.user!.uid,
          name: result.user!.displayName,
          photoUrl: result.user!.photoURL,
          email: result.user!.email);

      firestoreUser!.value = _newUser;

      DatabaseUsers().createNewUser(_newUser);
      return result.user;
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    //ESTO DESLOGUEA DE FIRESTORE
    await _auth.signOut();
    //SIGN-OUT DE GOOGLE SOLO SI QUIERO DESLOGUEARSE DE LA CUENTA EN GOOGLE SIGN-IN
    await _googleSignIn.signOut();
    //IMPRIME FALSE SI NO ESTA LOGUEADO EN LA CUENTA DE GOOGLE SIGN-IN
    print(await _googleSignIn.isSignedIn());
  }

  Future<void> addToken() async {
    _firebaseMessaanging.getToken().then((token) {
      saveTokens(token);
    });
  }

  Future<void> saveTokens(var token) async {
    try {
      await _db.collection('tokens').doc(token).set({
        'token': token,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUser(BuildContext context, UserModel user) async {
    try {
      _db.doc('/users/${user.uid}').update(user.toJson());
      update();
    } catch (e) {
      log("${e}");
    }
  }

  Future<bool> registerWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential _userSignUp = await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((resultado) async {
        print("UID: " + resultado.user!.uid.toString());
        print("email: " + resultado.user!.email.toString());

        UserModel _newUser = UserModel(
            uid: resultado.user!.uid,
            name: nameController.text,
            photoUrl: "https://picsum.photos/250?image=9",
            email: resultado.user!.email);

        DatabaseUsers()
            .createNewUser(_newUser); //ALMACENAR PERFIL USUARIO EN FIREBASE
        DatabaseUsers.mergeUserData(_newUser);

        firestoreUser!.value = _newUser;
        return resultado;
      });

      if (_userSignUp.user != null) {
        return true;
      } else {
        showGetDialog(
          context,
          "Error Registro Usuario",
          "Se produjo un error inesperado registrando al usuario. Inténtelo de nuevo más tarde.",
        );
        return false;
      }
    } on FirebaseAuthException catch (err) {
      showGetDialog(
        context,
        "Error",
        err.message!,
      );
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential _userSign = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (_userSign.user != null) {
        UserModel _signUser = UserModel(
            uid: _userSign.user!.uid,
            name: _userSign.user!.displayName,
            photoUrl: _userSign.user!.photoURL,
            email: _userSign.user!.email);

        firestoreUser!.value = _signUser;
      } else {
        showGetDialog(
          context,
          "Error en Usuario",
          "Se produjo un error inesperado recuperando al usuario. Inténtelo de nuevo.",
        );

        return false;
      }

      emailController.clear();
      passwordController.clear();

      return true;
    } on FirebaseAuthException catch (err) {
      showGetDialog(
        context,
        "Error",
        err.message!,
      );
      return false;
    }
  }

  //Password reset Email
  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
    } on FirebaseAuthException catch (err) {
      print(err.message);
    }
  }
}
