import 'package:flutter/material.dart';
import 'memberlogin.dart';
import 'settings.dart';

class Homekpts extends StatelessWidget {
  const Homekpts({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("หน้าหลัก"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => settingskpt()));
            },
          )
        ],
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
          child: Column(
            children: <Widget>[
              Row(
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
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Row(children: [
                  GestureDetector(
                    onTap: null,
                    child: Image.asset(
                      'assets/images/ข้อมูลออมทรัพย์.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/ข้อมูลออมทรัพย์.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/ข้อมูลออมทรัพย์.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Row(children: [
                  GestureDetector(
                    onTap: null,
                    child: Image.asset(
                      'assets/images/ข้อมูลออมทรัพย์.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/ข้อมูลออมทรัพย์.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/ข้อมูลออมทรัพย์.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Row(children: [
                  GestureDetector(
                    onTap: null,
                    child: Image.asset(
                      'assets/images/ข้อมูลออมทรัพย์.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/ข้อมูลออมทรัพย์.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/ข้อมูลออมทรัพย์.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        )
      ]),
    );
  }
}
