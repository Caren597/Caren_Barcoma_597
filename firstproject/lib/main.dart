
import 'package:firstproject/screen/user_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'utils/export.dart';

void main() async { 
 WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize (url:' https://stzxcferyiufeebkdpbm.supabase.co',
 anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN0enhjZmVyeWl1ZmVlYmtkcGJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4ODU3MDIsImV4cCI6MjA4NzQ2MTcwMn0.cMo2xOwskmcyuAAFNGCQcyLygcTxCz0irGaPBTVWB8A'
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.pink),
      ),
      home: UserScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

