import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_hw_cheonjuhyun/Screen/Home.dart';
import 'Bottom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Color(0XFF444444),
              icon: Icon(Icons.arrow_back_ios),
            )),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text('안녕하세요!\n휴대폰 번호로 로그인 해주세요.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                SizedBox(width: 311, height: 10),
                Text('휴대폰 번호는 안전하게 보관되며 이웃들에게 공개되지 않아요',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(height: 5),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '휴대폰 번호 (-없이 숫자만 입력)',
                  ),
                ),
                SizedBox(width: 311, height: 13),
                const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호',
                    )),
                SizedBox(width: 311, height: 23),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(358, 91),
                    primary: Color(0XFFFF7E36),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BottomNavigationBarExample()));
                  },
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
