import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreIslemleri extends StatefulWidget {
  const FirestoreIslemleri({super.key});

  @override
  State<FirestoreIslemleri> createState() => _FirestoreIslemleriState();
}

class _FirestoreIslemleriState extends State<FirestoreIslemleri> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  StreamSubscription? _userSubcribe;

  @override
  void dispose() {
    _userSubcribe?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(db
        .collection("users")
        .doc()
        .id);
    debugPrint(db
        .collection("users")
        .id);
    return Scaffold(
      appBar: AppBar(title: Text("Cloud Firestore İşlemleri")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                addData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Add ile veri ekle"),
            ),
            ElevatedButton(
              onPressed: () {
                setData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: Text("Set ile veri ekle"),
            ),
            ElevatedButton(
              onPressed: () {
                updateData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: Text("Verileri güncelle"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Veriyi sil"),
            ),
            ElevatedButton(
              onPressed: () {
                veriyiOkuOneTime();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text("Veriyi Oku"),
            ),
            ElevatedButton(
              onPressed: () {
                veriyiOkuRealTime();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text("Veriyi Realtimeda Oku"),
            ),
            ElevatedButton(
              onPressed: () {
                streamDurdur();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text("Akışı durdur"),
            ),
            ElevatedButton(
              onPressed: () {
                batchKavrami();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              child: Text("Batch"),
            ),
            ElevatedButton(
              onPressed: () {
                transactionKavrami();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text("Transaction"),
            ),
            ElevatedButton(
              onPressed: () {
                queryingData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text("Querying data"),
            ),
          ],
        ),
      ),
    );
  }

  void addData() async {
    Map<String, dynamic> user = {};
    user["isim"] = "nazife";
    user["yas"] = 23;
    user["ogrenciMi"] = false;
    user["adres"] = {"il": "denizli", "ilçe": "merkezefendi"};
    user["renkler"] = FieldValue.arrayUnion(["pembe", "siyah", "mavi"]);
    user["tarih"] = FieldValue.serverTimestamp();
    await db.collection("users").add(user);
  }

  void setData() async {
    var yeniDocId = db
        .collection("users")
        .doc()
        .id;
    await db.doc("users/$yeniDocId").set({
      "isim": "ömer",
      "userId": yeniDocId,
    });

    await db.doc("users/TFtYwB16GCV2gZyujc68").set(
      {
        "okul": "Eskisehir Teknik Üniversitesi",
        "yas": FieldValue.increment(1),
        //yaşı bulup otomatik olarak kendisi değeri artırıyor
      },
      SetOptions(merge: true),
    ); //setoptiondaki merge işlemi yapmazsak doc iddeki
    // önceki verileri silip setteki yazılanları eklerdi. Setoption sayesinde güncelleme yapıyoruz
  }

  void updateData() async {
    await db.doc("users/iYnM2CNmfTdWF186hAmo").update({
      "isim": "nazifeAtmaca",
      "adres.ilçe": "çal",
    });
  }

  void deleteData() async {
    await db.doc("users/iYnM2CNmfTdWF186hAmo").delete();

    await db.doc('users/sNdIJXGgPUPl5L3sZGQK').update({
      'okul': FieldValue.delete(),
    });
  }

  void veriyiOkuOneTime() async {
    var userDocument = await db.collection("users").get();
    debugPrint(userDocument.size.toString());
    debugPrint(userDocument.docs.length.toString());
    for (var element in userDocument.docs) {
      debugPrint("Döküman id ${element.id}");
      Map userMap = element.data();
      debugPrint(userMap["isim"]);
    }

    var nazifeDoc = await db.doc("users/TFtYwB16GCV2gZyujc68").get();
    debugPrint(nazifeDoc.data()!["adres"]["il"]);
  }

  void veriyiOkuRealTime() {
    var userStream = db.collection("users").snapshots();
    var userDocStream = db
        .doc('users/lODl1rILhnEeqeiDjBbj')
        .snapshots(); //bir dökümantasyonun içine bakar
    _userSubcribe = userStream.listen((event) {
      for (var element in event.docChanges) {
        debugPrint(element.doc.data().toString());
      }
    });
  }

  Future<void> streamDurdur() async {
    await _userSubcribe?.cancel();
  }

  void batchKavrami() async {
    WriteBatch batch = db.batch();
    CollectionReference counterColRef = db.collection("counter");

    /*for(int i=0;i<100;i++){
      var yeniDoc=counterColRef.doc();
      batch.set(yeniDoc, {"sayac":++i,"id":yeniDoc.id});
    }*/

    /*var counterDocs= await counterColRef.get();
    for (var element in counterDocs.docs) {
      batch.update(element.reference, {"createdAt:" : FieldValue.serverTimestamp()});
    }*/

    var counterDocs = await counterColRef.get();
    for (var element in counterDocs.docs) {
      batch.delete(element.reference);
    }

    await batch.commit();
  }

  Future<void> transactionKavrami() async {
    db.runTransaction((transaction) async {
      DocumentReference<Map<String, dynamic>> nazifeRef = db.doc(
          "users/TFtYwB16GCV2gZyujc68");
      DocumentReference<Map<String, dynamic>> omerRef = db.doc(
          "users/TYMib9cLlb8pm2z16htU");

      var nazifeSnapshot = await transaction.get(nazifeRef);
      var omerSnapshot = await transaction.get(omerRef);

      var nazifeBakiye = nazifeSnapshot.data()!['para'];
      var omerBakiye = omerSnapshot.data()!['para'];
      if (nazifeBakiye > 100) {
        transaction.update(nazifeRef, {"para": nazifeBakiye - 100});
        transaction.update(omerRef, {"para": omerBakiye + 100});
      }
    });
  }

  Future<void> queryingData() async {
    var userRef = db.collection("users");
    //var sonuc= await userRef.where('isim',isEqualTo: "ömer").get();
    var sonuc = await userRef.where("renkler", arrayContains: 'yesil').get();
    /*for(var user in sonuc.docs){
      debugPrint(user.data().toString());
    }*/

    var sirala = await userRef.orderBy("yas", descending: false).get();
    /*for(var user in sirala.docs){
      debugPrint(user.data().toString());
    }*/

    var stringSearch = await userRef.orderBy('email').startAt(['nazife']).endAt(
        ['nazife' + '\uf8ff']).get();
    for (var user in stringSearch.docs) {
      debugPrint(user.data().toString());
    }
  }

  Future<void> kameraGaleriImageUpload() async {
    print('fonksiyon çalıstı');
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(source: ImageSource.gallery);
    print('image secildi ');
    if (_file == null) {
      print('image null ');
    }
    var _profileRef =
    FirebaseStorage.instance.ref('users/profil_resimleri/user_id');
    print(_file?.name.toString());
    var _task = _profileRef.putFile(File(_file!.path));
    debugPrint('yükleme başlatılacak');
    _task.whenComplete(() async {
      var _url = await _profileRef.getDownloadURL();
      debugPrint('yükleme bitti');
      db
          .doc('users/QPoLlmM3wLok9WQTlKrs')
          .set({'profile_pic': _url.toString()}, SetOptions(merge: true));
      debugPrint(_url);
    });
  }
}
