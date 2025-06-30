import 'package:flutter/material.dart';
import 'package:test_project/payment.dart';

class Membership extends StatelessWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 17, 20, 39),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 249, 253),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 17, 20, 39),
            ),
          ),
          elevation: 0,
          title: const Text(
            'خرید اشتراک',
            style: TextStyle(
                color: Color.fromARGB(255, 17, 20, 39),
                fontFamily: 'Vazir',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 249, 253),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                ),
                child: Center(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    elevation: 5.0,
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      title: const Text(
                        'اشتراک ماهیانه',
                        style: TextStyle(fontFamily: 'Vazir', fontSize: 20.0),
                      ),
                      subtitle: const Text(
                        '100,000 ريال',
                        style: TextStyle(fontFamily: 'Vazir', fontSize: 18.0),
                      ),
                      leading: const Icon(
                        Icons.radio_button_checked,
                        size: 25.0,
                      ),
                      trailing: const Icon(Icons.money),
                      selected: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MembershipPayment(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                color: const Color.fromARGB(255, 17, 20, 39),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      ':تعداد روز های باقی مانده از اشتراک شما',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Vazir',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '29',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Vazir',
                          fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}