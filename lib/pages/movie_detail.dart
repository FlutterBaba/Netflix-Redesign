import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_redesign/pages/dashboard.dart';

class Moviedetail extends StatelessWidget {
  final String image;
  final String title;
  final String rating;

  const Moviedetail({
    Key? key,
    required this.title,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "images/background.png",
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: BlurContainer(
                                height: true,
                                child:
                                    SvgPicture.asset("images/arrow_back.svg"),
                              ),
                            ),
                            BlurContainer(
                              height: true,
                              child: SvgPicture.asset("images/Download.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "2021 . Action Adventure . Samurai",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.1,
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mqWidth * 0.1),
                        child: MaterialButton(
                          height: 60,
                          minWidth: double.infinity,
                          onPressed: () {},
                          color: Color(0xffE11D24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("images/play-arrow.svg"),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                "Watch Now",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Description(
              rating: rating,
              title: title,
            ),
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String title;
  final String rating;
  const Description({
    Key? key,
    required this.rating,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, mqHeight * 0.2 - 60),
      child: Container(
        height: mqWidth * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(19, 18, 18, 0.3),
              Color.fromRGBO(19, 18, 18, 0),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15.0,
              sigmaY: 15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: mqWidth *0.5,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Nexa Bold",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlurContainer(
                      child: Text(
                        "Popukar among friend",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                      height: false,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    BlurContainer(
                      child: Text(
                        "16+",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                      height: false,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    BlurContainer(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "images/Star 2.svg",
                            height: 20,
                          ),
                          Text(
                            rating,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      height: false,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  final bool height;
  final Widget? child;
  const BlurContainer({Key? key, required this.child, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ? 60 : 30,
      decoration: BoxDecoration(
        color: Color.fromRGBO(196, 196, 196, 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
