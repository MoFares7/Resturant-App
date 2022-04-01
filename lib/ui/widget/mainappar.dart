import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodme/constant/colors.dart';
import 'package:foodme/constant/helper.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/fontsize.dart';
import '../../constant/padding.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.8,
        brightness: Brightness.light,
        backgroundColor: textWhite,
        automaticallyImplyLeading: false,
        primary: false,
        excludeHeaderSemantics: true,
        flexibleSpace: SafeArea(
          child: Container(
            padding:
                EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Delivery Details",
                            style: GoogleFonts.recursive(
                              textStyle: const TextStyle(
                                  color: textBlack,
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        getSvgIcon("arrow_right_icon.svg"),
                      ],
                    ),
                    Row(
                      children: [
                        //  getSvgIcon("search_icon.svg"),
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/checkout");
                            },
                            icon: Badge(
                              badgeContent: const Text(
                                '2',
                                style: TextStyle(color: textWhite),
                              ),
                              child: const Icon(
                                EvilIcons.cart,
                                size: 30,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width:
                      (size.width - (leftMainPadding + rightMainPadding + 60)),
                  child: const Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primary,
                      fontSize: subTitleFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
