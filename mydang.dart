import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_hw_cheonjuhyun/main.dart';
import '/main.dart';
import 'EditProfile.dart';

class myDang extends StatefulWidget {
  const myDang({super.key});

  @override
  State<myDang> createState() => _myDangState();
}

class _myDangState extends State<myDang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          titleSpacing: 0.0,
          title: Transform(
            transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            child: Text(
              '나의 당근',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),
            ),
          ),
          centerTitle: false,
          actions: [
            TextButton(
                onPressed: () {
                  //        Navigator.push(context,
                  //          MaterialPageRoute(builder: (context) => (MyHomePage())));
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )),
            SizedBox(
              width: 35,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 6, 11, 0),
          child: Column(
            children: [
              Row(
                children: [
                  // SizedBox(
                  //   height: 154,
                  // ),
                  Image.asset(
                    'assets/profile.png',
                    width: 129,
                    height: 125,
                  ),
                  SizedBox(width: 45),
                  Text('본인이름',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      )),
                  SizedBox(width: 150),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => EditProfilePage())));
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  _Buildcontainer(Icons.list, '판매내역'),
                  SizedBox(width: 80),
                  _Buildcontainer(Icons.shopping_bag, '구매내역'),
                  SizedBox(width: 80),
                  _Buildcontainer(Icons.favorite, '관심목록'),
                ],
              ),
              Divider(),
              SizedBox(
                height: 40,
                child: Center(
                    child: Text(
                  '최근판매내역',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0XFF000000)),
                )),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Stack(children: [
                Image.asset('assets/s22.png'),
                Padding(
                  padding: EdgeInsets.fromLTRB(180, 150, 50, 0),
                  child: Text('갤럭시 22',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white)),
                ),
              ]))
            ],
          ),
        ));
  }

  Column _Buildcontainer(IconData icon, String label) {
    return Column(children: [
      Container(
        height: 63,
        width: 63,
        child: Icon(
          icon,
          color: Color(0XFFFF7E36),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFCEEE0),
          shape: BoxShape.circle,
        ),
      ),
      Text(
        label,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
    ]);
  }
}
