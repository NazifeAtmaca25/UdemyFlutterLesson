import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _aktifStep = 0;
  String name = '', mail = '', passwprd = '';
  List<Step> allSteps = [];
  bool hata = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    allSteps = _allSteps();
    return Scaffold(
      appBar: AppBar(title: Text("Stepper Kullanımı")),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Devam"),
                ),
                SizedBox(width: 25),
                ElevatedButton(
                  onPressed: details.onStepCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Geri Gel"),
                ),
              ],
            );
          },
          currentStep: _aktifStep,
          steps: allSteps,
          /*onStepTapped: (tiklanilanStep){ // ileri tuşlarına basmadan kontrol olmadan diğer steplere atlamanısağlıyor
              setState(() {
                _aktifStep=tiklanilanStep;
              });
          },*/
          onStepContinue: () {
            setState(() {
              _ileriButtonControl();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> steps = <Step>[
      Step(
        title: Text("Username Başlık"),
        subtitle: Text("Username Altbaşlık"),
        isActive: true,
        state: _statleleriAyarla(0),
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "Username Label",
            hintText: "Username Hint",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 6) {
              return "Kullanıcı adı en az 6 karakter olmalı";
            }
            return null;
          },
          onSaved: (value) {
            name = value!;
          },
        ),
      ),
      Step(
        title: Text("Mail Başlık"),
        subtitle: Text("Mail Altbaşlık"),
        isActive: true,
        state: _statleleriAyarla(1),
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            labelText: "Mail Label",
            hintText: "Mail Hint",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 6 || !value.contains("@")) {
              return "Geçerli mail adresi giriniz!";
            }
            return null;
          },
          onSaved: (value) {
            mail = value!;
          },
        ),
      ),
      Step(
        title: Text("Şifre Başlık"),
        subtitle: Text("Şifre Altbaşlık"),
        isActive: true,
        state: _statleleriAyarla(2),
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "Şifre Label",
            hintText: "Şifre Hint",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 10) {
              return "Şifre en az 10 karakter olmalı";
            }
            return null;
          },
          onSaved: (value) {
            passwprd = value!;
          },
        ),
      ),
    ];
    return steps;
  }

  StepState _statleleriAyarla(int step) {
    if (_aktifStep == step) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButtonControl() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formuTamamla();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formuTamamla() {
    debugPrint("Girilen değerler : isim=>$name mail=>$mail şifre=>$passwprd");
  }
}
