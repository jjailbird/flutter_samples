import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

// import '../../constants.dart';
// import '../responsive.dart';

import 'package:base/src/constants.dart';
import 'package:base/src/ui/responsive.dart';

class EmailHeader extends StatelessWidget {
  const EmailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingDefault),
      child: Row(
        children: [
          // if (Responsive.isMobile(context)) const BackButton(),
          const BackButton(),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/Trash.svg",
              width: 24
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/Reply.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/Reply all.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/Transfer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          if (Responsive.isDesktop(context))
            IconButton(
              icon: WebsafeSvg.asset(
                "assets/images/icons/Printer.svg",
                width: 24,
              ),
              onPressed: () {},
            ),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/Markup.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/More vertical.svg",
              width: 24,
            ),
            onPressed: () {},
          ),

        ],
      ),
    );    
  }
}