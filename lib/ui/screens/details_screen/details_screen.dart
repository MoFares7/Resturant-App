import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodme/constant/colors.dart';
import 'package:foodme/constant/helper.dart';
import 'package:foodme/data/product.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constant/padding.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.image, required this.name})
      : super(key: key);

  final String image;
  final String name;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: const Size.fromHeight(200),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(mainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Menu",
                      style: GoogleFonts.recursive(
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Most ordered right now",
                      style: GoogleFonts.recursive(
                        textStyle: TextStyle(
                            fontSize: 15, color: textBlack.withOpacity(0.8)),
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: List.generate(productItems.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (size.width * 0.75) - 40,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(productItems[index]['name'],
                                      style: GoogleFonts.recursive(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        productItems[index]['price'],
                                        style: const TextStyle(
                                            color: textBlack, fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(productItems[index]['discount'],
                                          style: GoogleFonts.recursive(
                                            textStyle: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: textBlack,
                                                fontSize: 16),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          productItems[index]['image']),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0.8,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottumNavigator(),
    );
  }

  Widget bottumNavigator() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width - 40,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: textWhite)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("2",
                            style: GoogleFonts.recursive(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: textWhite),
                            )),
                      ),
                    ),
                  ),
                  Text("View your cart",
                      style: GoogleFonts.recursive(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      )),
                  Text("\$ 3.98",
                      style: GoogleFonts.recursive(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back_icon.svg",
            color: textWhite,
          )),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info))],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Text(widget.name,
                      style: GoogleFonts.recursive(
                        textStyle: const TextStyle(
                            color: textWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: textWhite)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Delivery 10 Min',
                        style: GoogleFonts.recursive(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: textWhite,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
