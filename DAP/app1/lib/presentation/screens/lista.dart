// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:app1/presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/entities/groceries.dart';




class Lista extends ConsumerStatefulWidget {
  final bool cambio;
  final int? index;
  final String title;
  final String photo;
  final String description;
  final String username;
  const Lista({
    super.key,
    this.index,
    required this.username,
    required this.cambio,
    required this.title,
    required this.photo,
    required this.description,
  });

  @override
  ConsumerState<Lista> createState() => _ListaState();
}

class _ListaState extends ConsumerState<Lista> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController photoController;

@override
void initState() {
  super.initState();
  if (!widget.cambio && widget.index != null) {
  final groceries = ref.read(groceriesProvider);
  final grocery = groceries[widget.index!];
    titleController = TextEditingController(text: grocery.title);
    descriptionController = TextEditingController(text: grocery.description);
    photoController = TextEditingController(text: grocery.photo ?? '');
  } else {
    titleController = TextEditingController(text: '');
    descriptionController = TextEditingController(text: '');
    photoController = TextEditingController(text: '');
  }
}

 @override
void didUpdateWidget(covariant Lista oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (!widget.cambio && widget.index != null) {
    final groceries = ref.read(groceriesProvider);
    if (widget.index! < groceries.length) {
      final grocery = groceries[widget.index!];
      titleController.text = grocery.title;
      descriptionController.text = grocery.description;
      photoController.text = grocery.photo ?? '';
    }
  }
}

  @override
void dispose() {
  titleController.dispose();
  descriptionController.dispose();
  photoController.dispose();
  super.dispose();
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.cambio ? 'add grocery' : 'edit grocery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'description'),
            ),
            TextField(
              controller: photoController,
              decoration: const InputDecoration(labelText: 'photo URL'),
            ),
            const SizedBox(height: 24),
            TextButton(
  onPressed: () {
  if (widget.cambio == true) {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }
    Groceries newGrocery = Groceries(
      title: titleController.text,
      photo: photoController.text,
      description: descriptionController.text,
    );
    ref.read(groceriesProvider.notifier).state = [
      ...ref.read(groceriesProvider.notifier).state,
      newGrocery
    ];
    ref.read(detailProvider.notifier).state = newGrocery;
    context.go('/home', extra: {'username': widget.username});
  } else {
    final groceries = ref.read(groceriesProvider.notifier).state;
    if (widget.index != null && widget.index! < groceries.length) {
      final updatedGrocery = Groceries(
        title: titleController.text,
        photo: photoController.text,
        description: descriptionController.text,
      );
      final newGroceries = List<Groceries>.from(groceries);
      newGroceries[widget.index!] = updatedGrocery;
      ref.read(groceriesProvider.notifier).state = newGroceries;
      ref.read(detailProvider.notifier).state = updatedGrocery;
    }
    context.go('/home', extra: {'username': widget.username});
  }
},
  child: const Text('Save'),
),
          ],
        ),
      ),
    );
  } 
}