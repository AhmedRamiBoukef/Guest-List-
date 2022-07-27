// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:guestlist/models/guest_info.dart';

import '../app_data.dart';
import 'main_screen.dart';
import 'pending_screen.dart';

class AddGuest extends StatefulWidget {
  static const screenRoute = '/AddGuest';
  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  var selectedItemPosition = 1;
  var edit = false;
  late GuestInfo guest;
  String? _dropDownValue;
  var screens = [
    MainScreen.screenRoute,
    AddGuest.screenRoute,
    PendingScreen.screenRoute
  ];
  var fullname;
  var phonenumber;
  var imgLink;
  var status;
  late Status stat;
  var fullnamecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var imgcontroller = TextEditingController();

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null) {
      guest = args as GuestInfo;
      fullnamecontroller.text = guest.fullName;
      phonecontroller.text = guest.phoneNumber;
      imgcontroller.text = guest.imageUrl;
      _dropDownValue = guest.status == Status.Confirmed
          ? "Confirmed"
          : guest.status == Status.Declined
              ? "Declined"
              : "Pending";
      edit = true;
      imgLink = guest.imageUrl;
      fullname = guest.fullName;
      phonenumber = guest.phoneNumber;
      status = _dropDownValue;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e9fa),
      appBar: AppBar(
        backgroundColor: Color(0xffe4e9fa),
        elevation: 1,
        title: Text(
          "Add Guest",
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: imgLink != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        imgLink,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
              ),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListView(
                children: [
                  TextField(
                    controller: fullnamecontroller,
                    onChanged: (value) {
                      fullname = value;
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      labelText: "FullName",
                      hintText: 'Full Name',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                  TextField(
                    controller: phonecontroller,
                    onChanged: (value) {
                      phonenumber = value;
                    },
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      labelText: "Phone Number",
                      hintText: 'Phone Number',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                  TextField(
                    controller: imgcontroller,
                    onChanged: (value) {
                      imgLink = value;
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      labelText: "Image Link",
                      hintText: 'Image Link',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: DropdownButton(
                      hint: _dropDownValue == null
                          ? Text('Status')
                          : Text(
                              _dropDownValue as String,
                              style: TextStyle(color: Colors.blue),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: ['Confirmed', 'Pending', 'Declined'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        status = val;
                        setState(() {
                          _dropDownValue = val.toString();
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (status == 'Pending') {
                        stat = Status.Pending;
                      } else if (status == 'Confirmed') {
                        stat = Status.Confirmed;
                      } else if (status == 'Declined') {
                        stat = Status.Declined;
                      }
                      GuestInfo value = GuestInfo(
                          fullName: fullname,
                          phoneNumber: phonenumber,
                          status: stat,
                          imageUrl: imgLink);

                      setState(() {
                        if (edit == false) {
                          guest_data.add(value);
                        } else {
                          var index = guest_data.indexOf(guest);
                          guest_data.remove(guest);
                          guest_data.insert(index, value);
                          Navigator.of(context)
                              .pushReplacementNamed(MainScreen.screenRoute);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(230, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(' Save'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
