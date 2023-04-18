import 'package:flutter/material.dart';
import 'package:meragi/models/produuct_model.dart';
import 'package:meragi/services/services.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      product = HttpService.getProduct();
                    });
                  },
                  child: const Text("Get Product")),
            ),
            FutureBuilder(
                future: product,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("TITLE: ${snapshot.data![index].title}"),
                        );
                      },
                    );
                  } else
                    return Text("No product to show");
                })
          ]),
        ),
      ),
    );
  }
}
