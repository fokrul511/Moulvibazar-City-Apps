import 'package:clg_final_projects/presentation/widgets/hotel_info_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Hotels and Resort"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              return HotelShowScreen(
                title: doc.get('name')??'',
                hotelimage: doc.get('imageUrl')??'',
                rating: doc.get('rating')??'',
              );
            },
          );
        }
      ),
    );
  }
}
