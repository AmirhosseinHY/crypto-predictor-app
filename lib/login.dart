import 'package:flutter/material.dart';
import 'package:test_project/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final username = 'admin';
  final password = 'admin';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 20, 39),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'ورود به برنامه',
          style: TextStyle(
              fontFamily: 'Vazir', fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 17, 20, 39),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    label: Text(
                      'نام کاربری',
                      style: TextStyle(fontFamily: 'Vazir'),
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text(
                      'رمز عبور',
                      style: TextStyle(fontFamily: 'Vazir'),
                    ),
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    if (usernameController.text == username) {
                      if (passwordController.text == password) {
                        Fluttertoast.showToast(msg: 'خوش آمدید');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(msg: 'رمز عبور نادرست است');
                      }
                    } else {
                      Fluttertoast.showToast(msg: 'نام کاربری نادرست است');
                    }
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  color: Colors.blueAccent,
                  height: 60,
                  minWidth: double.infinity,
                  child: const Text(
                    'ورود',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Vazir',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}