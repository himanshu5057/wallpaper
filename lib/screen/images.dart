import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data with ChangeNotifier {
  String url;
  void image(String img) {
    url = img;
    notifyListeners();
  }
}

class Images extends StatelessWidget {
  final String id;
  final String imageURL;
  Images(this.id, this.imageURL);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<Data>(context, listen: false).image(imageURL),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.2,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.black),
            image: DecorationImage(
                image: NetworkImage(imageURL), fit: BoxFit.cover)),
      ),
    );
  }
}
