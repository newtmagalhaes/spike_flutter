import 'package:flutter/material.dart';
import 'package:spike_flutter/interfaces/models/user_public.dart';
import 'package:spike_flutter/interfaces/repositories/auth_repository.dart';
import 'package:spike_flutter/widgets/static_field.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<StatefulWidget> createState() => _UserState();
}

class _UserState extends State<UserCard> {
  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    UserPublic user = _authRepository.getLoggedUser();

    return SizedBox.fromSize(
      size: Size(300, 400),
      child: Card(
        color: Color.fromARGB(126, 126, 255, 126),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            StaticField(name: 'Username', value: user.username),
            StaticField(name: 'Nome', value: user.name),
            MaterialButton(
              onPressed: () => {print('Saiu')},
              color: Color.fromARGB(255, 255, 126, 126),
              child: Text(
                'Sair',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
