import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:homer_app/views/entry/favorite/screens/favorite.dart';
import 'package:homer_app/views/entry/home/screens/home.dart';
import 'package:homer_app/views/entry/account/screens/settings.dart';
import 'package:homer_app/views/entry/store/screen/shop_screen.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final pages = [
  const HomeScreen(),
  const ShopScreen(),
  const FavoriteScreen(),
  const SettingScreen(),
];
