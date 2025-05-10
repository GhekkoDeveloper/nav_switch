import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/bottom_nav.dart';
import 'app/drawer_nav.dart';
import 'app_setting.dart';

void main() {
  runApp(const GhekkoApps());
}

class GhekkoApps extends StatelessWidget {
  const GhekkoApps({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ghekko Apps',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const _HomeSwitcher(),
      ),
    );
  }
}

class _HomeSwitcher extends StatelessWidget {
  const _HomeSwitcher();

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);
    return settings.useBottomNavigation
        ? const BottomNav()
        : const DrawerNav();
  }
}
