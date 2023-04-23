import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'AddItem.dart';
import 'Bottom.dart';
import 'Home.dart';
import 'local.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('프로필 수정',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/profile.png',
                width: 177,
                height: 171,
              ),
              Container(
                  width: 358,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0XFFDDDDDD),
                        width: 1,
                      )),
                  child: Center(
                    child: Text(
                      '본인 이름을 적어주세요',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  )),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => localPage()));
                },
                leading: Text(
                  '사는곳',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(),
              SizedBox(
                height: 340,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(521, 77),
                  primary: Color(0XFFFF7E36),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomePage())));
                },
                child: Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
