import 'package:flutter/material.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/auth_repository.dart';
import 'package:spike_flutter/ui/components/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final AuthRepository _authRepository =
      AuthRepository.getAuthRepository();
  // static UserPublic? user = AuthRepository.getAuthRepository().getLoggedUser();

  @override
  Widget build(BuildContext context) {
    UserPublic? user = _authRepository.getLoggedUser();
    return user == null
        ? _HomePageStateAnonimo()
        : _HomePageStateLogado(user: user);
  }
}

class _HomePageStateAnonimo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: .fromARGB(126, 126, 126, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.lock_open_outlined),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/auth/login'),
        ),
        title: Text('Home'),
      ),
      body: Container(alignment: .center, child: Text('Hello world')),
    );
  }
}

class _HomePageStateLogado extends StatelessWidget {
  const _HomePageStateLogado({super.key, required this.user});

  final UserPublic user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: .fromARGB(126, 255, 126, 126),
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.verified_user_rounded),
        ),
        title: Text('bem vindo, ${user.name}'),
      ),
      body: Container(
        alignment: .center,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            UserCard(user: user),
            MaterialButton(
              onPressed: () {
                AuthRepository.getAuthRepository().logout();
                Navigator.pushReplacementNamed(context, '/');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Usuário deslogado'),
                    backgroundColor: .fromARGB(255, 255, 126, 255),
                  ),
                );
              },
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
