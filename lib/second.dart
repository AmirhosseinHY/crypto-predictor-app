import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';

class SecondScreen extends StatelessWidget {
  final String cryptoName;
  final String cryptoPercent;
  final String cryptoIcon;
  final String cryptoChart;

  const SecondScreen(
      {Key? key,
      required this.cryptoName,
      required this.cryptoPercent,
      required this.cryptoIcon,
      required this.cryptoChart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 17, 20, 39),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 17, 20, 39),
        ),
        body: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 17, 20, 39),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(
                        child:
                            Image.network(cryptoIcon, height: 100, width: 100),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(children: [
                          Text(
                            cryptoName,
                            style: const TextStyle(
                                fontSize: 30.0, color: Colors.white),
                          ),
                          Text(
                            cryptoPercent,
                            style: TextStyle(
                                fontSize: 25.0,
                                color: cryptoPercent.substring(0, 1) == '+'
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ]),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: EasyWebView(src: cryptoChart),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}