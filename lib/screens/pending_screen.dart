// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:guestlist/widgets/guest_item.dart';

import '../app_data.dart';
import 'add_guest.dart';
import 'main_screen.dart';

class PendingScreen extends StatefulWidget {
  static const screenRoute = '/PendingScreen';
  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  var selectedItemPosition = 2;
  var screens = [
    MainScreen.screenRoute,
    AddGuest.screenRoute,
    PendingScreen.screenRoute
  ];
  var guest_pending = guest_data;
  var guestList = guest_data;
  @override
  void initState() {
    guest_pending = guest_pending
        .where((element) => element.status == Status.Pending)
        .toList();
    guestList = guest_pending;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e9fa),
      appBar: AppBar(
        backgroundColor: Color(0xffe4e9fa),
        elevation: 1,
        title: Text(
          "Pending List",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(12),

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: Colors.black,
        selectedItemColor:
            SnakeShape.circle == SnakeShape.indicator ? Colors.black : null,
        unselectedItemColor: Colors.blueGrey,

        showUnselectedLabels: false,
        showSelectedLabels: false,

        currentIndex: selectedItemPosition,
        onTap: (index) {
          setState(() => selectedItemPosition = index);
          Navigator.of(context)
              .pushReplacementNamed(screens[selectedItemPosition]);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Pending'),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            margin: EdgeInsets.only(
              top: 12,
              left: 15,
              right: 15,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  guest_pending = guestList;
                });
                setState(() {
                  guest_pending = guest_pending
                      .where((element) => element.fullName
                          .toLowerCase()
                          .startsWith(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 15),
                hintText: 'Search for a guest',
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: 45,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "All Matches",
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffff404b),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        "${guest_pending.length}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      guest_data.removeWhere(
                          (element) => guest_pending.contains(element));
                      guest_pending.clear();
                    });
                  },
                  icon: Icon(Icons.delete_forever),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: guest_pending
                  .map(
                    (e) => GuestItem(
                      guestinfo: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
