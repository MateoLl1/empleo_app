import 'package:flutter/material.dart';
import 'package:empleo_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final isDark = ref.watch(darkModeProvider);
    return MaterialApp.router(
      routerConfig: appRouter,      
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0, isDark: isDark).getTheme(),
    );
  }
}
