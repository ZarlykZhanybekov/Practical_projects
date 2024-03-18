import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasbix/ui/theme/theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tемная тема',
                    style: themeData.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 20)),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                  activeColor: CupertinoColors.activeGreen,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}