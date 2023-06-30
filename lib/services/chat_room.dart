import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/chat_room.dart';

class ChatRoomService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future sendMessage(ChatRoom chatRoom) async {
    await firebaseFirestore.collection('chatroom').add(chatRoom.toJson());
  }

  getMessage(String patientId) {
    return firebaseFirestore
        .collection('chatroom')
        .where('patientId', isEqualTo: patientId)
        .where('doctorId', isEqualTo: Constant.doctor.uid)
        .orderBy('dateTimeText', descending: false)
        .snapshots();
  }
}
