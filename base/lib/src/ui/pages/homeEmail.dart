import 'package:base/src/models/email.dart';
import 'package:flutter/material.dart';

import 'package:base/src/ui/responsive.dart';
import 'package:base/src/ui/components/menu_side.dart';
import 'package:base/src/ui/email/email_screen.dart';
import 'package:base/src/ui/email/email_list.dart';

class HomeEmail extends StatelessWidget {
  const HomeEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        mobile: const EmailList(),
        tablet: Row(
          children: const [
            Expanded(flex: 6, child: EmailList()),
            Expanded(flex: 9, child: EmailScreen())
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: const SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: const EmailList(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: const EmailScreen(),
            )
          ],
        ),
      ),
    );
  }
}