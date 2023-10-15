import 'package:flutter/material.dart';

class weatherData extends StatefulWidget {
  const weatherData({Key? key}) : super(key: key);

  @override
  State<weatherData> createState() => _weatherDataState();
}

class _weatherDataState extends State<weatherData> {
  TextEditingController weatherDataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEATHER DATA"),
        centerTitle: true,
      ),

      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Daily Evaporation', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                      child: TextField(
                        controller: weatherDataController,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:90),
                child: GestureDetector(
                  onTap: (){

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
          )
      ),
    );
  }
}
