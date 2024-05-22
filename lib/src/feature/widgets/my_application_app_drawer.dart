import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class myApplicationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Mi Aplicacion Interactiva'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            title: Text('Imc calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/imc');
            },
          ),
          ListTile(
            title: Text('Age calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/age');
            },
          ),
          ListTile(
            title: Text('Work Day calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/workDay');
            },
          ),
          ListTile(
            title: Text('Zodiac  calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ),
        ],
      ),
    );
  }
}
