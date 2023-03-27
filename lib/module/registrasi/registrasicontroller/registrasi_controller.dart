import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task3/constant/constantfile.dart';
import 'package:task3/module/login/view/login_page.dart';

class RegistrasiController with ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController isNamaCont = TextEditingController();
  TextEditingController isEmailCont = TextEditingController();
  TextEditingController isPasswordCont = TextEditingController();

  addUserRegistarsi(BuildContext context) async{
    if(formKey.currentState!.validate()){
      if(isNamaCont.text.isEmpty || isEmailCont.text.isEmpty || isPasswordCont.text.isEmpty){
        print("Data is cannot be Empty");
      }else{
        try{
          final response = await http.post(Uri.parse(ConstantFile.url + "registrasi.php"), body: {
            "nama": isNamaCont.text,
            "email": isEmailCont.text,
            "password": isPasswordCont.text,
          });
          var addDataUser = jsonDecode(response.body);
          if(addDataUser != null){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("Registrasi Successfully")
                ));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("Registrasi Failed")
                ));
          }
        }catch(e){
          print(e);
        }
      }
    }
  }

  bool isObsurce = true;

  inHidePassword(){
    if(isObsurce == true){
      isObsurce = false;
      notifyListeners();
    }else{
      isObsurce = true;
      notifyListeners();
    }
  }

}