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
    
    //_getData는 10초 후에 myData에 있는 정보들을 리턴한다. future <List<String>>을 리턴하는데, 10초 후에 future는 계속 <List<String>>이다. 
    //future<List<String>>은 .then()으로 다루는데, val에서 future <List<String>>의 값이 들어가서, '출력완료!'를 출력한다. 
    //async로 비동기적으로 실행하고, await 붙어있는 Future.delayed부터 실행한다. _getData()에 Future<List<String>>을 우선 리턴하고, 값 나오면 myData리턴한다. 
    
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
      //앱 실행하면 비동기적으로 데이타 받아와서 listview.builder로 출력한다.
      //futurebuilder-데이터가 받아오기 전 미리 화면에 그려주기 위해 
      //future에서는 _getData()호출해서 반환값이 Future<List<String>>인 것을 알려준
      //future에서 받아 온 것으로 builder에서 ui만든다. 
      //snapshot.data로 값 있으면 listview.builder반환. 
      //값 없을때는 loading...을 표시해준다  
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
