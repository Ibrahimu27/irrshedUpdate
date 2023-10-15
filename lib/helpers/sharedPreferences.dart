import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class helperFunctions {
  final String userNameKey = "USERNAMEKEY";
  final String userLoginStatusKey = "LOGINSTATUSKEY";
  final String designationKey = "DESIGNATIONKEY";
  final String userEmailKey = "EMAILKEY";


//-------------------login Status----------------------------------//
  Future<bool> saveUserLoginStatus(bool loginStatus) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return await sp.setBool(userLoginStatusKey, loginStatus);
  }
  Future<bool> getUserLoginStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(userLoginStatusKey)!;
  }

//-------------------designation-----------------------------------//
  Future<bool> setDesignation(String designation) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(designationKey, designation);
  }
  Future<String?> getDesignation() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(designationKey);
  }


  //-------------------user name-----------------------------------//
  Future<bool> setUserName(String userName) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userNameKey, userName);
  }
  Future<String?> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userNameKey);
  }

  //-------------------user email-----------------------------------//
  Future<bool> setUserEmail(String userName) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userEmailKey, userEmailKey);
  }
  Future<String?> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userEmailKey);
  }

}