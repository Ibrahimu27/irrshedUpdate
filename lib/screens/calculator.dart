import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String irrigationEquipment = "irrigation";
  String result = "result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please Select Irrigation Equipment:",
                  style: TextStyle(fontSize: 20),),

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
                    hint: Text(irrigationEquipment),
                    items: <String>[
                      'PIVOT',
                      'SEMI SOLID',
                      'RHINO & JETGUN',
                      'FLOOD',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        irrigationEquipment = newValue!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 15,),

                const Text("Enter Irrigation Interval:",style: TextStyle(fontSize: 20),),
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
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Irrigation Interval",
                      ),
                    )
                ),

                const SizedBox(height: 20,),

                const Text("Speed (Center Pivot)", style: TextStyle(fontSize: 20),),
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
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Speed",
                      ),
                    )
                ),

                const SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){},
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

                const SizedBox(height: 20,),

                const Text("Result", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 5,),

                Center(
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor.withOpacity(0.6),
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    child: Text(result, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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
