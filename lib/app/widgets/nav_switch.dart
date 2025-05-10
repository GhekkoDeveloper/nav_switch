import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_setting.dart';

class NavSwitch extends StatelessWidget {
  const NavSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      splashRadius: 18,
      icon: Icon(Icons.settings),
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
              enabled: false,
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Consumer<AppSettings>(
                  builder: (context, settings, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Switch'),
                        Switch.adaptive(
                          value: settings.useBottomNavigation,
                          onChanged: (value) {
                            Navigator.of(context).pop();
                            Future.delayed(
                              const Duration(milliseconds: 200),
                                  () {
                                if (context.mounted) {
                                  settings.setBottomNavigation(value);
                                }
                              },
                            );
                          },
                          activeColor: Colors.red,
                          activeTrackColor: Colors.grey[100],
                          inactiveThumbColor: Colors.blueAccent,
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
      ],
      elevation: 2,
      offset: const Offset(50, 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}