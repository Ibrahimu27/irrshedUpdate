import 'package:flutter/material.dart';
import 'package:irrshed/helpers/sharedPreferences.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  String userName = "";
  String designation = "";
  String email = "";


  getUserInformations() async {
    await helperFunctions().getUserName().then((value){
      setState(() {
        userName = value!;
      });
    });

    await helperFunctions().getDesignation().then((value){
      setState(() {
        designation = value!;
      });
    });

    await helperFunctions().getUserEmail().then((value){
      setState(() {
        email = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, top: 90),
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  child: Icon(Icons.person),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 130, left: 28.0),
                  child: Row(
                    children: [
                      const Text("NAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 20,),
                      Text(userName),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 28.0),
                  child: Row(
                    children: [
                      const Text("DESIGNATION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 20,),
                      Text(userName),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 28.0),
                  child: Row(
                    children: [
                      const Text("NAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 20,),
                      Text(userName),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 28.0),
                  child: Row(
                    children: [
                      const Text("NAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 20,),
                      Text(userName),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
