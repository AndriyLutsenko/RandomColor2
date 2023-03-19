import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Color? pageColor;
  // Color? textColor;
  bool isTapText = false;
  // @override
  // void initState() {
  //   super.initState();
  //   pageColor = const Color.fromARGB(255, 255, 255, 255);
  //   textColor = const Color.fromARGB(255, 0, 0, 0);
  // }

  // int randomNumber(int num) {
  //   var random = Random();
  //   int randomNumber = random.nextInt(num);
  //   // print(randomNumber);
  //   return randomNumber;
  // }

  void randomPageColor() {
    setState(() {
      isTapText = false;
      pageColor = Color.fromARGB(
          // 255, randomNumber(256), randomNumber(256), randomNumber(256));
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256));
    });
  }

  Color randomTextColor() {
    Color? textColor;
    setState(() {
      textColor = Color.fromARGB(
          //  255, randomNumber(256), randomNumber(256), randomNumber(256));
          255,
          // pageColor?.red ?? 20 * 2,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256));
    });
    return textColor!;
  }

  List<TextSpan> differentColorsLetters(String word) {
    List<TextSpan> returnList = [];
    for (var i = 0; i < word.length; i++) {
      TextSpan oneTextSpan = TextSpan(
          text: word[i],
          style: TextStyle(color: randomTextColor(), fontSize: 32));
      returnList.add(oneTextSpan);
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        randomPageColor();
        // randomTextColor();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Test task from Victor',
            ),
            titleTextStyle: TextStyle(color: pageColor, fontSize: 10),
            backgroundColor: Colors.black,
          ),
          backgroundColor: pageColor,
          body: /* Column(
          children: [
            // InkWell(
            GestureDetector(
              onTap: () => print('PRESS !!!'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('One'), Text('Two')],
              ),
            ),*/
              GestureDetector(
            onTap: () {
              setState(() {
                isTapText = true;
              });
            },
            child: Center(
              child: isTapText
                  ? RichText(
                      textDirection: TextDirection.ltr,
                      text: TextSpan(
                        // text: "П",
                        // style: TextStyle(color: randomTextColor(), fontSize: 32),
                        children: differentColorsLetters('Привіт Світ!'),
                      ))
                  : Text(
                      'Привіт Світ!',
                      style: TextStyle(color: randomTextColor(), fontSize: 32),
                    ),
            ),
          )
          // ],
          ),
      //   ),
    );
  }
}
