
import 'package:flutter/material.dart';
import 'package:saber/components/home/settings_switch.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/pref_keys.dart';
import 'package:saber/pages/editor/editor.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const NextcloudProfile(),
              SettingsSwitch(
                title: "Editor toolbar on the bottom",
                prefKey: PrefKeys.editorToolbarOnBottom,
                isEncPref: false,
                defaultValue: Editor.editorToolbarOnBottom,
                afterChange: (value) { Editor.editorToolbarOnBottom = value; },
              ),
            ],
          )),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: AppInfo(),
          ),

        ],
      ),
    );
  }
}
