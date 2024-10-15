import 'package:flutter/material.dart';

Drawer drawerMenuFunction(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xFFD0BCFF)),
          currentAccountPicture: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Text('S'),
              ),
              SizedBox(height: 10.0),
            ],
          ),
          accountEmail: Text('surya.nara0123@gmail.com', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16.0)),
          accountName: Text('surya', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
        ),
        // this ListTile should be shown only if the route is not /
        (ModalRoute.of(context)?.settings.name != '/') ? ListTile(
          title: const Text('Go back to Home'),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ) : const SizedBox.shrink(),
        ListTile(
          title: const Text('Outpass Status'),
          onTap: () {
            // Navigator.of(context).pushNamed('/');
          },
        ),
        ListTile(
          title: const Text('Rule for applying for an Outpass'),
          onTap: () {
            Navigator.of(context).pushNamed('/rulesforoutpass');
          },
        ),
      ],
    ),
  );
}
