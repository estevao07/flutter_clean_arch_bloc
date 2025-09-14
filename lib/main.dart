import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_bloc/core/dependecy_injection.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/page/users_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UsersPage(),
    );
  }
}
