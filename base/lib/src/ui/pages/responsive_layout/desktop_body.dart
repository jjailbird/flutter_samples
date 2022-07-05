// package_info_plus example https://dev-yakuza.posstree.com/ko/flutter/package_info_plus/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text('D E S K T O P'),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // first colomn
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        // height: 250,
                        color: Colors.deepPurple[400],
                        // height: 250,
                        child: FutureBuilder<PackageInfo>(
                          future: _getPackageInfo(),
                          // initialData: InitialData,
                          builder: (BuildContext context,
                              AsyncSnapshot<PackageInfo> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Loading package info error!');
                            } else if (!snapshot.hasData) {
                              return const Text('Loading...');
                            }

                            final data = snapshot.data;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('App Name: ${data?.appName}'),
                                Text('Package Name: ${data?.packageName}'),
                                Text('Version: ${data?.version}'),
                                Text('Build Number: ${data?.buildNumber}'),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.deepPurple[300],
                          height: 120,
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
            // second coloumn
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: Colors.deepPurple[300],
              ),
            )
          ],
        ),
      ),
    );
  }
}
