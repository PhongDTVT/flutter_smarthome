
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:home_iot/constants/app_colors.dart';
import 'package:home_iot/service/firestore.dart';

class FirebaseMethod extends StatefulWidget {
  const FirebaseMethod({super.key});

  @override
  State<FirebaseMethod> createState() => _FirebaseMethodState();
}

final databaseReference = FirebaseDatabase.instance.ref("mytrack");
class _FirebaseMethodState extends State<FirebaseMethod>{


  @override
  Widget build(BuildContext context) {
    final FirestoreService service = FirestoreService();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context,snapshot,index,animation) {
                return ListTile(
                  title: Text(snapshot.child('LAT').value.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Future<List<dynamic>> getUsers() async {
    DataSnapshot dataSnapshot = (await databaseReference.once()) as DataSnapshot;
    List<dynamic> users = [];
    dataSnapshot.value.toString();
    print(users.toString());
    return users;
  }
}