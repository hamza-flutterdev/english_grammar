import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Header
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Center(
                child: Text(
                  'My Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          // Items below header
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.blueGrey),
            title: regularText(textTitle: 'More Apps', textSize: 18, textWeight: FontWeight.w400, textColor: Colors.black),
            onTap: () {
              // Add navigation or action
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.blueGrey),
            title: regularText(textTitle: 'Privacy Policy', textSize: 18, textWeight: FontWeight.w400, textColor: Colors.black),
            onTap: () {
              // Add navigation or action
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            leading: Icon(Icons.verified_sharp, color: Colors.blueGrey),
            title: regularText(textTitle: 'App Version', textSize: 18, textWeight: FontWeight.w400, textColor: Colors.black),
            onTap: () {
              // Add navigation or action
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            leading: Icon(Icons.star_rate_outlined, color: Colors.blueGrey),
            title: regularText(textTitle: 'Rate US', textSize: 18, textWeight: FontWeight.w400, textColor: Colors.black),
            onTap: () {
              // Add navigation or action
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}