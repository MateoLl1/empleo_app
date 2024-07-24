
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final isDark = ref.watch(darkModeProvider);
    return IconButton(
      onPressed: (){
        ref.read(darkModeProvider.notifier).state = !isDark;
      },
      icon: isDark 
        ? const Icon(Icons.dark_mode)
        : const Icon(Icons.light_mode),
    );
  }
}