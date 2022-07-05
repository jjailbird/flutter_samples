import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WebsafeSvg.asset("assets/images/icons/Angle down.svg", width: 16),
            const SizedBox(
              width: paddingDefault / 2,
            ),
            WebsafeSvg.asset("assets/images/icons/Markup.svg", width: 20),
            const SizedBox(
              width: paddingDefault / 2,
            ),
            Text(
              "Tags",
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: colorGray),
            ),
            const Spacer(),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: colorGray,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: paddingDefault / 20,
        ),
        buildTag(context, color: const Color(0xFF23CF91), title: "Design"),
        buildTag(context, color: const Color(0xFF3A6FF7), title: "Work"),
        buildTag(context, color: const Color(0xFFF3CF50), title: "Friends"),
        buildTag(context, color: const Color(0xFF8338E1), title: "Family"),
      ],
    );
  }
}

Widget buildTag(BuildContext context,
    {required Color color, required String title}) {
  return Material(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(paddingDefault * 1.5, 10, 0, 10),
        child: Row(
          children: [
            WebsafeSvg.asset("assets/images/icons/Markup filled.svg",
                height: 18, color: color),
            const SizedBox(width: paddingDefault / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: colorGray),
            )
          ],
        ),
      ),
    ),
  );
}
