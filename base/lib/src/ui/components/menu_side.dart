import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import '../extension_widget.dart';
import '../responsive.dart';

import 'menu_side_item.dart';
import 'tags.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: colorBgLight,
      padding: const EdgeInsets.only(top: kIsWeb ? paddingDefault : 0),
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/emails/Logo Outlook.png",
                    width: 46,
                  ),
                  const Spacer(),
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              // const Spacer(),
              const SizedBox(
                height: paddingDefault,
              ),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: paddingDefault,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: colorPrimary,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/images/icons/Edit.svg",
                    width: 16),
                label: const Text(
                  "New message",
                  style: TextStyle(color: Colors.white),
                ),
              ).addNeumorphism(
              topShadowColor: Colors.white,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
            ),
              const SizedBox(height: paddingDefault * 2),
              TextButton.icon(
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/images/icons/Download.svg", width: 16),
                label: const Text(
                  "Get messages", 
                  style: TextStyle(color: colorText),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(colorPrimary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: paddingDefault)
                  ),
                  // Full width button
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size.fromHeight(10)
                  ),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
              ),
              const SizedBox(height: paddingDefault * 2),
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/images/icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/images/icons/Send.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/images/icons/File.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/images/icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              const SizedBox(height: paddingDefault * 2),
              const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
