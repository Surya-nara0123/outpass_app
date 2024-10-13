import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFD0BCFF),
      title: const Center(child: Text(
        'Outpass App',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w600
        ),
        )),
      actions: const [
        SizedBox(width: 40.0),
      ],
    );
  }