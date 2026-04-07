import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({super.key});

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<UserModel>> getData() async {
    try {
      var response = await Dio().get(
        "https://jsonplaceholder.typicode.com/users",
      ); //veriler buradan çekilir
      List<UserModel> _users = [];
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        _users = (response.data as List)
            .map((element) => UserModel.fromJson(element))
            .toList(); //aldığımız dataları usermodele uygun olacak şekilde yerleştiriyoruz
      }
      return _users;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  late final Future<List<UserModel>> _listeyiDoldur;

  @override
  void initState() {
    super.initState();
    _listeyiDoldur = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Remote Api with Dio")),
      body: Center(
        child: FutureBuilder(
          future: _listeyiDoldur,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserModel> userList = snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  var user = userList[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.address.toString()),
                    leading: Text(user.id.toString()),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
