
class WebtoonModel{
  late final String title,thumb,id;
    //필수 매개변수로 설정하는 방법
    // required this.title,
    // required this.thumb,
    // required this.id,

    //webtoons class를 이용해서 named constructor로 만드는 방법
    //fromjson constructor는 String, dynamic으로 이루어진 json이라는 이름의 Map을 받는다
    WebtoonModel.fromJson(Map<String, dynamic> json) :
    title = json['title'],
    thumb = json['thumb'],
    id = json['id'];
    
    //json의 제목, 썸네일, 아이디 값 초기화
    //api로부터 json 넘겨주고 webtoonmodel title을 json의 title로 초기화
  }