import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class TextFormFieldUsing extends StatefulWidget {
  const TextFormFieldUsing({super.key});

  @override
  State<TextFormFieldUsing> createState() => _TextFormFieldUsingState();
}

class _TextFormFieldUsingState extends State<TextFormFieldUsing> {
  String _name="",_email="",_password="";
  final _formKey= GlobalKey<FormState>();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Form Field Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.orange),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'UserName'
                    ),
                    onSaved: (value){//butona basılıp onaylandıktan sonra değer atanır
                      _name=value!;
                    },
                    validator: (value){
                      if(value!.length<4){
                        return "Username en az 4 karakterli olmalı";
                      }else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.pink),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Email",
                    ),
                    onSaved: (value){
                      _email=value!;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email boş olamaz";
                      } else if(!EmailValidator.validate(value)){
                        return "Geçerli bir mail adresi giriniz";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.blue),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Password",
                    ),
                    onSaved: (value){
                      _password=value!;
                    },
                    onChanged: (value) {
                      passNotifier.value = PasswordStrength.calculate(text: value);
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Must contain at least one uppercase letter';
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Must contain at least one lowercase letter';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Must contain at least one digit';
                      }
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Must contain at least one special character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  PasswordStrengthChecker(strength: passNotifier),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    bool _validate=_formKey.currentState!.validate();
                    if(_validate){
                      _formKey.currentState!.save();//bu işlem sayesinde onSaveler çalışır
                      String result =
                          'username:$_name\nemail:$_email\nSifre:$_password';

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result,style: TextStyle(fontSize: 24),),backgroundColor: Colors.orange,));
                    _formKey.currentState!.reset();
                    }
                  },
                      child: Text("Onayla"))
                ],
              )),
        ),
      ),
    );
  }
}
