import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class localPage extends StatefulWidget {
  const localPage({super.key});

  @override
  State<localPage> createState() => _localPageState();
}

class _localPageState extends State<localPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              child: Text(
                '±ÙÃ³ µ¿³×',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
              ),
            ),
            ListView.separated(
              itemCount: 12,
              itemBuilder: (BuildContext ctx, int index) {
                return SizedBox(
                  height: 60,
                  child: Text('°æ»óºÏµµ Æ÷Ç×½Ã ºÏ±¸ ÈïÇØÀ¾ ÇÑµ¿·Î 558',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0,
                color: Color(0XFFE8E8E8),
              ),
            ),
          ],
        ));
  }
}
