import 'package:authentest_119/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _tellController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  String?UserTypr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: Form(
          key:_fromkey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                validator:(value) {
                  if(value!.isEmpty){
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
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอก name";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tellController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอก tell";
                }
                return null;
              },
            ),
            RadioListTile(
                title: Text('อาจารย์'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'อาจารย์', groupValue: UserTypr,
                 onChanged: (value) {
                   setState(() {
                     UserTypr = value;
                   });
                 }),
              RadioListTile(
                title: Text('เจ้าหน้าที่'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'เจ้าหน้าที่', groupValue: UserTypr,
                 onChanged: (value) {
                   setState(() {
                     UserTypr = value;
                   });
                 }),
                 RadioListTile(
                title: Text('อาจารย์'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'อาจารย์', groupValue: UserTypr,
                 onChanged: (value) {
                   setState(() {
                     UserTypr = value;
                   });
                 }),
                 RadioListTile(
                title: Text('นิสิต'),
                controlAffinity: ListTileControlAffinity.platform,
                value: 'นิสิต', groupValue: UserTypr,
                 onChanged: (value) {
                   setState(() {
                     UserTypr = value;
                   });
                 }),
            ElevatedButton(
                onPressed: () {
                  
                  if (_fromkey.currentState!.validate()) {
                    
                    print("WELCOME");
                    print(_emailController.toString());
                    AuthService.registerUser(
                     _emailController.text, _passwordController.text , _nameController.text , _tellController.text , _typeController.text).then((value) {
                        if (value == 1){
                          Navigator.pop(context);
                        }
                      });
                    
                  }
                },
                child: const Text("Register")),
            ]
          ),
      )),
    );
  }
}