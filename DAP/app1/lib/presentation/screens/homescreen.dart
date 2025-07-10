// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:app1/presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  final String username;
  final String? photo;
  final String title;
  final String description;
  const HomeScreen({
    super.key,
    required this.username,
    required this.title,
    this.photo,
    required this.description,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final groceries = ref.watch(groceriesProvider);
    final user = username;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Center(
              child: Text(
                'Welcome $user, here you have the groceries we have in stock',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: groceries.length,
                itemBuilder: (context, index) {
                  final grocery = groceries[index];
                  return Card(
                    child: ListTile(
                      leading: (grocery.photo != null && grocery.photo!.isNotEmpty)
                        ? Image.network(grocery.photo!)
                        : null,
                      onTap: () {
                        ref.read(detailProvider.notifier).state = grocery;
                        context.go('/details', extra: {'username': username});
                      },
                      title: Text(grocery.title),
                      subtitle: Text(grocery.description),
                    ),
                  );

                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child:
            FloatingActionButton(
              onPressed: () {
                context.go('/Lista', extra: {'cambio': 'true', 'username': username});
              },
              child: Icon(Icons.add),
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}