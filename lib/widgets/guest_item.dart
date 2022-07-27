// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:guestlist/models/guest_info.dart';
import 'package:guestlist/screens/add_guest.dart';
import 'package:guestlist/screens/main_screen.dart';

import '../app_data.dart';

class GuestItem extends StatefulWidget {
  final GuestInfo guestinfo;

  GuestItem({required this.guestinfo});

  @override
  State<GuestItem> createState() => _GuestItemState();
}

class _GuestItemState extends State<GuestItem> {
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.delete_outline_rounded),
                      title: Text('Delete'),
                      onTap: () {
                        setState(() {
                          guest_data.remove(widget.guestinfo);
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.of(context)
                              .pushReplacementNamed(MainScreen.screenRoute);
                        });
                      }),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacementNamed(
                        context,
                        AddGuest.screenRoute,
                        arguments: widget.guestinfo,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.guestinfo.imageUrl,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.guestinfo.fullName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  _showPicker(context);
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: widget.guestinfo.status == Status.Confirmed
                ? Icon(Icons.check, color: Colors.white, size: 15)
                : widget.guestinfo.status == Status.Declined
                    ? Icon(Icons.close, color: Colors.white, size: 15)
                    : Icon(Icons.refresh, color: Colors.white, size: 15),
          ),
        ],
      ),
    );
  }
}
