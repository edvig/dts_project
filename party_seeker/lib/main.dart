import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_seeker/config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.openSansTextTheme(
          const TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 30,
            ),
            headline2: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 25,
            ),
            headline3: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.login,
    );
  }
}
