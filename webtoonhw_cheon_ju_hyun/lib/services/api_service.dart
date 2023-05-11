import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtoonhw_cheon_ju_hyun/models/webtoon_detail_model.dart';
import 'package:webtoonhw_cheon_ju_hyun/models/webtoon_episode_model.dart';
import 'package:webtoonhw_cheon_ju_hyun/models/webtoon_model.dart';
//설치한 http패키지를 http라고 저장

class ApiService{
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today="today";

//get을 사용하려면 uri가 있어야한다
//get으로 http 패키지 
//getTodayToons함수 호출하면 Dart가 이 부분을 제대로 완료할 때까지 기다림
//데이타가 커서 느림->get은 Future <Response>형식인데 Future은 나중에 실행된다는 뜻, Response는 실행되고 나오는 결과값
  Future <List<WebtoonModel>> getTodaysToons() async
  {
    List<WebtoonModel> webtoonInstances = [];
    final url=Uri.parse('$baseUrl/$today');
    final response=await http.get(url);
    //<Response>에 올 값을 response라는 변수에 저장
    if(response.statusCode == 200){
      //우리가 사용할 webtoon이란 변수들 dynamic으로 이루어진 List로 되어있다
       final List<dynamic> webtoons =  jsonDecode(response.body);     //string을 매개변수로, 반환 type= dynamic이여서 설정해줘야 한다
    
    for(var webtoon in webtoons)
    {
      //wbt_model에 있는 WebtoonModel불러와서 webtoon을 넘겨줘서 WebtoonModel만든다
      //toon 변수 type은 webtoonModel
      //final toon = WebtoonModel.fromJson(webtoon);
      webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      //final instance = WebtoonModel.fromJson(webtoon);
      //webtoonInstances.add(instance); 
    }
    return webtoonInstances;
    }
    throw Error();
  }

//id로 웹툰 받아오는 method
static Future<WebtoonDetailModel> getToonById(String id) async{
  final url = Uri.parse('$baseUrl/$id');    //url만들고
  final response=await http.get(url);       //url로 request보내고
  if(response.statusCode == 200){           //성공적이면
    final webtoon = jsonDecode(response.body);   //response.body받아서 json으로 변환
    
    return WebtoonDetailModel.fromJson(webtoon);  //json을 constructor로 전달
  }                                   //거기서 title, age등 값 할당해줌
    throw Error();

}

//id로 최근 에피소드 받아옴
static Future <List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async{
  List<WebtoonEpisodeModel> episodesInstances = []; 
  
  final url = Uri.parse('$baseUrl/$id/episodes');    //url만들고
  final response=await http.get(url);       //url로 request보내고
  if(response.statusCode == 200){           //성공적이면
    final episodes = jsonDecode(response.body);   //episodes를 json으로 decode
    for(var episode in episodes){           //각각 json 에피소드마다 
      episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));  //새로운 WebtoonEpisodeModel생성

    } 
    return episodesInstances;     //그 model의 instance들 instancelistdp ekadkwna
  }                                   //거기서 title, age등 값 할당해줌
    throw Error();

}

}
