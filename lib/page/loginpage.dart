import 'package:authentest_119/page/homepage.dart';
import 'package:authentest_119/page/registerpage.dart';
import 'package:authentest_119/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        backgroundColor: Color.fromARGB(255, 9, 10, 10),
      ),
      body: SafeArea(
          child: Form(   
                     
        key: _fromkey,
        child: ListView(
          
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอก Email";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอก Password";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  
                  if (_fromkey.currentState!.validate()) {
                    print("Successful");
                    AuthService.loginUser(_emailController.text, _passwordController.text).then((value){
                      if( value == 1){
                        Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage())
                );
                      }
                    });
                  }
                },
                child: const Text("Login")),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Register())
                );
            }, child: const Text("Register"))
          ],
        ),
      )),
    );
  }
}
