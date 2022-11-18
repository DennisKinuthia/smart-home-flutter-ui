import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/custom/smart_device_box.dart';
import 'package:smart_home/utils/constants.dart';
import 'package:smart_home/utils/data.dart';
import 'package:smart_home/utils/widget_functions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _powerSwitchChanged(bool status, int index) {
    setState(() {
      smartDevices[index][2] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 25.0;
    const EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(padding, 65.0, padding, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/icons/menu.png',
                  height: 45.0,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.person,
                  size: 45.0,
                  color: Colors.grey[800],
                )
              ],
            ),
          ),
          addVerticalSpace(padding),
          const Padding(
            padding: sidePadding,
            child: Text(
              'Welcome Home',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: colorBlack,
                height: 0.5,
              ),
            ),
          ),
          Padding(
            padding: sidePadding,
            child: Text(
              'Victoria',
              style: GoogleFonts.bebasNeue(
                fontSize: 62.0,
                color: Colors.grey[700],
              ),
            ),
          ),
          addVerticalSpace(15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),
          Padding(
            padding: sidePadding,
            child: Text(
              'Smart Devices',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15.0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: smartDevices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.3, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  deviceName: smartDevices[index][0],
                  iconPath: smartDevices[index][1],
                  powerOn: smartDevices[index][2],
                  onChange: (value) => _powerSwitchChanged(value, index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
