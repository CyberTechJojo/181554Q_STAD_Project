import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stad_project/models/customer.dart';
import 'package:stad_project/models/user.dart';


class DatabaseService {

  //collection reference
  final CollectionReference fitnessCollection = Firestore.instance.collection('users');

  final String uid;
  DatabaseService({this.uid});

  Future updateUserData(String name, String contact) async {
    return await fitnessCollection.document(uid).setData({
      'name': name,
      'contact': contact,
    });
  }

  //customer list from snapshot
  List<Customer> _customerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Customer(
        name: doc.data['name'] ?? '',
        contact: doc.data['contact'] ?? ''
      );
    }).toList();
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      contact: snapshot.data['contact'],
    );
  }

  //get customers stream
  Stream<List<Customer>> get customers{
    return fitnessCollection.snapshots()
    .map(_customerListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return fitnessCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

}