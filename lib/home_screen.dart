import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Color? pageColor;
  Color? textColor;
  bool isTapText = false;

  @override
  void initState() {
    super.initState();
    pageColor = const Color.fromARGB(255, 255, 255, 255);
    textColor = const Color.fromARGB(255, 0, 0, 0);
  }

  void randomPageColor() {
    setState(() {
      isTapText = false;
      pageColor = Color.fromARGB(255, Random().nextInt(256),
          Random().nextInt(256), Random().nextInt(256));
    });
  }

  void randomTextColor() {
    setState(() {
      isTapText = false;
      textColor = Color.fromARGB(255, Random().nextInt(256),
          Random().nextInt(256), Random().nextInt(256));
    });
  }

  List<TextSpan> differentColorsLetters(String word) {
    List<TextSpan> returnList = [];
    for (var i = 0; i < word.length; i++) {
      TextSpan oneTextSpan = TextSpan(
          text: word[i],
          style: TextStyle(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
            fontSize: 32,
          ));
      returnList.add(oneTextSpan);
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Color  (Test task from Victor)',
        ),
        titleTextStyle: TextStyle(color: pageColor, fontSize: 12),
        backgroundColor: Colors.black,
      ),
      backgroundColor: pageColor,
      body: Center(
        child: isTapText
            ? RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  children: differentColorsLetters('Привіт Світ!'),
                ))
            : Text(
                'Привіт Світ!',
                style: TextStyle(color: textColor, fontSize: 32),
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.color_lens),
                  tooltip: 'Випадковий колір фону',
                  onPressed: () {
                    randomPageColor();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.format_color_text),
                  tooltip: 'Випадковий колір тексту',
                  onPressed: () {
                    randomTextColor();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.text_format),
                  tooltip: 'Випадковий колір символів окремо',
                  onPressed: () {
                    setState(() {
                      isTapText = true;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.format_paint),
                  tooltip: 'Випадковий колір тексту і фону',
                  onPressed: () {
                    setState(() {
                      pageColor = Color.fromARGB(255, Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256));
                      textColor = Color.fromARGB(255, Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256));
                      isTapText = false;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.brush),
                  tooltip: 'Випадковий колір фону і кожної букви',
                  onPressed: () {
                    setState(() {
                      pageColor = Color.fromARGB(255, Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256));
                      isTapText = true;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
