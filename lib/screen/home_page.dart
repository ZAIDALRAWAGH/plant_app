// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projrct01/constants.dart';
import 'package:projrct01/model/plants.dart';
import 'package:projrct01/screen/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedindex = 0;
    Size size = MediaQuery.of(context).size;
    List<Plant> planList = Plant.plantList;
    List<String> plantType = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    // ignore: unused_element
    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.1),
                        ),
                        const Expanded(
                          child: TextField(
                            keyboardType: TextInputType.none,
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Search plant',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plantType.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      child: Text(
                        plantType[index],
                        style: TextStyle(
                            fontWeight: selectedindex == index
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: selectedindex == index
                                ? Constants.primaryColor
                                : Constants.blackColor,
                            fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                itemCount: planList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailsPage(
                                plantId: planList[index].plantId,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorite = toggleIsFavorite(
                                        planList[index].isFavorated);
                                    planList[index].isFavorated = isFavorite;
                                  });
                                },
                                icon: Icon(
                                  planList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                                color: Constants.primaryColor,
                                iconSize: 30,
                              ),
                            ),
                          ),
                          Positioned(
                              left: 50,
                              right: 50,
                              top: 50,
                              bottom: 50,
                              child: Image.asset(planList[index].imageURL)),
                          Positioned(
                              bottom: 15,
                              left: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    planList[index].category,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    planList[index].plantName,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '\$${planList[index].price}',
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
              child: const Text(
                'New Plants',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: planList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailsPage(
                                plantId: planList[index].plantId,
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
                                    color:
                                        Constants.primaryColor.withOpacity(.8),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  planList[index].imageURL,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      planList[index].category,
                                      style: TextStyle(
                                        color: Constants.blackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      planList[index].plantName,
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
                            '\$${planList[index].price}',
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
          ],
        ),
      ),
    );
  }
}
