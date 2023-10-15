import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:irrshed/screens/managerPage.dart';
import 'package:irrshed/services/authServices.dart';
import '../helpers/sharedPreferences.dart';
import 'loginPage.dart';

class registePage extends StatefulWidget {
  const registePage({Key? key}) : super(key: key);

  @override
  State<registePage> createState() => _registePageState();
}

class _registePageState extends State<registePage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  bool isLoading = false;
  String emailSaved = "";
  String usernameSaved = "";
  String designation = "";
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: isLoading? const Center(
          child: CircularProgressIndicator( color: Colors.blue,),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 90),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget> [
                  const Text(
                    "Welcome!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    "Please enter your details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //Image.asset("assets/loginImage.png"),

                  const SizedBox(
                    height: 50,
                  ),

                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text("Full Name"),
                      hintText: "Enter Your Name Here",
                      border: OutlineInputBorder(),
                    ),

                    validator: (val){
                      if(val!.length < 0){
                        return "Name Field can't be empty";
                      }
                    },

                    onChanged: (val){
                      fullName = val;
                    },
                  ),

                  const SizedBox(
                    height: 30,
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
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      label: Text("Phone Number"),
                      hintText: "Enter Phone Number",
                      border: OutlineInputBorder(),
                    ),

                    validator: (val){
                      if(val!.length < 0){
                        return "phone Number can't be empty";
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
                    controller: designationController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.work_history),
                      label: Text("Designation"),
                      hintText: "Designation",
                      border: OutlineInputBorder(),
                    ),

                    validator: (val){
                      if(val!.length < 0){
                        return "Designation can't be empty";
                      }
                    },

                    onChanged: (val){
                      designation = val;
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    obscureText: true,
                    controller: passwordConfirmationController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed:() {}, icon: Icon(Icons.remove_red_eye)),
                      label: Text("password"),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                    ),

                    validator: (val){
                      if(val!.length < 0){
                        return "Password can't be empty";
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed:() {}, icon: Icon(Icons.remove_red_eye)),
                      label: Text("confirm password"),
                      hintText: "Confirm Password",
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
                    height:  30,
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
                          register();
                        },
                        child: const Text( "Register", style: TextStyle(fontSize: 18), )),
                  ),

                  const SizedBox(
                    height:  2,
                  ),

                  Text.rich(
                      TextSpan(
                          text: "Don't Have An Account ",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "login Here",
                                style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
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

  register() async {
    try{
      if (formKey.currentState!.validate()){
        setState(() {
          usernameSaved = userNameController.text;
          emailSaved = emailController.text;
          isLoading = false;
        });
        await authService.registerUserWithEmailAndPassword(designation, fullName, email, password).then((value) async{
          if(value == true){
            //saving the shared preference state
            await helperFunctions().saveUserLoginStatus(true);
            await helperFunctions().setUserEmail(emailController.text);
            await helperFunctions().setUserName(userNameController.text);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>managerPage()));

          }else{
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Registration failed'),
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
    }catch(e){
      print("Error is");
      print(e);
    }
  }
}
