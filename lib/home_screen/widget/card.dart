import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meragi/models/produuct_model.dart';

class MyProductCard extends StatelessWidget {
  Product product;
  MyProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color(0x0D000000),
          blurRadius: 100.0,
          spreadRadius: 2.0,
          offset: Offset(
            0.0,
            0.0,
          ),
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network(
            product.image,
            height: 160,
            width: 160,
            fit: BoxFit.fill,
          ),
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.4,
              child: Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  product.rating.rate,
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(
                  width: 3,
                ),
                RatingBar.builder(
                  initialRating: double.parse(product.rating.rate),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  tapOnlyMode: false,
                  updateOnDrag: false,
                  onRatingUpdate: (rating) {
                    rating = double.parse(product.rating.rate);
                  },
                ),
                const SizedBox(
                  width: 1,
                ),
                Text(
                  "(${product.rating.count})",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Price: \$${product.price}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Free Delivery",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ]),
    );
  }
}
