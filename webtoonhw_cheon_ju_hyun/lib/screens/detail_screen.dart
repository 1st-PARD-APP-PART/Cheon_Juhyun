import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoonhw_cheon_ju_hyun/models/webtoon_detail_model.dart';
import 'package:webtoonhw_cheon_ju_hyun/models/webtoon_episode_model.dart';
import 'package:webtoonhw_cheon_ju_hyun/services/api_service.dart';
import 'package:webtoonhw_cheon_ju_hyun/widgets/episode_widgets.dart';

class DetailScreen extends StatefulWidget {
    final String title, thumb, id;

  const DetailScreen({super.key, 
  required this.title,
  required this. thumb, 
  required this.id,});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //나중에 initState에서 정의한다
    late Future<WebtoonDetailModel> webtoon; 
    late Future<List<WebtoonEpisodeModel>> episodes;
    late SharedPreferences prefs;
    bool isLiked = false;

    Future initPrefs() async{
      prefs = await SharedPreferences.getInstance();
      final likedToons = prefs.getStringList('likedToons');
      if(likedToons != null){
            if(likedToons.contains(widget.id) == true)
            {
              setState(() {
                  isLiked = true;
              });
            }
      }
      else{
        await prefs.setStringList('likedToons', []);
          }
    }

  @override
  void initState(){
      super.initState();
      //State를 extend하고 있는 class에서 작업 중 
      //별개의 class에서 작업하고 있기 때문에 widget.id로 적어야 한다
      webtoon = ApiService.getToonById(widget.id);
      episodes= ApiService.getLatestEpisodesById(widget.id);
      initPrefs();
    }

    onHeartTap() async{
           final likedToons = prefs.getStringList('likedToons');
      if(likedToons != null){
        if(isLiked == true){
          likedToons.remove(widget.id);
        }
        else{
          likedToons.add(widget.id);
        }
        //list를 핸드폰 저장소에 저장
        await prefs.setStringList('likedToons', likedToons);

        setState(() {
          isLiked != isLiked;
        });
      }
    }
    
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(onPressed: onHeartTap, 
          icon: Icon(
            isLiked ? Icons.favorite : 
            Icons.favorite_outline_outlined))
        ],
        //widget은 detailScreen의 위젯
        //widget은 State에 있는 detailScreen으로 가라는 뜻
        title: Text(widget.title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                              width: 250,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                //그냥 borderRadius만 하면 적용x-> clipBehavior라는 것 때문
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 15,
                                    offset: Offset(10,10),
                                    color: Colors.black.withOpacity(0.5)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.network(widget.thumb)),
                  ),
                ],
              ),
              const SizedBox(height: 25), 
              FutureBuilder(
                  future: webtoon,   
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        crossAxisAlignment: 
                        CrossAxisAlignment.center,
                        children: [
                          
                          Text(snapshot.data!.about,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          ),
                          SizedBox( height: 15,),
          
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                },), 
                SizedBox(
                  height: 25,
                ),
                   FutureBuilder(
                    future: episodes,
                    builder: (context, snapshot){
                      if(snapshot.hasData) 
                          {
                            return Column(
                              children: [
                                for(var episode in snapshot.data!)
                                Episode(episode: episode, 
                                webtoonId: widget.id)
                              ],
                            );
                          }
                          return Container();
                    }),
                
            ],
          ),
        ),
      )
      );
  }
}