import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletons/skeletons.dart';
import 'package:test_project/second.dart';
import 'package:test_project/trade.dart';
import 'package:test_project/membership.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  List items = [];
  List foundC = [];
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    'سیستم پیشنهاد دهنده ارز دیجیتال',
    style: TextStyle(
        fontSize: 18.0, fontFamily: 'Vazir', fontWeight: FontWeight.bold),
  );
  TextEditingController searchController = TextEditingController();
  var counter = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      items = data["crypto"];
    });
  }

  // Future<void> fetchJson() async {
  //   final response = await http.get(Uri.parse('url'));
  //   final data = await json.decode(response.body);
  //   setState(() {
  //     items = data["crypto"];
  //   });
  // }

  void searchC(String query) {
    List results = [];
    if (query.isEmpty) {
      results = items;
    } else {
      results = items
          .where((user) => user["name"]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      foundC = results;
    });
  }

  Future loadData() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //loadData();
    readJson();
    //fetchJson();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'این سیستم بر اساس ارز های موجود در صرافی آنلاین نوبیتـکس می‌باشد و پیش بینی های انجام شده به صورت روزانه است',
                  style: TextStyle(fontFamily: 'Vazir', fontSize: 14.0),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'متوجه شدم',
                style: TextStyle(fontSize: 14.0, fontFamily: 'Vazir'),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 17, 20, 39),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  'Admin',
                  style: TextStyle(fontSize: 20.0),
                ),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 17, 20, 39),
                    Colors.blueAccent,
                    Colors.orange,
                  ]),
                ),
              ),
              ListTile(
                title: const Text(
                  'خرید اشتراک',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Vazir',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.card_membership,
                    color: Colors.white, size: 30.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Membership(),
                    ),
                  );
                },
              ),
              const Spacer(),
              const Divider(color: Colors.white),
              const Text(
                'پروژه کارشناسی',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'B_Lotus',
                    fontWeight: FontWeight.bold),
              ),
              const Text(''),
              const Text(
                'امیرحسین همایونی ۹۷۵۰۲۳۱۱۶۲',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'B_Lotus',
                    fontWeight: FontWeight.bold),
              ),
              const Text(''),
              const Text(
                'استاد راهنما: دکتر آرش خسروی',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'B_Lotus',
                    fontWeight: FontWeight.bold),
              ),
              const Text(''),
              const Text(
                'مرکز آموزش عالی محلات',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'B_Lotus',
                    fontWeight: FontWeight.bold),
              ),
              const Text(''),
              const Text(
                'تابستان ۱۴۰۱',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'B_Lotus',
                    fontWeight: FontWeight.bold),
              ),
              const Divider(color: Colors.white),
              const Spacer(),
              ListTile(
                title: const Text(
                  'خروج',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Vazir',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.exit_to_app,
                    color: Colors.white, size: 30.0),
                onTap: () => SystemNavigator.pop(),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  counter++;
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = TextField(
                      controller: searchController,
                      onChanged: (value) => searchC(value),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: '...جستجو',
                        hintStyle: TextStyle(
                            fontFamily: 'Vazir',
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.white),
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text(
                      'سیستم پیشنهاد دهنده ارز دیجیتال',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Vazir',
                          fontWeight: FontWeight.bold),
                    );
                  }
                });
              },
              icon: customIcon,
            )
          ],
          title: customSearchBar,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 17, 20, 39),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 20, 39),
        body: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 17, 20, 39),
              ),
              child: Center(
                child: MaterialButton(
                  splashColor: const Color.fromARGB(255, 17, 20, 39),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    //fetchJson();
                    readJson();
                    loadData();
                    foundC = items;
                  },
                  color: Colors.orange,
                  child: const Text(
                    'پیش بینی',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Vazir',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 20, 39),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 10.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 249, 253),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Skeleton(
                isLoading: loading,
                skeleton: SkeletonListView(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 5.0),
                  item: const Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: ListTile(
                      subtitle: Text(''),
                    ),
                  ),
                ),
                child: foundC.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 5.0),
                        itemCount: foundC.length,
                        itemBuilder: ((context, index) => Card(
                              elevation: 5.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child: ListTile(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                title: Text(
                                  foundC[index]["name"],
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                                subtitle: Text(
                                  foundC[index]["percent"]
                                              .toString()
                                              .substring(0, 1) ==
                                          '-'
                                      ? "${foundC[index]["percent"].toStringAsFixed(2)} %"
                                      : "+${foundC[index]["percent"].toStringAsFixed(2)} %",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: foundC[index]["percent"]
                                                  .toString()
                                                  .substring(0, 1) ==
                                              '-'
                                          ? Colors.red
                                          : Colors.green),
                                ),
                                leading: Image.network(foundC[index]["image"]),
                                trailing: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Trade(
                                          cryptoLink: foundC[index]["buy"],
                                        ),
                                      ),
                                    );
                                  },
                                  color: Colors.blueAccent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'معامله',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Vazir',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SecondScreen(
                                          cryptoName: foundC[index]["name"],
                                          cryptoPercent: foundC[index]
                                                          ["percent"]
                                                      .toString()
                                                      .substring(0, 1) ==
                                                  '-'
                                              ? "${foundC[index]["percent"].toStringAsFixed(2)} %"
                                              : "+${foundC[index]["percent"].toStringAsFixed(2)} %",
                                          cryptoIcon: foundC[index]["image"],
                                          cryptoChart: foundC[index]["chart"]),
                                    ),
                                  );
                                },
                              ),
                            )),
                      )
                    : Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 248, 249, 253),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Center(
                          child: counter == 0
                              ? const Text(
                                  'برای شروع بر روی دکمه پیش بینی بزنید',
                                  style: TextStyle(
                                      fontFamily: 'Vazir', fontSize: 18.0),
                                )
                              : const Text(
                                  'رمز ارز مورد نظر یافت نشد',
                                  style: TextStyle(
                                      fontFamily: 'Vazir', fontSize: 18.0),
                                ),
                        ),
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}