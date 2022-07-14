
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_demo/screens/login_screen.dart';
import 'package:theme_demo/theme.dart';

main(){
  WidgetsFlutterBinding.ensureInitialized();
  getRunApp();
}

Future getRunApp() async {
  return await SharedPreferences.getInstance().then((value) {
    var isDarkTheme = value.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value.getTheme(),
          home: LoginScreen(),
        );
      },
    );
  }
}
