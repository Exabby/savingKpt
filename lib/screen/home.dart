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
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/profile_image.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://save.kpt.ac.th/' + args.profilePic),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 15),
                child: Column(
                  children: [
                    Text(
                      args.title + args.name + " " + args.lname,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Text(
                        args.id,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
