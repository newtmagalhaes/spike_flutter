import 'package:flutter/material.dart';
import 'package:spike_flutter/widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: .fromARGB(126, 255, 126, 126),
      drawer: NavigationDrawer(children: [
        UserCard()
      ]),
      body: Container(
        alignment: .center,
        child: UserCard(),
      ),
    );
  }
}
