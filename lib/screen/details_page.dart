import 'package:flutter/material.dart';
import 'package:projrct01/constants.dart';

import '../model/plants.dart';

class DetailsPage extends StatefulWidget {
  final int plantId;
  const DetailsPage({super.key, required this.plantId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    bool toggleIsSelected(bool isSelcted) {
      return !isSelcted;
    }

    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Scaffold(
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(.3)),
                  ]),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      bool isSelect = toggleIsSelected(
                          plantList[widget.plantId].isSelected);
                      plantList[widget.plantId].isSelected = isSelect;
                    });
                  },
                  icon: Icon(Icons.shopping_cart,
                      color: plantList[widget.plantId].isSelected == true
                          ? Constants.primaryColor
                          : Colors.white)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          color: Constants.primaryColor.withOpacity(.3),
                          blurRadius: 5)
                    ]),
                child: const Center(
                    child: Text(
                  'BUY NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Constants.primaryColor.withOpacity(.15)),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bool isFavorite = toggleIsFavorite(
                            plantList[widget.plantId].isFavorated);
                        plantList[widget.plantId].isFavorated = isFavorite;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Constants.primaryColor.withOpacity(.15)),
                      child: Icon(
                        plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.symmetric(),
              child: Stack(
                children: [
                  Positioned(
                      left: 15,
                      top: 10,
                      child: SizedBox(
                          height: size.height * .4,
                          child:
                              Image.asset(plantList[widget.plantId].imageURL))),
                  Positioned(
                      top: 10,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            title: 'Size',
                            plantFeature: plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'Humidity',
                            plantFeature:
                                plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeature(
                            title: 'Temperature',
                            plantFeature: plantList[widget.plantId].temperature,
                          ),
                        ],
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 50, left: 30, right: 30),
                      height: size.height * .5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plantList[widget.plantId].plantName,
                                    style: TextStyle(
                                        color: Constants.primaryColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$${plantList[widget.plantId].price}',
                                    style: TextStyle(
                                        color: Constants.blackColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    plantList[widget.plantId].rating.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Constants.primaryColor),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Constants.primaryColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Expanded(
                            child: Text(
                              plantList[widget.plantId].decription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 18,
                                  color: Constants.blackColor.withOpacity(.7)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
