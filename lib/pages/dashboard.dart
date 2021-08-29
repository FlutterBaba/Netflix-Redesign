import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_redesign/data/data.dart';
import 'package:netflix_redesign/pages/movie_detail.dart';

late double mqHeight;
late double mqWidth;

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mqHeight = MediaQuery.of(context).size.height;
    mqWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CurrentUser(),
                    MyTextField(),
                    ListTile(
                      leading: Text(
                        "Category",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: mqWidth,
                      height: mqHeight * 0.1 + 20,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final CategoryModel category = categoryList[index];

                          return Category(
                            image: category.image,
                            name: category.name,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Popular",
                        
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 0.4,
                        height: mqHeight * 0.3,
                        initialPage: 0,
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: ScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                      ),
                      items: moviesList
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Moviedetail(
                                      title: e.title,
                                      image: e.image,
                                      rating: e.rating,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(e.image),
                                  ),
                                ),
                                child: Container(
                                  height: mqHeight * 0.1 - 20,
                                  width: mqWidth * 0.1,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffac0b),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        "images/Star 3.svg",
                                        height: 15,
                                      ),
                                      Text(
                                        e.rating,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: "Poppins",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String name;

  const Category({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth * 0.2,
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(196, 196, 196, 0.1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30.0,
            sigmaY: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                image,
                height: 30,
              ),
              Text(
                name,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentUser extends StatelessWidget {
  const CurrentUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${currentUser[0].name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Nexa Bold",
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "See what's Next",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Color(0xffD3D6DA),
            backgroundImage: AssetImage(currentUser[0].image),
          )
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeight * 0.1 - 20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    "images/search.svg",
                  ),
                ),
                hintText: "Search Movies",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Color(0xff969696),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset("images/microphone.svg"),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ),
      ),
    );
  }
}
