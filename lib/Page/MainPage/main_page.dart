import 'package:flutter/material.dart';
import 'package:tes_frontend/Page/ContactUsPage/contact_us_page.dart';
import 'package:tes_frontend/Page/InkCatridgesPage/ink_catridges_page.dart';
import 'package:tes_frontend/Page/LoginPage/login_page.dart';
import 'package:tes_frontend/Page/MainPage/WidgetMainPage/app_bar_main_page.dart';
import 'package:tes_frontend/Page/HomePage/home_page.dart';
import 'package:tes_frontend/Page/TonerCatridgesPage/toner_catridges_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<String> _menuItems = [
    "HOME",
    "INK CARTRIDGES",
    "TONER CARTRIDGES",
    "CONTACT US",
    "LOGIN / REGISTER"
  ];

  final List<Widget> _pages = [
    HomePage(),
    InkCatridgesPage(),
    TonerCatridgesPage(),
    ContactUsPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainPage(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.crop,
                            color: Colors.orange, size: 38), // Icon Crown
                        SizedBox(width: 8),
                        Text(
                          "CARTRIDGE KINGS",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "SEARCH",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    isDense: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(Icons.search,
                                    color: Colors.black, size: 20),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(120, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.zero, // Tidak ada radius
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CART (1)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Row(
                    children: List.generate(_menuItems.length, (index) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            color: _selectedIndex == index
                                ? Colors.blue[900]
                                : Colors.blue,
                            child: Text(
                              _menuItems[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
