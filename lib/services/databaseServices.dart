import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:irrshed/screens/updateDetails.dart';

class databaseServices{
  String? uid;
  databaseServices({required this.uid});

//-------------------------------------MAIN PART--------------------------------------------------//
  CollectionReference fieldCollection = FirebaseFirestore.instance.collection('field');
  CollectionReference fieldManagersCollection = FirebaseFirestore.instance.collection('field Managers');

  //registering owners
  Future registerUser(String ownerName, String numberOfProperties) async{
    return fieldCollection.doc(uid).set({
      "name": "",
      "managerId": uid,
      "fieldList": [],
    });
  }

  //creating a property
  Future<void> createField(String fieldName, String area, String fieldManager, double TAM, String zone, String evaporation) async {
    try {
      DocumentReference fieldReference = await fieldCollection.add({
        "fieldName": fieldName,
        "fieldId": "",
        "field manager": fieldManager,
        "zone": zone,
        "area": area,
        "TAM": TAM,
        "evaporation": evaporation,
        "displayTAM": "",
      });

      await fieldReference.update({
        "fieldId": fieldReference.id,
      });


      //---------retrieving all fieldName so that there will be no duplicate of fields---------//


      //updating fieldManagers collection by adding fields they managing
      try {
        DocumentReference ownerReference = fieldManagersCollection.doc(uid);
        return ownerReference.update({
          "fieldList": FieldValue.arrayUnion(
              ["${fieldReference.id}_$fieldName"]),
        });
      } catch(error){
        print("error in  updating owner infos: $error");
      }

    } catch (error) {
      print("Error creating property: $error");
    }
  }

  //retrieving field information
  getFieldInformation(String fieldName) async {
    return await fieldCollection.where('fieldName', isEqualTo: fieldName);
  }


  Future<double> getTAM(String fieldName) async {
    try {
      // Retrieve the document based on the field name
      var fieldInfo = await fieldCollection.where('fieldName', isEqualTo: fieldName).get();

      if (fieldInfo.docs.isNotEmpty) {
        // If the document exists, parse the TAM value as a double and return it
        double tam = fieldInfo.docs[0]['displayTAM'].toDouble();
        return tam;
      } else {
        // Handle the case where the document with the specified field name doesn't exist
        throw Exception("Field not found: $fieldName");
      }
    } catch (error) {
      // Handle any errors that occur during the retrieval process
      print("Error retrieving TAM value: $error");
      throw error;
    }
  }

  UpdateUserData(String fullName, String email){

  }

  updateFieldDetails(double displayTAM, String fieldName) async{
    DocumentReference fieldDocRef = fieldCollection.doc(uid);
    return await fieldDocRef.update({
      "displayTAM": displayTAM,
    });
  }

  //getGroup admin
  // Future getFieldTAM(String fieldId) async {
  //   DocumentReference d = fieldCollection.doc(fieldId);
  //   DocumentSnapshot documentSnapshot = await d.get();
  //   return documentSnapshot['displayTAM'];
  // }

}
