import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.black)),
        title: Text(
          '�߰�ŷ� �۾���',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('�Ϸ�', style: TextStyle(color: Colors.orange)))
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Image.asset(
              'assets/camera.png',
              width: 131,
              height: 130,
            ),
            SizedBox(
              height: 22,
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Text(
                '����',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Text(
                'ī�װ�',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Text(
                '����',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
