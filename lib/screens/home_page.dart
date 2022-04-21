import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_page/screens/category_page.dart';
import 'package:home_page/widgets/top.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle,
        child:
            ListView(
              padding: EdgeInsets.symmetric(vertical: 50.0,),
              children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                Text('Home',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(.6),
              labelPadding: EdgeInsets.symmetric(horizontal: 29),
              isScrollable: true,
              tabs: [
                Tab(
                    child: Text(
                  'Top',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Tab(
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'favorite',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Top(),
                    CategoryPage(),
                    Text('data')
                  ]),
              ),
        ]),
      ),
    );
  }
}