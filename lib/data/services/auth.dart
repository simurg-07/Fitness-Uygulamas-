import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Giriş yap butonu
  Future<User?> signIn(String email, String password)async{
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  // Çıkış yap butonu
  signOut()async{
    return await _auth.signOut();
  }

  // Kayıt ol butonu
  createPerson(String name, String email, String password)async{
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore.collection("Kullanıcılar").doc(user.user?.uid).set({'username' : name, 'email': email, 'password': password});

    return user.user;

  }

}