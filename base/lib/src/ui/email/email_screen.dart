import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import '../../constants.dart';
// import '../../models/email.dart';
// import 'header.dart';

import 'package:base/src/constants.dart';
import 'package:base/src/models/email.dart';
import 'package:base/src/ui/email/email_header.dart';
import 'package:websafe_svg/websafe_svg.dart';

class EmailScreen extends StatelessWidget {
  final Email? email;
  const EmailScreen({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: SafeArea(
              child: Column(
            children: [
              const EmailHeader(),
              const Divider(
                thickness: 1,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(paddingDefault),
                  child: email == null ? const Center(child: Text("Select item")) : 
                  
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(email!.image),
                      ),
                      const SizedBox(width: paddingDefault),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(TextSpan(
                                          text: email!.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                          children: [
                                            TextSpan(
                                              text:
                                                  "  <elvia.atkins@gmail.com> to Jerry Torp",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            )
                                          ])),
                                      Text(
                                        email!.subject,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: paddingDefault / 2),
                                Text(
                                  email!.time,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            const SizedBox(height: paddingDefault),
                            LayoutBuilder(
                                builder: ((context, constraints) => SizedBox(
                                      width: constraints.maxWidth > 850
                                          ? 800
                                          : constraints.maxWidth,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            email!.body,
                                            style: const TextStyle(
                                              height: 1.5,
                                              color: Color(0xFF4D5875),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                              height: paddingDefault),
                                          if (email!.isAttachmentAvailable)
                                            Row(
                                              children: [
                                                const Text(
                                                  "6 attachments",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "Download All",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                                const SizedBox(
                                                    width: paddingDefault / 4),
                                                WebsafeSvg.asset(
                                                  "assets/images/icons/Download.svg",
                                                  height: 16,
                                                  color: colorGray,
                                                )
                                              ],
                                            ),
                                          const Divider(thickness: 1),
                                          const SizedBox(
                                              height: paddingDefault / 2),
                                          SizedBox(
                                              // height: 200,
                                              child: StaggeredGrid.count(
                                                crossAxisCount: 4,
                                                mainAxisSpacing: paddingDefault,
                                                crossAxisSpacing: paddingDefault,
                                                children: [
                                                  StaggeredGridTile.count(
                                                    crossAxisCellCount: 2,
                                                    mainAxisCellCount: 1,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.asset("assets/images/emails/Img_0.png", fit: BoxFit.cover),
                                                    )
                                                  ),
                                                  StaggeredGridTile.count(
                                                    crossAxisCellCount: 2,
                                                    mainAxisCellCount: 2,
                                                    child: Image.asset("assets/images/emails/Img_1.png", fit: BoxFit.cover)
                                                  ),
                                                  StaggeredGridTile.count(
                                                    crossAxisCellCount: 2,
                                                    mainAxisCellCount: 1,
                                                    child: Image.asset("assets/images/emails/Img_2.png", fit: BoxFit.cover)
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
