import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class specificPage extends StatefulWidget {
  const specificPage({super.key});

  @override
  State<specificPage> createState() => _specificPageState();
}

class _specificPageState extends State<specificPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 투명색
        elevation: 0.0,
        automaticallyImplyLeading: false, // 자동 버튼 생성 X
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.ios_share,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(children: [
        SizedBox(
          width: double.infinity, // 가로 최대 길이
          height: 405,
          child: Image.asset(
            'assets/macbook.png',
            fit: BoxFit.cover, // width, height 크기에 딱 맞게 하겠다.
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Row(
            children: [
              Image.asset(
                'assets/profile.png',
                width: 50,
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    '파드짱',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '한동대',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  )
                ],
              ),
              SizedBox(width: 150),
              Image.asset(
                'assets/manner.png',
                width: 125,
                height: 82,
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                color: Color(0xFFD8D8D8),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '맥북',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 17),
                  Text(
                    '새 상품 입니다.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text('관심 7',
                          style: TextStyle(
                              color: Color(0XFF767070),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Color(0xFFD8D8D8),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Row(
                children: [
                  Icon(Icons.favorite_border),
                  VerticalDivider(
                    thickness: 3,
                    color: Color(0xFFD8D8D8),
                  ),
                  //
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        '790,000원',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            '가격 제안하기',
                            style: TextStyle(
                              color: Color(0XFFFD7D39),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(width: 160),
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFD7E35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "채팅하기",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
