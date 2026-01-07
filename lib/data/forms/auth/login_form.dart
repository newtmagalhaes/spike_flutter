import 'package:flutter/material.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/auth_repository.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthRepository _authRepository = AuthRepository.getAuthRepository();

  late Future<UserPublic?> _user;

  final _formKey = GlobalKey<FormState>();

  final _username = TextEditingController();
  final _password = TextEditingController();

  Future<UserPublic?> submit() async {
    if (_formKey.currentState!.validate()) {
      // form is valid
      return _authRepository.login(_username.text, _password.text);
    }
    throw Exception('form inválido');
  }

  @override
  void initState() {
    super.initState();
    _user = _authRepository.getLoggedUser();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Text('Login'),
          TextFormField(
            controller: _username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Username'),
            ),
          ),
          TextFormField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('password'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _user = submit();
                _user.then((user) {
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Falha no login'),
                        backgroundColor: .fromARGB(255, 255, 126, 126),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Logado como ${user.name}'),
                      backgroundColor: const .fromARGB(126, 126, 255, 126),
                    ),
                  );
                  Navigator.pushReplacementNamed(context, '/');
                });
              });
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
