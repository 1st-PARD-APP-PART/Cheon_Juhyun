import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webtoonhw_cheon_ju_hyun/models/webtoon_model.dart';
import 'package:webtoonhw_cheon_ju_hyun/services/api_service.dart';
import 'package:webtoonhw_cheon_ju_hyun/widgets/webtoon_widgets.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: Text('오늘의 웹툰',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        
        )
      ),
      body: FutureBuilder(
        future: webtoons,
        //snapshot으로 future의 상태 얄 수 있다
        builder:(context, snapshot) {
          if(snapshot.hasData)
          {
            return Column(
              children: [
                SizedBox(height: 50,),
                //expanded는 row나 column을 확장해서 child가 남는 공간 채우게 한다
                //listview를 expanded안에 넣어서 listview가 남는 공간 채우고 크기 조정
                Expanded(child: makeList(snapshot))
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
          //수직이 아니라 수평방향으로 만들고, 화면에 보이는 item만 데이타 불러온다
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length,
          padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
          itemBuilder: (context, index){
            //index가 0,1,2인 아이템이 build됐다고 알려준다
            var webtoon = snapshot.data![index];
            return Webtoon(title: webtoon.title, thumb:webtoon.thumb, id:webtoon.id);
          },
          separatorBuilder: (context, index) => SizedBox(
            width:40
          ),
        );
  }
}
