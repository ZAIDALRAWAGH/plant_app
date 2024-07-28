import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';
import '../model/plants.dart';
import 'details_page.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addToCart;
  const CartPage({
    super.key,
    required this.addToCart,
  });

  @override
  State<CartPage> createState() => _HomePageState();
}

class _HomePageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.addToCart.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('images/add-cart.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your Cart Plants',
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    )
                  ],
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: widget.addToCart.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: DetailsPage(
                                        plantId:
                                            widget.addToCart[index].plantId,
                                      ),
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: Container(
                              height: 80,
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      Constants.primaryColor.withOpacity(.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Constants.primaryColor
                                                .withOpacity(.8),
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          widget.addToCart[index].imageURL,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.addToCart[index].category,
                                              style: TextStyle(
                                                color: Constants.blackColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              widget.addToCart[index].plantName,
                                              style: TextStyle(
                                                  color: Constants.blackColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${widget.addToCart[index].price}',
                                    style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Totals',
                            style: TextStyle(
                              fontSize: 20,
                              color: Constants.primaryColor,
                            ),
                          ),
                          Text(
                            '\$100',
                            style: TextStyle(
                                fontSize: 16,
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                    // Column(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: const Divider(
                    //         color: Colors.black,
                    //         thickness: 2,
                    //       ),
                    //     ),
                    //     Text('data')
                    //   ],
                    // ),
                  ],
                ),
              ));
  }
}
