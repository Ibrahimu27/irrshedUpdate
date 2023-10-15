import 'package:flutter/material.dart';
import 'package:irrshed/screens/calculator.dart';

class irrigationReport extends StatefulWidget {
  const irrigationReport({Key? key}) : super(key: key);

  @override
  State<irrigationReport> createState() => _irrigationReportState();
}

class _irrigationReportState extends State<irrigationReport> {
  TextEditingController haByCenterPivotController = TextEditingController();
  TextEditingController haBySemiSolidController = TextEditingController();
  TextEditingController haByOtherEquipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DAILY IRRIGATION REPORT"),
        centerTitle: true,
        elevation: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 108.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('HA Irrigated By Center Pivot', style: TextStyle(fontSize: 18),),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextField(
                  controller: haByCenterPivotController,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 25,),
              Text('HA Irrigated By SemiSolid', style: TextStyle(fontSize: 18),),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextField(
                  controller: haBySemiSolidController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 25,),
              const Text('HA Irrigated By Other Equipment', style: TextStyle(fontSize: 18),),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextField(
                  controller: haBySemiSolidController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 200),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>calculator()));
                  },                 //-------------------------------------navigation
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
