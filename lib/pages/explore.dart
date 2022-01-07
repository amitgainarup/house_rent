import 'package:flutter/material.dart';
import 'package:house_rent/theme/color.dart';
import 'package:house_rent/utils/data.dart';
import 'package:house_rent/widgets/custom_textbox.dart';
import 'package:house_rent/widgets/recommend_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
    return Row(
      children: [
        Expanded(
            child: CustomTextBox(
          hint: "Search",
          prefix: Icon(Icons.search, color: Colors.grey),
        )),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 20,
      ),
      Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Text(
          "Properties",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      listRecommended(),
      SizedBox(
        height: 20,
      ),
    ]));
  }

  listRecommended() {
    List<Widget> lists = List.generate(
        recommended.length, (index) => RecommendItem(data: recommended[index])
        );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}
