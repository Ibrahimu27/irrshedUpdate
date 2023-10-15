import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irrshed/screens/application.dart';
import 'package:irrshed/screens/calculator.dart';
import 'package:irrshed/screens/registerField.dart';
import 'package:irrshed/screens/weatherData.dart';
import 'package:irrshed/services/databaseServices.dart';
import 'dailyIrrigationReport.dart';
import 'managerTrialPage.dart';
import 'profile.dart';
import 'updateDetails.dart';

class dashboard extends StatefulWidget {
  final String fieldName;
  const dashboard({Key? key, required this.fieldName,}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  double displayTAM = 0;

//a function to pull all the required data from the database
  getFieldData() async{
     await databaseServices(uid: FirebaseAuth.instance.currentUser!.uid).getTAM(widget.fieldName).then((value){
       setState(() {
         displayTAM = value;
       });
     });
  }

  @override
  void initState() {
    // first Thing after navigating to this page all the data from the databse should be pulled here to be displayed
    getFieldData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DASHBOARD", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: const [
          // IconButton(
          //     onPressed: (){},
          //     icon: const Icon(
          //       //Icons.menu,
          //     ))
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //child: Text("View", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),

      drawer: Drawer(
        //................shape: ShapeBorder,
        child: Padding(
          padding: EdgeInsets.only(top: 68.0),
          child: Column(
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
                radius: 50,
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>profilePage()));
                    },
                    title: Text('Profile', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>calculator()));
                    },
                    title: Text('Calculator', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>application(fieldName: widget.fieldName,)));
                    },
                    title: Text('Field Details', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BarChartExample()));
                    },
                    title: Text('Weather Data', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>irrigationReport()));
                    },
                    title: Text('Irrigation Report', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>registerField()));
                    },
                    title: Text('Register Field', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>updateDetails()));
                    },
                    title: const Text('Update Field Infos', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
