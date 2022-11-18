// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/utils/constants.dart';
import 'package:smart_home/utils/widget_functions.dart';

class SmartDeviceBox extends StatelessWidget {
  const SmartDeviceBox({
    super.key,
    required this.deviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChange,
  });
  final String deviceName;
  final String iconPath;
  final bool powerOn;

  final void Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              iconPath,
              height: 65.0,
              color: powerOn ? Colors.white : colorBlack,
            ),
            addVerticalSpace(10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      deviceName,
                      style: TextStyle(
                        color: powerOn ? Colors.white : colorBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChange,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
