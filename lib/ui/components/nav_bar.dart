import 'package:flutter/material.dart';

class NavBarMenu extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const NavBarMenu({super.key, required this.title});

  List<PopupMenuItem<String>> buildMenu(BuildContext context) {
    return [
      PopupMenuItem(
        value: '/users',
        child: Row(children: [Text('users')]),
      ),
      PopupMenuItem(
        value: '/auth/login',
        child: Row(children: [Text('login')]),
      ),
    ];
  }

  void goRoute(String value, BuildContext context) {
    switch (value) {
      case '/auth/login':
      case '/users':
        Navigator.pushNamed(context, value);
        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('opção não implementada'))
        );
        break;
    }
  }

  Function()? popButtonBuilder(BuildContext context) {
    return Navigator.canPop(context) ? () => Navigator.pop(context) : null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: popButtonBuilder(context),
        icon: Icon(Icons.arrow_back)),

      title: Text(title),
      actions: [
        PopupMenuButton(
          itemBuilder: buildMenu,
          onSelected: (value) => goRoute(value, context),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(100);
}
