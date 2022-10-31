import 'package:flutter/material.dart';

import 'package:newsapp/components/constans/const.dart';

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

void navigatAndKill(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      ((route) {
        return false;
      }),
    );

Widget defultFormField({
  required Function validate,
  required bool isPassowrd,
  required TextEditingController controller,
  required String label,
  required IconData icon,
  IconData? suffixicon,
}) =>
    TextFormField(
      style: TextStyle(fontSize: 15),
      validator: (value) {
        return validate(value);
      },
      obscureText: isPassowrd,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: Text(label),
        prefixIcon: Icon(
          icon,
          color: Colors.blue,
        ),
        suffixIcon: Icon(
          suffixicon,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );

Widget defultButton({
  double width = 200,
  double highet = 50,
  required String text,
  double? elevation,
  required Function onPressed,
}) =>
    Container(
      width: width,
      height: highet,
      child: RaisedButton(
        onPressed: () {
          return onPressed();
        },
        child: Text(text),
        color: Colors.blue,
        elevation: elevation,
        textColor: Colors.white,
      ),
    );
