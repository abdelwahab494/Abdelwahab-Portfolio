import 'package:abdelwahab_portfolio/providers/app_data_provider.dart';
import 'package:abdelwahab_portfolio/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: "https://dsyzfqddbgiqtobxctrt.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzeXpmcWRkYmdpcXRvYnhjdHJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM1NDE4MDIsImV4cCI6MjA2OTExNzgwMn0.WLIPvinit8toTdW31xhFMBq73-ViMv2vTYxtaf3pSlI",
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppDataProvider()..fetchAppData(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Root());
  }
}
