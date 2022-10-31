import 'package:flutter/material.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/shop_App/login/shop_login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/shop_login.dart';

class PageModel {
  final String Title;
  final String header;
  final String img;

  PageModel({required this.header, required this.img, required this.Title});
}

List<PageModel> onBoard = [
  PageModel(
      Title: "On Boarding one",
      header: "On Boarding one",
      img:
          "https://img.freepik.com/free-vector/muslim-family-buying-food-supermarket-arab-cartoon-characters-wheeling-shopping-cart-grocery-store-vector-illustration-retail-lifestyle-arab-people-concept_74855-10117.jpg?w=740&t=st=1665323602~exp=1665324202~hmac=b7f57a6bb8099cf8841da7022288160f213b9a7d47ebb27f4da614bedee03fbd"),
  PageModel(
      Title: "On Boarding 2",
      header: "On Boarding 2",
      img:
          "https://img.freepik.com/free-vector/muslim-family-buying-food-supermarket-arab-cartoon-characters-wheeling-shopping-cart-grocery-store-vector-illustration-retail-lifestyle-arab-people-concept_74855-10117.jpg?w=740&t=st=1665323602~exp=1665324202~hmac=b7f57a6bb8099cf8841da7022288160f213b9a7d47ebb27f4da614bedee03fbd"),
  PageModel(
      Title: "On Boarding 3",
      header: "On Boarding 3",
      img:
          "https://img.freepik.com/free-vector/muslim-family-buying-food-supermarket-arab-cartoon-characters-wheeling-shopping-cart-grocery-store-vector-illustration-retail-lifestyle-arab-people-concept_74855-10117.jpg?w=740&t=st=1665323602~exp=1665324202~hmac=b7f57a6bb8099cf8841da7022288160f213b9a7d47ebb27f4da614bedee03fbd"),
];

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

var onboardController = PageController();
bool isLast = false;

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return onBoarding(onBoard[index]);
                },
                itemCount: onBoard.length,
                physics: BouncingScrollPhysics(),
                controller: onboardController,
                onPageChanged: (int index) {
                  if (index == onBoard.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    count: onBoard.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.blue,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 2),
                    controller: onboardController,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        navigatAndKill(context, ShopLoginScreen());
                      } else {
                        onboardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

Widget onBoarding(PageModel model) => Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Image(
          image: NetworkImage("${model.img}"),
        ),
        SizedBox(
          height: 150,
        ),
        Text(
          "${model.header}",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "${model.Title}",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
