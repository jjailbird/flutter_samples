import 'package:flutter/material.dart';
// import 'package:base/src/models/email.dart';
import 'package:base/src/constants.dart';
import 'package:base/src/ui/extension_widget.dart';

class EmailCard extends StatelessWidget {
  final bool isActive;
  // final Email email;
  // final VoidCallback press;

  const EmailCard({
    Key? key,
    required this.isActive,
    // required this.email,
    // required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: paddingDefault, vertical: paddingDefault / 2),
        child: Container(
          padding: const EdgeInsets.all(paddingDefault),
          decoration: BoxDecoration(
            color: isActive ? colorPrimary : colorBgDark,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    const SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/emails/user_2.png'),
                        )),
                    const SizedBox(
                      width: paddingDefault / 2,
                    ),
                    Expanded(
                      child: Text.rich(TextSpan(
                          text: "email.name \n",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isActive ? Colors.white : colorText,
                          ),
                          children: [
                            TextSpan(
                              text: 'email.subject',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color:
                                          isActive ? Colors.white : colorText),
                            ),
                          ])),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: paddingDefault / 2,
              ),
              Text(
                'email.body',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption?.copyWith(
                    height: 1.5, color: isActive ? Colors.white70 : null),
              )
            ],
          ),
        ).addNeumorphism(
          blurRadius: 15,
          borderRadius: 15,
          offset: const Offset(5, 5),
          topShadowColor: Colors.white60,
          bottomShadowColor: const Color(0xFF234395).withOpacity(0.15)
        ));
  }
}
