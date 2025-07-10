// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:app1/entities/groceries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/presentation/provider.dart';

class DetailScreen extends ConsumerWidget {
  final String title;
  final String photo;
  final String description;
  final int index;
  final String username;

  const DetailScreen({
    super.key,
    required this.title,
    required this.username,
    required this.photo,
    required this.description,
    required this.index,
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(detailProvider);
    if (details == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail')),
        body: const Center(child: Text('No details available')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (details.photo != null)
              Center(
                child: Image.network(
                  details.photo!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              details.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              details.description,
              style: const TextStyle(fontSize: 16),
            ),
            TextButton(
              child: const Text('editar'),
              onPressed: () => context.go('/Lista', extra: {
                'cambio': 'false',
                'index': index.toString(),
                'username': username,
              }),
            ),
            TextButton(
              child: const Text('eliminar', style: TextStyle(color: Colors.red)),
              onPressed: () {
              final groceries = ref.read(groceriesProvider.notifier).state;
              final realIndex = groceries.indexWhere((g) =>
                g.title == details.title &&
                g.description == details.description &&
                (g.photo ?? '') == (details.photo ?? '')
              );
              if (realIndex != -1) {
              final newGroceries = List<Groceries>.from(groceries)..removeAt(realIndex);
              ref.read(groceriesProvider.notifier).state = newGroceries;
              ref.read(detailProvider.notifier).clearDetail();
              context.go('/home', extra: {'username': username});
              }
              },
              ),
          ],
        ),
      ),
    );
  }
}
