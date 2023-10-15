import 'package:flutter/material.dart';
import 'package:irrshed/services/databaseServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/sharedPreferences.dart';

class registerField extends StatefulWidget {
  const registerField({Key? key}) : super(key: key);

  @override
  State<registerField> createState() => _registerFieldState();
}

class _registerFieldState extends State<registerField> {
  String zoneSelectedValue = "WEST";
  String areaSelectedValue = 'AREA 1';
  TextEditingController fieldNameController = TextEditingController();
  TextEditingController TAMController = TextEditingController();
  TextEditingController cropFactorController = TextEditingController();
  TextEditingController evaporationController = TextEditingController();
  String managerName = "";

  getManagerDetails() async {
    await helperFunctions().getUserName().then((value){
      setState(() {
        managerName = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Field Here', style: TextStyle(),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Field Name", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: fieldNameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        hintText: "eg AP10A",
                      ),
                    )
                ),

                const SizedBox(height: 20,),
                const Text("Select FIeld Zone", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(zoneSelectedValue),
                    items: <String>[
                      'EAST',
                      'WEST',
                      'KITENGULE',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {

                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Text("Select Field Area", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(areaSelectedValue),
                    items: <String>[
                      'AREA 1',
                      'AREA 2',
                      'AREA 3',
                      'AREA 4',
                      'AREA 5'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        areaSelectedValue = newValue!;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Text("Enter Field TAM", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:  TextField(
                      controller: TAMController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        hintText: "eg 100mm",
                      ),
                    )
                ),

                const SizedBox(height: 20,),

                const Text("Field Evaporation", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:  TextField(
                      controller: evaporationController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        hintText: "eg 100mm",
                      ),
                    )
                ),

                const SizedBox(height: 20,),


                const Text("Enter Crop Factor:",style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:  TextField(
                      controller: cropFactorController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        hintText: "eg WEST",
                      ),
                    )
                ),

                const SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    saveField();
                  },
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor.withOpacity(0.6),
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),

                      child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold,),),
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

  saveField() async {
    await databaseServices(uid: FirebaseAuth.instance.currentUser!.uid).createField(fieldNameController.text, areaSelectedValue, managerName, double.parse(TAMController.text), zoneSelectedValue,evaporationController.text);
  }
}
