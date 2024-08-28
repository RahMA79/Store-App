import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.productModel});
  ProductModel productModel;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(5, 5),
              spreadRadius: 0,
            ),
          ]),
          child: Card(
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.productModel.title.substring(0, 10),
                    style: style,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${widget.productModel.price}',
                        style: style,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 15,
          child: Image.network(
            widget.productModel.image,
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
