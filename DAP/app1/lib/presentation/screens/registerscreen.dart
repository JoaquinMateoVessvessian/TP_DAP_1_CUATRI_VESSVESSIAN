// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/entities/usuarios.dart';
import 'package:app1/presentation/provider.dart';



class RegisterScreen extends ConsumerStatefulWidget {
 
  const RegisterScreen({super.key,});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                'Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0),
              ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'username'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: mailController,
                  decoration: const InputDecoration(labelText: 'mail'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
              ),
              SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        String username = usernameController.text;
                        String password = passwordController.text;
                        String mail = mailController.text;
                        String name = nameController.text;

                        if (username.isEmpty || password.isEmpty || mail.isEmpty || name.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Tienes campos vacios', style: TextStyle(color: Colors.black)),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.yellow,
                            ),
                          );
                          return;
                        }
                        Usuarios newuser = Usuarios(
                          username: username,
                          password: password,
                          mail: mail,
                          name: name,
                        );

                        List<Usuarios> user1 = ref.read(userProvider.notifier).state;
                        ref.read(userProvider.notifier).state = [
                          ...user1,
                          newuser,
                        ];
                        context.go(
                          '/',
                        );
                      },
                      child: Text('Create Account'),
                    ),
                ],
          ),
        ),
      ),
    );
  }
}