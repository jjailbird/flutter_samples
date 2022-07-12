import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

// import '../../constants.dart';
// import 'badge_counter.dart';

import 'package:base/src/constants.dart';
import 'package:base/src/ui/components/badge_counter.dart';

class SideMenuItem extends StatelessWidget {
  final bool isActive, isHover, showBorder;
  final int? itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  const SideMenuItem(
      {Key? key,
      this.isActive = false,
      this.isHover = false,
      this.showBorder = true,
      this.itemCount,
      required this.iconSrc,
      required this.title,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: paddingDefault),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset(
                    "assets/images/icons/Angle right.svg",
                    width: 15,
                  )
                : const SizedBox(width: 15),
            const SizedBox(width: paddingDefault / 4),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      iconSrc,
                      height: 20,
                      color: (isActive || isHover) ? colorPrimary : colorGray,
                    ),
                    const SizedBox(width: paddingDefault * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color:
                                (isActive || isHover) ? colorText : colorGray,
                          ),
                    ),
                    const Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount!)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
