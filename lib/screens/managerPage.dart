import 'package:flutter/material.dart';
import 'package:irrshed/helpers/sharedPreferences.dart';
import 'package:irrshed/screens/application.dart';
import 'package:irrshed/screens/calculator.dart';
import 'package:irrshed/screens/dashboard.dart';

import 'managerTrialPage.dart';

class managerPage extends StatefulWidget {
  const managerPage({Key? key}) : super(key: key);

  @override
  State<managerPage> createState() => _managerPageState();
}

class _managerPageState extends State<managerPage> {
  String userName = "";
  String designation = "";
  String selectedValue = "AREA 2";
  String zoneSelectedValue = "WEST";
  String sectionSelectedValue = "SECTION A";
  String irrigationRegimeSelectedValue = "PIVOT";
  String fieldSelectedValue = "BP7a";
  double decisiveIndex = 0;
  String fieldName = "AP10A";

  //getting user details
  getuserDetails() async {
    //-----------------------trial-------------------------------//
    await helperFunctions().setUserName("field manager");

    await helperFunctions().getUserName().then((value) {
      setState(() {
        userName = value!;
      });
    });

    await helperFunctions().getDesignation().then((value) {
      setState(() {
        designation = value!;
      });
    });
  }

  @override
  void initState() {
    getuserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Theme
                      .of(context)
                      .primaryColor,
                  radius: 40,
                  child: const Icon(Icons.person),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text("Hello ${userName}", style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24),),
                Text("${designation}", style: const TextStyle(fontSize: 20),),

                const SizedBox(
                  height: 50,
                ),

                const Text(
                  "Select Zone", style: TextStyle(fontSize: 20),),

                const SizedBox(
                  height: 5,
                ),

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
                        zoneSelectedValue = newValue!;
                        if (zoneSelectedValue == "WEST") {
                          decisiveIndex = decisiveIndex + 3.1;
                        } else if (zoneSelectedValue == "EAST") {
                          decisiveIndex = decisiveIndex + 3.2;
                        } else if (zoneSelectedValue == "KITENGULE") {
                          decisiveIndex = decisiveIndex + 3.3;
                        }
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Text(
                  "Select Area", style: TextStyle(fontSize: 20),),

                const SizedBox(
                  height: 5,
                ),

                areaBox(),

                SizedBox(
                  height: 15,
                ),

                const Text(
                  "Please Select Section", style: TextStyle(fontSize: 20),),

                const SizedBox(
                  height: 5,
                ),

                sectionBox(),

                const SizedBox(
                  height: 15,
                ),

                const Text(
                  "Please Select Irrigation Regime",
                  style: TextStyle(fontSize: 20),),

                const SizedBox(
                  height: 5,
                ),

                designation == "field manager" ? Container(
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
                    hint: Text(irrigationRegimeSelectedValue),
                    items: <String>[
                      'PIVOT',
                      'OUTFALL'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        irrigationRegimeSelectedValue = newValue!;
                        if (irrigationRegimeSelectedValue == "PIVOT") {
                          decisiveIndex = decisiveIndex + 4.1;
                        } else
                        if (irrigationRegimeSelectedValue == "SEMI SOLID") {
                          decisiveIndex = decisiveIndex + 4.2;
                        } else
                        if (irrigationRegimeSelectedValue == "RHINO & JETGUN") {
                          decisiveIndex = decisiveIndex + 4.3;
                        } else if (irrigationRegimeSelectedValue == "FLOOD") {
                          decisiveIndex = decisiveIndex + 4.4;
                        }
                      });
                    },
                  ),
                ) : Container(
                  height: 0.0001,
                ),

                const SizedBox(
                  height: 15,
                ),

                const Text(
                  "Please Select field", style: TextStyle(fontSize: 20),),


                const SizedBox(
                  height: 5,
                ),

                fieldBox(),

                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard(fieldName: fieldName,)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .primaryColor
                            .withOpacity(0.6),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Submit"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  sectionBox() {
    if (selectedValue == "AREA 1") {
      return  Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'SECTION K',
            'SECTION T',
            'SECTION F',

          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (sectionSelectedValue == "SECTION K") {
                decisiveIndex = decisiveIndex + 6.2;
              } else if (sectionSelectedValue == "SECTION T") {
                decisiveIndex = decisiveIndex + 6.7;
              } else if (sectionSelectedValue == "SECTION F") {
                decisiveIndex = decisiveIndex + 5.6;
              }
            });
          },
        ),
      );
    } else if (selectedValue == "AREA 2") {
      return Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'SECTION C',
            'SECTION D',
            'SECTION E',
            'SECTION M',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (sectionSelectedValue == "SECTION C") {
                decisiveIndex = decisiveIndex + 5.3;
              } else if (sectionSelectedValue == "SECTION D") {
                decisiveIndex = decisiveIndex + 5.4;
              } else if (sectionSelectedValue == "SECTION M") {
                decisiveIndex = decisiveIndex + 6.4;
              } else if (sectionSelectedValue == "SECTION E") {
                decisiveIndex = decisiveIndex + 5.5;
              } else if (sectionSelectedValue == "SECTION M") {
                decisiveIndex = decisiveIndex + 6.4;
              }
            });
          },
        ),
      );
    } else if (selectedValue == "AREA 3") {
      return Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'SECTION A',
            'SECTION B',
            'SECTION G',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (sectionSelectedValue == "SECTION A") {
                decisiveIndex = decisiveIndex + 5.1;
              } else if (sectionSelectedValue == "SECTION B") {
                decisiveIndex = decisiveIndex + 5.2;
              } else if (sectionSelectedValue == "SECTION G") {
                decisiveIndex = decisiveIndex + 5.7;
              }
            });
          },
        ),
      );
    } else if (selectedValue == "AREA 4") {
      return Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'SECTION H',
            'SECTION I',
            'SECTION O',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (sectionSelectedValue == "SECTION H") {
                decisiveIndex = decisiveIndex + 5.8;
              } else if (sectionSelectedValue == "SECTION I") {
                decisiveIndex = decisiveIndex + 5.9;
              } else if (sectionSelectedValue == "SECTION O") {
                decisiveIndex = decisiveIndex + 6.6;
              }
            });
          },
        ),
      );
    } else if (selectedValue == "AREA 5") {
      return Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'SECTION J',
            'SECTION L',
            'SECTION N',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (sectionSelectedValue == "SECTION J") {
                decisiveIndex = decisiveIndex + 6.0;
              } else if (sectionSelectedValue == "SECTION L") {
                decisiveIndex = decisiveIndex + 6.3;
              } else if (sectionSelectedValue == "SECTION N") {
                decisiveIndex = decisiveIndex + 6.5;
              }
            });
          },
        ),
      );
    } else if (selectedValue == "AREA A") {
      return Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'AREA 1',
            'AREA 2',
            'AREA 3',
            'AREA 4',
            'AREA 5',
            'AREA A',
            'AREA B',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (selectedValue == "AREA 1") {
                decisiveIndex = decisiveIndex + 1.1;
              } else if (selectedValue == "AREA 2") {
                decisiveIndex = decisiveIndex + 1.2;
              } else if (selectedValue == "AREA 3") {
                decisiveIndex = decisiveIndex + 1.3;
              } else if (selectedValue == "AREA 4") {
                decisiveIndex = decisiveIndex + 1.4;
              } else if (selectedValue == "AREA 5") {
                decisiveIndex = decisiveIndex + 1.5;
              } else if (selectedValue == "AREA A") {
                decisiveIndex = decisiveIndex + 1.6;
              } else if (selectedValue == "AREA B") {
                decisiveIndex = decisiveIndex + 1.7;
              }
            });
          },
        ),
      );
    } else if (selectedValue == "AREA B") {
      return Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'AREA 1',
            'AREA 2',
            'AREA 3',
            'AREA 4',
            'AREA 5',
            'AREA A',
            'AREA B',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              sectionSelectedValue = newValue!;
              if (selectedValue == "AREA 1") {
                decisiveIndex = decisiveIndex + 1.1;
              } else if (selectedValue == "AREA 2") {
                decisiveIndex = decisiveIndex + 1.2;
              } else if (selectedValue == "AREA 3") {
                decisiveIndex = decisiveIndex + 1.3;
              } else if (selectedValue == "AREA 4") {
                decisiveIndex = decisiveIndex + 1.4;
              } else if (selectedValue == "AREA 5") {
                decisiveIndex = decisiveIndex + 1.5;
              } else if (selectedValue == "AREA A") {
                decisiveIndex = decisiveIndex + 1.6;
              } else if (selectedValue == "AREA B") {
                decisiveIndex = decisiveIndex + 1.7;
              }
            });
          },
        ),
      );
    }
  }

  areaBox() {
    if (zoneSelectedValue == "WEST") {
      return Container(
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
          hint: Text(selectedValue),
          items: <String>[
            'AREA 3',
            'AREA 4',
            'AREA 5',

          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
              if (selectedValue == "AREA 1") {
                decisiveIndex = decisiveIndex + 1.1;
              } else if (selectedValue == "AREA 2") {
                decisiveIndex = decisiveIndex + 1.2;
              } else if (selectedValue == "AREA 3") {
                decisiveIndex = decisiveIndex + 1.3;
              } else if (selectedValue == "AREA 4") {
                decisiveIndex = decisiveIndex + 1.4;
              } else if (selectedValue == "AREA 5") {
                decisiveIndex = decisiveIndex + 1.5;
              } else if (selectedValue == "AREA A") {
                decisiveIndex = decisiveIndex + 1.6;
              } else if (selectedValue == "AREA B") {
                decisiveIndex = decisiveIndex + 1.7;
              }
            });
          },
        ),
      );
    } else if (zoneSelectedValue == "EAST") {
      return designation == "field manager" ? Container(
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
          hint: Text(selectedValue),
          items: <String>[
            'AREA 1',
            'AREA 2',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
              if (selectedValue == "AREA 1") {
                decisiveIndex = decisiveIndex + 1.1;
              } else if (selectedValue == "AREA 2") {
                decisiveIndex = decisiveIndex + 1.2;
              } else if (selectedValue == "AREA 3") {
                decisiveIndex = decisiveIndex + 1.3;
              } else if (selectedValue == "AREA 4") {
                decisiveIndex = decisiveIndex + 1.4;
              } else if (selectedValue == "AREA 5") {
                decisiveIndex = decisiveIndex + 1.5;
              } else if (selectedValue == "AREA A") {
                decisiveIndex = decisiveIndex + 1.6;
              } else if (selectedValue == "AREA B") {
                decisiveIndex = decisiveIndex + 1.7;
              }
            });
          },
        ),
      ) : Container(
        height: 0.0001,
      );
    } else if (zoneSelectedValue == "KITENGULE") {
      return designation == "field manager" ? Container(
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
          hint: Text(sectionSelectedValue),
          items: <String>[
            'AREA A',
            'AREA B',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
                value: value,
                child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
              if (selectedValue == "AREA 1") {
                decisiveIndex = decisiveIndex + 1.1;
              } else if (selectedValue == "AREA 2") {
                decisiveIndex = decisiveIndex + 1.2;
              } else if (selectedValue == "AREA 3") {
                decisiveIndex = decisiveIndex + 1.3;
              } else if (selectedValue == "AREA 4") {
                decisiveIndex = decisiveIndex + 1.4;
              } else if (selectedValue == "AREA 5") {
                decisiveIndex = decisiveIndex + 1.5;
              } else if (selectedValue == "AREA A") {
                decisiveIndex = decisiveIndex + 1.6;
              } else if (selectedValue == "AREA B") {
                decisiveIndex = decisiveIndex + 1.7;
              }
            });
          },
        ),
      ) : Container(
        height: 0.0001,
      );
    }
  }

  Widget buildDropdown(List<String> items, double incrementValue) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(2),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        hint: Text(fieldName),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            fieldName = newValue!;
            decisiveIndex += incrementValue;
          });
        },
      ),
    );
  }

  Widget fieldBox(){
    if(sectionSelectedValue == "SECTION A" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION B" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'BP10A', 'BP10B', 'BP10C', 'BP10D',
            'BP11A', 'BP11B', 'BP11C', 'BP11D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION C" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'CP10A', 'CP10B', 'CP10C', 'CP10D',
            'CP11A', 'CP11B', 'CP11C', 'CP11D',
            'CP12A', 'CP12B', 'CP12C',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION D" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'DP10A', 'DP10B', 'DP10C', 'DP10D',
            'DP11A', 'DP11B', 'DP11C', 'DP11D',
            'DP12A', 'DP12B', 'DP12C', 'DP12D',
            'DP13A', 'DP13B', 'DP13C', 'DP13D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION E" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'EP1A', 'EP1B', 'EP1C', 'EP1D',
            'EP10A', 'EP10B', 'EP10C', 'EP10D',
            'EP11A'
          ], 0.001);
    }if(sectionSelectedValue == "SECTION F" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'FP10A', 'FP10B', 'FP10C', 'FP10D', 'FP11A', 'FP11B', 'FP11C', 'FP11D', 'FP12A', 'FP12B',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION G" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION H" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION I" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION J" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION K" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION L" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION M" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION N" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION O" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION P" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION Q" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION R" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION S" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }if(sectionSelectedValue == "SECTION T" && irrigationRegimeSelectedValue == "PIVOT"){
      return buildDropdown(
          [
            'AP10A', 'AP10B', 'AP10C', 'AP10D',
            'AP11A', 'AP11B', 'AP11C', 'AP11D',
            'AP12A', 'AP12B', 'AP12C', 'AP12D',
          ], 0.001);
    }
    else{
      return Container(
        child: const Text("select section and pivot please", style: TextStyle(color: Colors.red),),
      );
    }
  }

}
