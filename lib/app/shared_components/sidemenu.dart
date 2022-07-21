import 'package:fe_ezlang_flashcard/app/features/dashboard/dashboard_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/flash_card_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Text("Title Drawer"),
          ),
          Divider(),
          _DrawerListTile(
            icon: Icons.stacked_line_chart,
            title: 'Dashboard',
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(DashboardScreen.routeName);
            },
          ),
          Divider(),
          _DrawerListTile(
            icon: Icons.web_stories,
            title: 'Flashcard',
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(FlashCardScreen.routeName);
            },
          ),
          Divider(),
          _DrawerListTile(
            icon: Icons.exit_to_app,
            title: 'Logout',
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<AppController>(context, listen: false).signOut();
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(icon, color: Colors.white54, size: 16),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
