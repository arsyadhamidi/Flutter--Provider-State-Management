import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/module/login/view/login_page.dart';
import 'package:task3/module/registrasi/registrasicontroller/registrasi_controller.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegistrasiController>(
      create: (context) => RegistrasiController(),
      child:  Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Consumer<RegistrasiController>(
          builder: (context, registrasiController, child) {
            return Form(
              key: registrasiController.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      Spacer(),
                      Image.asset("assets/images/logo.png", scale: 3,),
                      SizedBox(height: 50),
                      Consumer<RegistrasiController>(
                        builder: (context, registrasiController, child) {
                          return TextFormField(
                            controller:  registrasiController.isNamaCont,
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                prefixIcon: Icon(CupertinoIcons.person),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()
                                ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Consumer<RegistrasiController>(
                        builder: (context, registrasiController, child) {
                          return TextFormField(
                            controller: registrasiController.isEmailCont,
                            decoration: InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Icon(CupertinoIcons.envelope),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()
                                )
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Consumer<RegistrasiController>(
                        builder: (context, registrasiController, child) {
                          return TextFormField(
                            obscureText: registrasiController.isObsurce,
                            controller: registrasiController.isPasswordCont,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: (){
                                      registrasiController.inHidePassword();
                                    },
                                    icon: Icon(registrasiController.isObsurce ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                                ),
                                hintText: "Password",
                                prefixIcon: Icon(CupertinoIcons.padlock),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()
                                )
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 30),
                      Consumer<RegistrasiController>(
                        builder: (context, registrasiController, child) {
                          return MaterialButton(
                            onPressed: (){
                              registrasiController.addUserRegistarsi(context);
                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: Colors.green,
                            child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                          );
                        },
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You have an account ?"),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          }, child: Text("Login")),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
