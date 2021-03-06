import 'package:bbmsg_mobile/backend/server.dart';
import 'package:bbmsg_mobile/ui/newPages/screen/home/post/postnew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class InstaStories extends StatelessWidget {
  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Stories",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      new Row(
        children: <Widget>[
          new Icon(Icons.play_arrow),
          new Text("Watch All", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );

  final deprecateStories = Expanded(
    child: new Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => new Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Opacity(
              opacity: index == 0 ? 0.5 : 1,
              child: new Container(
                width: ScreenUtil().setWidth(60),
                height: ScreenUtil().setHeight(83),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(appGet.commentpost['data'][index]
                              ['author']['name']
                          .toString())),
                ),
                margin:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(7)),
              ),
            ),
            index == 0
                ? Positioned(
                    right: 8.0,
                    child: Opacity(
                      opacity: 0.4,
                      child: new Container(
                        width: ScreenUtil().setWidth(60),
                        height: ScreenUtil().setHeight(83),
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              HexColor('#00ADEE'),
                              HexColor('#7850FF'),
                            ],
                          ),
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: new Icon(
                          Icons.add,
                          size: 32.0,
                          color: Colors.white,
                        ),
                      ),
                    ))
                : new Container()
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(16.0),
      child: Postnew(),
    );
  }
}
