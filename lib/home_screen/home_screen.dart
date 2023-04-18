import 'package:flutter/material.dart';
import 'package:meragi/home_screen/widget/card.dart';
import 'package:meragi/models/produuct_model.dart';
import 'package:meragi/services/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future<List<Product>>? product;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          "HOME",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Hot Deals For Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: HttpService.getProduct(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return MyProductCard(product: snapshot.data![index]);
                    },
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              },
            )
          ]),
        ),
      ),
    );
  }
}
