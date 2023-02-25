import 'package:flutter/material.dart';
import 'package:yuekeyouinterview/routers/routers.dart';
import 'package:yuekeyouinterview/utils/app_config.dart';
import 'package:yuekeyouinterview/utils/navigation_utils.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);

  @override
  _EntrancePageState createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: AppConfig.screenWidth(context),
              child: const Text(
                'Technical assessment For HZ Yuekeyou Tech',
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: () {
                NavigatorUtil.push(context, Routes.dogListPage);
              },
              icon: const Text(
                'Tap to Begin',
              ),
            ),
          ],
        ));
  }
}
