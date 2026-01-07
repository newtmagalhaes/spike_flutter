import 'package:flutter/material.dart';
import 'package:spike_flutter/data/mappers/user_public_json_placeholder.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/user_repository.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/json_placeholder_api.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _ListUsers();
}

class _ListUsers extends State<UsersPage> {
  final _userRepository = JsonPlaceholderUserRepository(
    jsonPlaceholderAPI: JsonPlaceholderApi(),
    userPublicJsonPlaceholder: UserPublicJsonPlaceholder(),
  );
  late Future<List<UserPublic>> _users;

  @override
  void initState() {
    super.initState();
    _users = _userRepository.listUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Lista de Usuários')),
    body: Container(
      alignment: .center,
      color: .fromARGB(255, 255, 255, 255),
      child: Card.filled(
        child: FutureBuilder(
          future: _users,
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                mainAxisAlignment: .center,
                spacing: 0.5,
                children: [
                  for (var u in snapshot.data!)
                    SizedBox.fromSize(
                      size: Size(350, 30),
                      child: Card.outlined(
                        elevation: 1,
                        child: Row(
                          mainAxisAlignment: .start,
                          spacing: 5,
                          children: [
                            Text('${u.id}'.padLeft(3, '0'), textAlign: .right),
                            SizedBox.fromSize(
                              size: Size(150, 50),
                              child: Text(u.username),
                            ),
                            SizedBox.fromSize(
                              size: Size(100, 50),
                              child: Text(
                                u.name,
                                textAlign: .center,
                                overflow: .ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            }
            return Text('empty list');
          },
        ),
      ),
    ),
  );
}
