import 'package:clg_final_projects/presentation/model/news_list.dart';
import 'package:clg_final_projects/presentation/widgets/web_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MoulvibazarNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('মৌলভীবাজার জেলার সকল পত্রিকা'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: moulvibazarNewsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                    () => WebViewScreen(
                  title: moulvibazarNewsList[index]['title'].toString(),
                  url: moulvibazarNewsList[index]['link'].toString(),
                ),
              );
              print('Tapped on ${nationalNewsList[index]["title"]}');
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  moulvibazarNewsList[index]["title"]!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
