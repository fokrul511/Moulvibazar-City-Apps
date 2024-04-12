import 'package:clg_final_projects/presentation/model/hospital_data_list.dart';
import 'package:clg_final_projects/presentation/widgets/show_hospital_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('hospital').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              return ListView.builder(
                // itemCount: hospitalDataList.length,
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        Get.to(()=>HospitalShowPage(docId: doc.id, hospitalNameEng: doc.get('name'),) );
                      },
                      title: Text(
                        doc.get('name'),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: const Text("Moulvibazar"),
                      trailing: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/medical.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
