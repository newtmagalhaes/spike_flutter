import 'package:flutter/material.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/ui/components/static_field.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final UserPublic user;

  @override
  Widget build(BuildContext context) {

    return SizedBox.fromSize(
      size: Size(300, 400),
      child: Card(
        color: Color.fromARGB(126, 126, 255, 126),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            StaticField(name: 'Username', value: user.username),
            StaticField(name: 'Nome', value: user.name),
          ],
        ),
      ),
    );
  }
}
