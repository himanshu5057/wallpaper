import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Model {
  final String id;
  final String imageURL;
  Model({@required this.id, @required this.imageURL});
}

class Dummy with ChangeNotifier {
  List dummyData = [];
  Future<void> fetch() async {
    // final filterString='orderBy="id"&equalTo="$id"';
    try {
      final url1 = "https://wallpaper-cfac9.firebaseio.com/ids.json";
      final response = await http.get(url1);
      List dummyd = [];
      final extractedData = json.decode(response.body) as List<dynamic>;

      if (extractedData == null) {
        return;
      }
      extractedData.forEach((idd) {
        if (idd != null) {
          dummyd.add(idd);
        }
      });
      dummyData = dummyd;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
  // ignore: non_constant_identifier_names
  //   static final Dummydata=  [
  //   Model(id: '1', imageUrl: "https://images.unsplash.com/photo-1559251606-c623743a6d76?ixlib=rb-1.2.1&w=1000&q=80.jpg"),
  //   Model(id: "2", imageUrl: "https://www.sammobile.com/wp-content/uploads/2019/03/keyguard_default_wallpaper_silver-540x540.png")
  // ];
}
