import 'package:base/src/ui/components/menu_side.dart';
import 'package:base/src/ui/responsive.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import 'email_card.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class EmailList extends StatefulWidget {
  const EmailList({Key? key}) : super(key: key);

  @override
  State<EmailList> createState() => _EmailListState();
}

class _EmailListState extends State<EmailList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: const SideMenu()),
      body: Container(
        padding: const EdgeInsets.only(top: kIsWeb ? paddingDefault : 0),
        color: colorBgDark,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
              child: Row(children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                if (!Responsive.isDesktop(context)) const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      fillColor: colorBgDark,
                      filled: true,
                      suffixIcon: Padding(
                        padding:
                            const EdgeInsets.all(paddingDefault * 0.75), //15
                        child: WebsafeSvg.asset(
                          "assets/images/icons/Search.svg",
                          width: 24,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: paddingDefault,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
              child: Row(
                children: [
                  WebsafeSvg.asset(
                    "assets/images/icons/Angle down.svg",
                    width: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "Sort by date",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {},
                    child: WebsafeSvg.asset(
                      "assets/images/icons/Sort.svg",
                      width: 16
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: paddingDefault),
          ],
        ),
      ),
    );
  }
}
