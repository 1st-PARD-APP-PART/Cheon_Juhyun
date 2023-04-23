import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_hw_cheonjuhyun/Screen/mydang.dart';
import 'package:third_hw_cheonjuhyun/Screen/profile.dart';

import 'AddItem.dart';
import 'Specific.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 05,
        backgroundColor: Colors.white,
        leading: Row(
          children: <Widget>[
            SizedBox(width: 5),
            Text(
              '한동대',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.black))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 559,
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (BuildContext ctx, int index) {
                return SizedBox(
                  height: 137,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const specificPage()));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              ('assets/s22.png'),
                              // borderRadius: BorderRadius.circular(10, 0),
                            )),
                        SizedBox(
                          width: 13,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text('S22 자급제 화이트 미개봉',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '군자동',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                                height: 13,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                  color: Color(0XFF34BF9E),
                                ))),
                            Text(
                              '예약중',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: 62,
                              height: 15,
                              child: Text(
                                '750,000원',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0,
                color: Color(0XFFE8E8E8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 280),
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddItemPage()));
                },
                backgroundColor: Color(0XFFE4782A),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
