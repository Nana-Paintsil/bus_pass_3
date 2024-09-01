import 'package:bus_pass_3/Pages/Authentication/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Models/Scoped_Model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
*/
  runApp(MyApp(
    model: MyScopedModel(),
  ));
}

class MyApp extends StatelessWidget {
  final MyScopedModel model;

  const MyApp({Key? key, required this.model}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyScopedModel>(
        model: model,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            //  textTheme: GoogleFonts.sourceSansProTextTheme(),
            primaryColor: Colors.purple.shade400.withOpacity(0.7),
            // This is the theme of your application.
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade400,
                // Add other styling properties here
              ),
            ),
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
        ));
  }
}
