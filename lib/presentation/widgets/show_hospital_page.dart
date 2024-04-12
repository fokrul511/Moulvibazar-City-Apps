import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HospitalShowPage extends StatefulWidget {
  final String? hospitalNameEng;
  final String docId;

  const HospitalShowPage(
      {super.key, this.hospitalNameEng, required this.docId});

  @override
  State<HospitalShowPage> createState() => _HospitalShowPageState();
}

class _HospitalShowPageState extends State<HospitalShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hospitalNameEng ?? ''),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('hospital')
                .doc(widget.docId)
                .snapshots(),
            builder: (context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              final name = snapshot.data?.get('name') ?? '';
              final hospitalBng = snapshot.data?.get('hospitalBng') ?? '';
              final image = snapshot.data?.get('image') ?? '';
              final address = snapshot.data?.get('Address') ?? '';
              final contactNumber = snapshot.data?.get('ContactNumber') ?? '';
              final ditailsofHospital = snapshot.data?.get('DitailsofHospital') ?? '';


              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: CachedNetworkImageProvider(image?? ""),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hospitalBng??'',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Address:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                         address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Contact:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          contactNumber,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "প্রতিষ্ঠান সম্পর্কে:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          ditailsofHospital,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
