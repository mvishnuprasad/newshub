import 'package:flutter/material.dart';

class OptionList  {
  final Map<String, dynamic> profileData = {
    "Profile": "View and edit your user profile details.",
    "Account Settings": "Adjust your account preferences and settings.",
    "Subscription": "Manage your subscription plan.",
    "Notifications": "Control the types of notifications you receive.",
    "Privacy": "Manage your privacy & data sharing",
    "Help Center": "Get support for using the app.",
    "Logout": "Sign out of your account."
  };
  final List<IconData> iconsList = [
    Icons.person_2_outlined,
    Icons.settings_outlined,
    Icons.subscriptions_outlined,
    Icons.notifications_outlined,
    Icons.privacy_tip_outlined,
    Icons.help_outline,
    Icons.logout_outlined
  ];
}