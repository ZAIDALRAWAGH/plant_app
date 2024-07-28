import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projrct01/constants.dart';

import '../model/plants.dart';
import 'details_page.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoritePage({
    super.key,
    required this.favoritedPlants,
  });

  @override
  State<FavoritePage> createState() => _HomePageState();
}

class _HomePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.favoritedPlants.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('images/favorited.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your favorited Plants',
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
                height: size.height * .5,
                child: ListView.builder(
                  itemCount: widget.favoritedPlants.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailsPage(
                                  plantId:
                                      widget.favoritedPlants[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        height: 80,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Constants.primaryColor.withOpacity(.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    widget.favoritedPlants[index].imageURL,
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
                                        widget.favoritedPlants[index].category,
                                        style: TextStyle(
                                          color: Constants.blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        widget.favoritedPlants[index].plantName,
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
                              '\$${widget.favoritedPlants[index].price}',
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
              ));
  }
}
