// Author: Danny van Dijk | Ghekko.dev
// Copyright Ghekko (https://ghekko.dev/)
// Created: May 2025

import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  static final AppSettings _instance = AppSettings._internal();
  factory AppSettings() => _instance;
  AppSettings._internal();

  bool _useBottomNavigation = true;
  bool get useBottomNavigation => _useBottomNavigation;

  void setBottomNavigation(bool value) {
    if (_useBottomNavigation != value) {
      _useBottomNavigation = value;
      notifyListeners();
    }
  }
}

