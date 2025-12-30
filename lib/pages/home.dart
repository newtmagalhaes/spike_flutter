import 'package:flutter/material.dart';
import 'package:spike_flutter/interfaces/models/user_public.dart';
import 'package:spike_flutter/interfaces/repositories/auth_repository.dart';
import 'package:spike_flutter/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final AuthRepository _authRepository =
      AuthRepository.getAuthRepository();
  // static UserPublic? user = AuthRepository.getAuthRepository().getLoggedUser();

  Widget home() {
    return user != null ? UserCard(user: user) :;
  }

  AppBar appBar(BuildContext context) {
    UserPublic? user = _authRepository.getLoggedUser();
    return user == null
        ? AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/auth/login');
              },
              icon: Icon(Icons.menu),
            ),
            title: Text('Home'),
          )
        : 
          );
  }

  @override
  Widget build(BuildContext context) {
    UserPublic? user = _authRepository.getLoggedUser();
    return user == null
      ? _HomePageStateAnonimo()
      : _HomePageStateLogado(user: user,);
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
          onPressed: () => Navigator.pushReplacementNamed(context, '/auth/login'),
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
            title: Text('bem vindo, ${user.name}'),),
      body: Container(alignment: .center, child: home()),
    );
  }
  
}
