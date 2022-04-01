import 'dart:js';

import 'package:flutter/material.dart';
import 'package:foodme/constant/colors.dart';
import 'package:foodme/constant/fontsize.dart';
import 'package:foodme/constant/helper.dart';
import 'package:foodme/constant/padding.dart';
import 'package:foodme/data/category.dart';
import 'package:foodme/ui/screens/details_screen/details_screen.dart';
import 'package:foodme/ui/widget/store_card.dart';
import 'package:foodme/ui/widget/dish_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/store.dart';
import '../../widget/mainappar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'Home_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
          child: MainAppBar(size: size), preferredSize: Size.fromHeight(80)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(size.width, "21:9"),
              width: double.infinity,
              child: Image.asset(
                'assets/image/main.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: mainPadding, bottom: mainPadding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(storeTypes.length, (index) {
                      return Container(
                        width: 120,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getSvgIcon(storeTypes[index]['image']),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              storeTypes[index]['name'],
                              style:
                                  GoogleFonts.recursive(textStyle: TextStyle()),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: topMainPadding, bottom: bottomMainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: leftMainPadding, right: rightMainPadding),
                      child: Text(
                        "Special Offers",
                        style: GoogleFonts.recursive(
                            textStyle: const TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(storeItems.length, (index) {
                          var store = storeItems[index];
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: leftMainPadding,
                                  right: rightMainPadding),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                                image: store['image'],
                                                name: store['name'],
                                              )));
                                },
                                child: Container(
                                  child: StoreCard(width: 280, store: store),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                              image: store['image'],
                                              name: store['name'],
                                            )));
                              },
                              child: Container(
                                child: StoreCard(width: 280, store: store),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: topMainPadding, bottom: bottomMainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: leftMainPadding, right: rightMainPadding),
                      child: Text(
                        "Recommeded Dishes",
                        style: GoogleFonts.recursive(
                            textStyle: const TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            List.generate(recommendedDishes.length, (index) {
                          var dishes = recommendedDishes[index];
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: leftMainPadding,
                                  right: rightMainPadding),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                                image: dishes['image'],
                                                name: dishes['name'],
                                              )));
                                },
                                child: Container(
                                  child: DishCard(width: 180, dish: dishes),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                              image: dishes['image'],
                                              name: dishes['name'],
                                            )));
                              },
                              child: Container(
                                child: DishCard(width: 180, dish: dishes),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(storeList.length, (index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: bottomMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            image: storeList[index]['image'],
                                            name: storeList[index]['name'],
                                          )));
                            },
                            child: Container(
                              child: StoreCard(
                                  width: size.width - (mainPadding * 2),
                                  store: storeList[index]),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
