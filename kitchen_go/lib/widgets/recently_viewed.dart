import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/constants/colors.dart';
import 'package:kitchen_go/models/recipe.dart';

class RecentlyViewed extends StatelessWidget {
  RecentlyViewed({super.key, required this.listRecipes});
  List<Recipe> listRecipes;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...listRecipes
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //color: Colors.amber,
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Image.network(
                                                    item.image == null
                                                        ? 'https://dummyimage.com/180x180/575757/fff'
                                                        : Api.getImageUrl(
                                                            item.image!),
                                                    fit: BoxFit.cover,
                                                    height: 180,
                                                    width: 180,
                                                    scale: 1.01),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      child: Container(
                                        //padding: EdgeInsets.only(bottom: 10, right: 10),
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                            Icons.favorite_border_outlined),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 3.8, bottom: 148),
                                      child: Container(
                                          padding: EdgeInsets.only(top: 3),
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    ColorConstant
                                                        .BlueMediumColor,
                                                    ColorConstant.BlueBoldColor
                                                  ]),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(15)),
                                              color:
                                                  ColorConstant.BlueMediumColor
                                                      .withOpacity(0.8)),
                                          child: const Text(
                                            'Công thức',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Exo'),
                                          )),
                                    ),
                                  ]),
                            ),
                            //Padding(padding: EdgeInsets.only(top: 10, left: 50)),
                            Container(
                              width: 180,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(left: 5),
                                child: Text(item.title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Exo-Medium')),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()
            ],
          )),
    );
  }
}
