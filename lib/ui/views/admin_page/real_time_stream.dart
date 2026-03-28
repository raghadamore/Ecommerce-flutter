import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
//real time with stream builder
//شبه الى حد كبير future builer
//الفرق ان الاتصال بال future يبقى ليريكوست واحد ثم يقفل الاتصال
//بينما stream يبقى مفتوح طول فترة تشغيل التطبيق
//بحيث يعكس التغييرات التي تحدث بالقاعدة بشكل مباشر
class RealTimeWithStreamBuilder extends StatelessWidget {
  const RealTimeWithStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
   Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection("categories").snapshots();
    return Scaffold(
     appBar: TAppBar(title: Text("real time"),),
     body: Container(
          child: StreamBuilder(
            stream: userStream, 
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("error");
              }
              if (snapshot.connectionState==ConnectionState.waiting) {
                return Text("..loading");
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("${snapshot.data!.docs[index]["name"]}"),
                  ),
                );
              },);
          },),
     ),
    );
  }
}