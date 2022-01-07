import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/theme/color.dart';
import 'package:house_rent/utils/data.dart';
import 'package:house_rent/widgets/category_item.dart';
import 'package:house_rent/widgets/custom_textbox.dart';
import 'package:house_rent/widgets/property_item.dart';
import 'package:house_rent/widgets/recent_item.dart';
import 'package:house_rent/widgets/recommend_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: getHeader(),
        ),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(
                        color: darker,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Amit",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pixel-vault.s3-accelerate.amazonaws.com/6176cb30236cff00164c592f/6176cbd6236cff00164c5936_o.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                    child: CustomTextBox(
                  hint: "Search",
                  prefix: Icon(Icons.search, color: Colors.grey),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 0),
            child: listCategories(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: darker),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listPopulars(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: darker),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listRecommended(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: darker),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listRecent(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  int selectedCategory = 0;
  listCategories() {
    List<Widget> lists = List.generate(
        categories.length,
        (index) => CategoryItem(
              data: categories[index],
              selected: index == selectedCategory,
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
            ));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listPopulars() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 240,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .8,
        ),
        items: List.generate(
            populars.length, (index) => PropertyItem(data: populars[index])));
  }

  listRecommended() {
    List<Widget> lists = List.generate(
        recommended.length, (index) => RecommendItem(data: recommended[index]));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listRecent() {
    List<Widget> lists = List.generate(
        recents.length, (index) => RecentItem(data: recents[index]));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}
