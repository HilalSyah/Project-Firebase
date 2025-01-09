import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {

  Future<void> signup({

    required String Email,
    required String Password,

  }) async {

    try {

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password);
      
    } on FirebaseAuthException catch (e) {
      String message = '';
      if(e.code == 'weak-password') {
        message = 'The password provided';
      }else if (e.code == 'email-already-in-use') {
        message = 'An Account already';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
        );
    }
    
    catch (e) {
      
    }

  }

}