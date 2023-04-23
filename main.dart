import 'package:flutter/material.dart';
import 'package:third_hw_cheonjuhyun/Screen/Signup.dart';
import 'Screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 180,
            ),
            Image.asset(
              'assets/carrot.png',
              height: 193,
              width: 193,
            ),
            Text(
              '당신 근처의 당근마켓',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              '중고 거래부터 동네 정보까지,\n지금 내 동네를 선택하고 시작해보세요!',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100, width: 200),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(354, 56), primary: Color(0XFFFF7E36)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text('시작하기')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('이미 계정이 있나요?', style: TextStyle(color: Colors.black)),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      '로그인',
                      style: TextStyle(color: Color(0XFFFF7E36)),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
