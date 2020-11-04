import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/dummyData.dart';
import 'package:wallpaper/screen/images.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var _init = true;
  bool loading = true;
  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<Dummy>(context).fetch().then((value) => loading = false);
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<Dummy>(context);
    // final url = ModalRoute.of(context).settings.arguments as String;
    return loading
        ? Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.grey[300],
            body: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Title(
                    color: Colors.white,
                    child: Text(
                      "Wallpaper",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              Provider.of<Data>(context).url == null
                                  ? img.dummyData[0]["imageUrl"]
                                  : Provider.of<Data>(context).url),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: img.dummyData.length,
                      itemBuilder: (ctx, i) => Row(children: [
                        Images(img.dummyData[i]["id"],
                            img.dummyData[i]["imageUrl"])
                      ]),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {},
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        "Set on Lock Screen",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04)
              ],
            ),
          );
  }
}
