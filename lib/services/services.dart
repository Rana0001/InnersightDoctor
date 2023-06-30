import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/component/message.dart';
import 'package:doctor/models/appointment.dart';
import 'package:doctor/models/patient.dart';
import 'package:doctor/models/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app/constant.dart';
import '../models/doctors.dart';

class Services {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> loginWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google sign-in flow
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in flow
        return false;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential using the access token
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Sign up with Firebase using the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      bool value =
          await firebaseFirestore.collection('doctors').get().then((value) {
        for (var item in value.docs) {
          if (item.data()['email'] == userCredential.user!.email) {
            return true;
          }
        }
        return false;
      });

      if (value) {
        final User? user = userCredential.user;

        if (user != null) {
          bool result = await firebaseFirestore
              .collection('doctors')
              .doc(_auth.currentUser!.uid)
              .get()
              .then((value) async {
            Constant.doctor = Doctor.fromJson(value.data()!);
            await totalTransaction();
            await totalUniquePatient();

            return true;
          });
          if (result) {
            return true;
          }
        }
      } else {
// Access the user information
        final User? user = userCredential.user;

        // Extract the required information from the user object
        String? email = user?.email;
        String? profile = user?.photoURL;
        String? fullName = user?.displayName;
        String? phone = user?.phoneNumber;

        // Create a doctor model instance with the extracted information
        Doctor doctor = Doctor(
            email: email,
            fullName: fullName,
            phone: phone,
            profileURl: profile,
            uid: user?.uid);

        // Save the patient information to your desired storage (e.g., Firestore)
        bool result = await firebaseFirestore
            .collection('doctors')
            .doc(user?.uid)
            .set(doctor.toJson())
            .then((value) async {
          await firebaseFirestore
              .collection('doctors')
              .doc(user?.uid)
              .get()
              .then((value) {
            Constant.doctor = Doctor.fromJson(value.data()!);
          });
          return true;
        }).catchError((err) {
          return false;
        });

        if (result) {
          return true;
        }
      }
    } catch (e) {
      // Handle any errors that occurred during the signup process
      Messages.errorMessage(
          'Error signing up with Google: ${e.toString()}', context);
      debugPrint(e.toString());
      return false;
    }
    return false;
  }

  Future<bool> deleteAccount() async {
    bool result = await firebaseFirestore
        .collection('doctors')
        .doc(_auth.currentUser!.uid)
        .delete()
        .then((value) {
      _auth.currentUser!.delete();
      _googleSignIn.signOut();

      return true;
    }).catchError((err) {
      return false;
    });
    return result;
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      Constant.appointment = Appointment();
      Constant.appointmentTotal = 0;
      Constant.doctor = Doctor();
      Constant.total = 0;
      Constant.totalDoc = 0;
      Constant.totalPatients = 0;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<String>> getAppointment(String? date) async {
    await firebaseFirestore
        .collection('doctors')
        .doc(_auth.currentUser!.uid)
        .collection('appointments')
        .doc("${_auth.currentUser?.uid}-$date")
        .get()
        .then((value) {
      if (value.exists) {
        Constant.appointment = Appointment.fromJson(value.data()!);
        debugPrint(Constant.appointment.timeSlot.toString());
      } else {
        Constant.appointment = Appointment();
      }
    }).catchError((err) {
      Constant.appointment = Appointment();
      debugPrint(err.toString());
    });
    return Constant.appointment.timeSlot!;
  }

  Future<bool> setAppointment(String date, List<String> timeSlot) async {
    bool result = await firebaseFirestore
        .collection('doctors')
        .doc(_auth.currentUser!.uid)
        .collection('appointments')
        .doc("${_auth.currentUser?.uid}-$date")
        .set(
            Appointment(
                    date: date,
                    doctorId: _auth.currentUser!.uid,
                    timeSlot: timeSlot)
                .toJson(),
            SetOptions(merge: true))
        .then((value) {
      return true;
    }).catchError((err) {
      return false;
    });

    return result;
  }

  Future<bool> updateProfile(Doctor doctor) async {
    doctor.profileURl = Constant.doctor.profileURl;
    bool result = await firebaseFirestore
        .collection('doctors')
        .doc(_auth.currentUser!.uid)
        .set(doctor.toJson(), SetOptions(merge: true))
        .then((value) async {
      await firebaseFirestore
          .collection('doctors')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {
        Constant.doctor = Doctor.fromJson(value.data()!);
      });
      return true;
    }).catchError((err) {
      return false;
    });

    return result;
  }

  Future<int> totalTransaction() async {
    List<Payment> payments = [];
    int total = 0;
    await firebaseFirestore
        .collection('payments')
        .where('docID', isEqualTo: _auth.currentUser!.uid)
        .get()
        .then((value) {
      for (var item in value.docs) {
        payments.add(Payment.fromJson(item.data()));
        total += int.parse(payments[payments.length - 1].amount!);
        Constant.total = total;
        Constant.appointmentTotal = payments.length;
      }
    }).catchError((err) {
      debugPrint(err.toString());
    });

    return total;
  }

  /// Get all patients
  Future<List<Patient>> getAllPatient() async {
    try {
      List<Patient> listPatient = [];

      Patient patient = Patient();
      await firebaseFirestore.collection('payments').get().then((value) async {
        for (var docs in value.docs) {
          await firebaseFirestore
              .collection('patients')
              .doc(docs.id)
              .get()
              .then((value) {
            patient = Patient.fromJson(value.data());

            /// print docs

            listPatient.add(patient);
          });
        }
      });
      return listPatient;
    } catch (err) {
      return [];
    }
  }

  Future<List<Payment>> getTransactionToDoc() async {
    List<Payment> payments = [];
    await firebaseFirestore
        .collection('payments')
        .where('docID', isEqualTo: _auth.currentUser!.uid)
        .get()
        .then((value) {
      for (var item in value.docs) {
        payments.add(Payment.fromJson(item.data()));
      }
    }).catchError((err) {
      debugPrint(err.toString());
    });

    return payments;
  }

  Future<int> totalUniquePatient() async {
    List<Payment> payments = [];
    List<String> patient = [];
    await firebaseFirestore
        .collection('payments')
        .where('docID', isEqualTo: _auth.currentUser!.uid)
        .get()
        .then((value) {
      for (var item in value.docs) {
        payments.add(Payment.fromJson(item.data()));
        patient.add(payments[payments.length - 1].patientId!);
      }
    }).catchError((err) {
      debugPrint(err.toString());
    });
    Constant.totalPatients = patient.toSet().toList().length;
    return patient.toSet().toList().length;
  }
}
