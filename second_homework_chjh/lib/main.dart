import 'package:flutter/material.dart';
import 'data.dart'; // data.dart의 정보를 import 한다.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Future<List<String>> _getData() async {
    // 1. Future를 통해 data.dart의 리스트 정보를 가져올 때 async, await와 Future.delayed를 활용하여 10초의 정지 시간을 갖도록 한다.
    // 2. 10초가 지난 후 리스트 정보를 가져왔다면 then()을 활용하여 console창에 ‘출력 완료’ 라는 text가 출력하도록 만들어준다.
    return await Future.delayed(const Duration(seconds: 10), () {
      return myData;
    }).then((val) {
      print('출력완료!');
      return val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: FutureBuilder<List<String>>(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Loading........'),
            );
          }
        },
        // 3. FutureBuilder<List<String>>와 Listview.Builder를 활용하여 아래 ListTile 코드를 통해 결과 화면과 같은 화면을 출력한다.
      ),
    );
  }
}
