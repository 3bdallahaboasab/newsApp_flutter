import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/components/constans/const.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../layout/webView.dart';

Widget buildArticalItem(articles, context) => InkWell(
      onTap: () {
        navigatTo(context, MyWidget(articles['url']));
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(
                fit: BoxFit.cover,
                width: 150,
                height: 180,
                image: articles['urlToImage'] != null
                    ? NetworkImage(articles['urlToImage'])
                    : NetworkImage(
                        "https://webcolours.ca/wp-content/uploads/2020/10/webcolours-unknown.png")),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      '${articles['title']}',
                      maxLines: 4,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '${articles['source']['name']}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      getDateFormated(articles['publishedAt']),
                      // style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                ]),
          ),
        ),
      ]),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(1),
      child: Divider(
        height: 20,
        color: Colors.grey,
      ),
    );

void navigatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
