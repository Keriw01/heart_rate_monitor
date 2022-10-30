import 'package:flutter/material.dart';
import '../pages/settings.dart';
import '../pages/stats.dart';
import '../pages/history.dart';
import '../pages/raport.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int index = 1;
  List<StatefulWidget> pages = [
    const StatsPage(),
    const HistoryPage(),
    const RaportPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        elevation: 0.0,
        toolbarHeight: 50,
        backgroundColor: color4,
        centerTitle: true,
        title: const Text(
          'Heart Rate Monitor',
          style: TextStyle(
              fontSize: 24, fontFamily: 'Montserrat-Medium', color: color1),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              icon: const Icon(
                Icons.more_vert,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Theme(
            data: ThemeData(splashColor: color1, highlightColor: color1),
            child: BottomNavigationBar(
              backgroundColor: color1,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        const Text(
                          'Statystyki',
                          style: TextStyle(
                              color: color4,
                              fontSize: 18,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: FontWeight.w400),
                        ),
                        index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Container(
                                  color: color4,
                                  width: 90,
                                  height: 2,
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        const Text(
                          'Historia',
                          style: TextStyle(
                              color: color4,
                              fontSize: 18,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: FontWeight.w400),
                        ),
                        index == 1
                            ? Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Container(
                                  color: color4,
                                  width: 90,
                                  height: 2,
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        const Text(
                          'Raport',
                          style: TextStyle(
                              color: color4,
                              fontSize: 18,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: FontWeight.w400),
                        ),
                        index == 2
                            ? Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Container(
                                  color: color4,
                                  width: 90,
                                  height: 2,
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    label: ''),
              ],
              currentIndex: index,
              onTap: (int i) {
                setState(() {
                  index = i;
                });
              },
              fixedColor: color1,
            ),
          ),
          Expanded(child: SingleChildScrollView(child: pages[index])),
        ],
      ),
    );
  }
}
