import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:irrshed/helpers/sharedPreferences.dart';
import 'package:irrshed/screens/managerPage.dart';

import '../services/authServices.dart';
import '../services/databaseServices.dart';
import 'registrationPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final formKey = GlobalKey<FormState>();
  String email = "";
  String emailSaved = "";
  String userNameSaved = "";
  String password = "";
  bool isLoading = false;
  AuthService authService = AuthService();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget> [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    "Login To Grab Your Compan Here Today",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      label: Text("email"),
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                    ),

                    validator: (val){
                      if(val!.length < 0){
                        return "email can't be empty";
                      }
                    },

                    onChanged: (val){
                      email = val;
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      label: Text("password"),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                    ),

                    validator: (val){
                      if(val!.length < 6){
                        return "Password must be at least 6 characters";
                      }
                    },
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                  ),

                  const SizedBox(
                    height:  60,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )
                        ),
                        onPressed: (){
                          login();
                        },
                        child: const Text( "login" )),
                  ),

                  const SizedBox(
                    height:  60,
                  ),

                  Text.rich(
                      TextSpan(
                          text: "Don't Have An Account ",
                          style: const TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Register Here",
                                style: const TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const registePage()));
                                }),

                          ]
                      ))

                ],
              ),

            ),
          ),
        )
    );
  }

  void login() async {
    if(formKey.currentState!.validate());
    setState(() {
      isLoading = true;
      emailSaved = emailController.text;
    });

    await authService.loginWithEmailAndPassword(email, password).then((value) async {
      if(value == true){
       // QuerySnapshot snapshot = await databaseServices(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email);

        //saving values to the shared preferences
        await helperFunctions().saveUserLoginStatus(true);
        await helperFunctions().setUserEmail(emailController.text);
        await helperFunctions().setUserName(usernameController.text);
        //await helperFunctions().SaveUserNameSF(
            //snapshot.docs[0]['fullname']);

        // nextScreenReplaced(context,  const homePage());

        Navigator.push(context, MaterialPageRoute(builder:(context) =>managerPage()));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Incorrect UserName Or Password'),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: 'Close',
                onPressed: (){
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),

            ));  //showa a snackbar
      }
    });
  }
}
