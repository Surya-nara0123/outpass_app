import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFD0BCFF),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Menu button pressed!')),
          );
        },
      ),
      title: const Center(child: Text(
        'Outpass App',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w600
        ),
        )),
      actions: [
        IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile button pressed!')),
              );
            })
      ],
    );
  }