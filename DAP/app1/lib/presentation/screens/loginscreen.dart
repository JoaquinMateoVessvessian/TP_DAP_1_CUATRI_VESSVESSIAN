import 'package:app1/presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final usuarios  = ref.watch(userProvider);

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
                'Login',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;

                      if (username.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tienes campos vacios', style: TextStyle(color: Colors.black)),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.yellow,
                          ),
                        );
                        return;
                      }
                      if (usuarios.any((u) => u.username == username && u.password == password)) {
                        context.go('/home', extra: {'username': username});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Algún campo es incorrecto'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('login', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              SizedBox(height: 50),
                  Text('if you dont have an account you can register here:'),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () => context.go('/register'),
                    child: Text('Register', style: TextStyle(fontSize: 20)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}