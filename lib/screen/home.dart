import 'package:flutter/material.dart';
import 'memberlogin.dart';

class Homekpts extends StatelessWidget {
  const Homekpts({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("หน้าหลัก"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image:
                    NetworkImage('https://save.kpt.ac.th/' + args.profilePic),
                fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
