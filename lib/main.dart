import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homer_app/models/cart_model.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:homer_app/views/authentication/screens/auth_checker.dart';

TextTheme appTextTheme(BuildContext context) {
  try {
    return GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);
  } catch (_) {
    return Theme.of(context).textTheme.apply(fontFamily: "Poppins");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());

  await Hive.openBox<CartModel>('cartBox');
  await Hive.openBox<ProductModel>('favoriteBox');
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: appTextTheme(context),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 17, 115, 122),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthChecker(),
    );
  }
}
