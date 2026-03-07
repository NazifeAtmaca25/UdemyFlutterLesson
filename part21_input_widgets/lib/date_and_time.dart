import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  @override
  Widget build(BuildContext context) {
    DateTime suan=DateTime.now();
    DateTime besayOnce=DateTime(2026,suan.month-6);
    DateTime yirmiGunSonra=DateTime(2026,suan.month,suan.day+20);
    TimeOfDay suanSaat=TimeOfDay.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih ve Saat Seç"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              showDatePicker(context: context, firstDate: besayOnce, lastDate: yirmiGunSonra,initialDate: suan,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(onPrimary: Colors.orange, onSurface: Colors.red),
                      datePickerTheme: const DatePickerThemeData(
                        headerBackgroundColor: Colors.blue,
                        backgroundColor: Colors.yellow,
                        headerForegroundColor: Colors.black,
                        surfaceTintColor: Colors.pink,
                      ),
                    ),
                    child: child!,
                  );
                },
              ).then((secilenTarih){
                debugPrint(secilenTarih.toString());
                debugPrint(secilenTarih!.toIso8601String());
                debugPrint(secilenTarih.millisecondsSinceEpoch.toString());
                debugPrint(secilenTarih.toUtc().toString());
                debugPrint(secilenTarih.add(Duration(days: 10)).toString());
                var yeniDate=DateTime.parse(secilenTarih.toUtc().toString());
                debugPrint(yeniDate.toIso8601String());
                print("********************");
                print(formatDate(secilenTarih, [yyyy, '-', mm, '-', dd]));
                print(formatDate(secilenTarih, [dd, '-', mm, '-', yyyy]));
              });
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: Text("Tarih Seç")),
            ElevatedButton(onPressed: (){
              showTimePicker(context: context, initialTime: suanSaat,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.dark(onPrimary: Colors.orange, onSurface: Colors.red),
                        timePickerTheme: TimePickerThemeData(
                          backgroundColor: Colors.yellow,
                          hourMinuteColor: Colors.green,
                          hourMinuteTextColor: Colors.pink,
                          timeSelectorSeparatorColor:WidgetStateProperty.all<Color?>(Colors.black),
                          dialBackgroundColor: Colors.purple,

                        )
                      ),
                      child: child!,
                    );
                  }
              ).then((secilenSaat){
                debugPrint(secilenSaat!.format(context));
                debugPrint(secilenSaat.hour.toString()+":"+secilenSaat.minute.toString());
              });
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), child: Text("Saat Seç"))

          ],
        ),
      ),
    );
  }
}
