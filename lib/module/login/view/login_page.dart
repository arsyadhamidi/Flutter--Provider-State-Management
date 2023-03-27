import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/module/login/login_controller/logincontroller.dart';
import 'package:task3/module/registrasi/view/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Image.asset("assets/images/logo.png", scale: 3,),
                SizedBox(height: 50),
                Consumer<LoginController>(
                  builder: (context, loginController, child) {
                    return TextFormField(
                      controller:  loginController.isEmailCont,
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
                Consumer<LoginController>(
                  builder: (context, loginController, child) {
                    return TextFormField(
                      controller: loginController.isPasswordCont,
                      obscureText: loginController.isObsurce,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: (){
                                loginController.inHidePassword();
                              },
                              icon: Icon(loginController.isObsurce ? CupertinoIcons.eye : CupertinoIcons.eye_slash)
                          ),
                          hintText: "Password",
                          prefixIcon: Icon(CupertinoIcons.padlock),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Consumer<LoginController>(
                    builder: (context, loginController, child) {
                      return MaterialButton(
                        onPressed: (){
                          loginController.addUserLogin(context);
                        },
                        height: 50,
                        minWidth: double.infinity,
                        color: Colors.green,
                        child: Text('Login', style: TextStyle(color: Colors.white)),
                      );
                    },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrasiPage()));
                    }, child: Text("Register")),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
