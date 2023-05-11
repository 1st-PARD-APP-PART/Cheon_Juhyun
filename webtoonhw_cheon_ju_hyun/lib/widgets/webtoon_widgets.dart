import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({super.key,
  required this.title,
  required this. thumb, 
  required this.id,
  });

  @override
  Widget build(BuildContext context) {
    //제스쳐 디텍터 탭하면 메터리얼 페이지 루트 만들고 detailScreen위젯 만듬
//그리고 title을 detail_screen으로 보내고, title을 받으면 앱바에서 보여준다
    return GestureDetector(
      onTap: (){
        //route는 Stateless위젯을 애니메이션 효과로 감싸서 스크린 처럼 보이게 하는것
        Navigator.push(context, MaterialPageRoute
        (builder: (context)=> DetailScreen
        (title: title, thumb: thumb, id: id),
        //바닥에서부터 올라옴
        fullscreenDialog: true,
        ));
      },
      child: Column(
                children: [
                  Hero
                  (
                    tag: id, 
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
                      child: Image.network(thumb)),
                  ),
    
                    SizedBox(height: 10,),
                  Text(
                    title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )
                  )
                ],
              ),
    );
    
    
  }
}