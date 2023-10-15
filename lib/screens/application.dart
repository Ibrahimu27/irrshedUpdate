import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irrshed/screens/dailyIrrigationReport.dart';
import 'package:irrshed/screens/dashboard.dart';
import 'package:irrshed/services/databaseServices.dart';

class application extends StatefulWidget {
  final String fieldName;
  const application({Key? key, required this.fieldName}) : super(key: key);

  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  final formKey = GlobalKey<FormState>();
  TextEditingController irrigationApplicationController =TextEditingController();
  TextEditingController rainController =TextEditingController();
  TextEditingController cropFactorController =TextEditingController();
  TextEditingController deviceController =TextEditingController();
  TextEditingController evaporationController = TextEditingController();
  double finalTAM = 0;
  double tam = 0;
  double displayTAM = 0;
  double evaporation = 0;
  double todaysTAM = 0;


  getFieldDetails() async{
    //getting Tam of a field
    await databaseServices(uid: FirebaseAuth.instance.currentUser!.uid).getTAM(widget.fieldName).then((value){
      setState(() {
        tam = value;
      });
    });

    await databaseServices(uid: FirebaseAuth.instance.currentUser!.uid).getTAM(widget.fieldName).then((value){
      setState(() {
        evaporation = value;
      });
    });
  }

  @override
  void initState() {
    getFieldDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70, left: 10,right: 10),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Column(
                      children: [  //----------------------------fieldName------------------------
                        Text('AP11B', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text('LastIrrigation Date', style: TextStyle(color: Colors.white),),
                            SizedBox(width: 27,),
                            Text('20',style: TextStyle(color: Colors.white),),
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text('Device', style: TextStyle(color: Colors.white),),
                            SizedBox(width: 105,),
                            Text('20',style: TextStyle(color: Colors.white),),
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text('Status', style: TextStyle(color: Colors.white),),
                            SizedBox(width: 105,),
                            Text('20',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: irrigationApplicationController,
                        decoration: InputDecoration(
                            labelText: "Irrigation Application",
                            labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
                            hintText: "eg: 250mm",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (val){
                          if(cropFactorController.text.length < 1){
                            return "Irrigation Application Can't Be Empty";
                          }
                        },
                      )
                    ],
                  ),
                ),

                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: rainController,
                        decoration: InputDecoration(
                            labelText: "Rain",
                            labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
                            hintText: "eg: 250mm",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (val){
                          if(rainController.text.length < 1){
                            return "Rain can't be empty";
                          }
                        },
                      )
                    ],
                  ),
                ),

                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: cropFactorController,
                        decoration: InputDecoration(
                            labelText: "Crop Factor",
                            labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
                            hintText: "eg: 250mm",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (val){
                          if(cropFactorController.text.length < 1){
                            return "Crop Factor can't be empty";
                          }
                        },
                      )
                    ],
                  ),
                ),

                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: evaporationController,
                        decoration: InputDecoration(
                            labelText: "Evaporation",
                            labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
                            hintText: "eg: 250mm",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (val){
                          if(cropFactorController.text.length < 1){
                            return "Evaporation can't be empty";
                          }
                        },
                      )
                    ],
                  ),
                ),

                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        //keyboardType: TextInputType.number,
                        controller: deviceController,
                        decoration: InputDecoration(
                            labelText: "Device",
                            labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
                            hintText: "eg: 250mm",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (val){
                          if(cropFactorController.text.length < 1){
                            return "Device can't be empty";
                          }
                        },
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 150.0, top: 10),
                  child: GestureDetector(
                    onTap: () async {
                      if(formKey.currentState!.validate()){
                        calculateFinalTAM().then((value){
                          setState(() {
                            displayTAM = value;
                          });
                        });

                        await databaseServices(uid: FirebaseAuth.instance.currentUser!.uid).updateFieldDetails(displayTAM, widget.fieldName,);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard(fieldName: widget.fieldName,)));}
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                      child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateFinalTAM() {
    double irrigation = double.parse(irrigationApplicationController.text);
    double cropFactor = double.parse(cropFactorController.text);
    double rainfall = double.parse(rainController.text);
    double finalTAM = ((tam + irrigation + rainfall) - (evaporation * cropFactor));

    Timer.periodic(
        Duration(hours: 24),
            (timer) {
              finalTAM -= evaporation;
            });

        setState(() {
          todaysTAM = finalTAM;
        });
         calculateFinalTAM();
  }
}

