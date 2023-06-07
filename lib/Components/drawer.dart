// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TheDrawer extends StatelessWidget {
  const TheDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color:Color(0xFFEF7F00),
            ),
            child: Text('Menu',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
  
          ListTile(
            leading: Icon(
              Icons.rocket_launch,
            ),
            title: const Text('test1'),
            onTap: () {
             
            },
          ),
          ListTile(
            leading: Icon(
              Icons.rocket_launch,
            ),
            title: const Text('test2'),
            onTap: () {
             
            },
          ),
          ListTile(
            leading: Icon(
              Icons.rocket_launch,
            ),
            title: const Text('test3'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
