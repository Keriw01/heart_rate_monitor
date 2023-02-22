import 'package:flutter/material.dart';
import '../pages/settings.dart';
import '../pages/stats.dart';
import '../pages/history.dart';
import '../pages/raport.dart';
import '../theme/colors.dart';
import '../functions/build_bootom_sheet.dart';
import '../theme/custom_floating_button.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                        Text(
                          'Statystyki',
                          style: TextStyle(
                              color: color4,
                              fontSize: 18,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: index == 0
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                        index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2.0),
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
                        Text(
                          'Historia',
                          style: TextStyle(
                              color: color4,
                              fontSize: 18,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: index == 1
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                        index == 1
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2.0),
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
                        Text(
                          'Raport',
                          style: TextStyle(
                              color: color4,
                              fontSize: 18,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: index == 2
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                        index == 2
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2.0),
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
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: pages[index],
          ))),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.none,
        elevation: 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        highlightElevation: 0.0,
        disabledElevation: 0.0,
        focusColor: color3,
        hoverColor: color3,
        splashColor: color3,
        backgroundColor: color3,
        onPressed: () {
          buildBottomSheet(context);
        },
        shape: const CustomFloatingButton(),
        child: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Icon(
              Icons.add,
              size: 32,
            )),
      ),
    );
  }
}
