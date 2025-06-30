import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';

class Trade extends StatelessWidget {
  final String cryptoLink;

  const Trade({Key? key, required this.cryptoLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 17, 20, 39),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 0,
          title: const Text(
            'خرید و فروش',
            style: TextStyle(
                fontFamily: 'Vazir',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: EasyWebView(
            src: cryptoLink,
          ),
        ),
      ),
    );
  }
}