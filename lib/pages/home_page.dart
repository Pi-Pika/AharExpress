import 'package:first_app/components/my_current_location.dart';
import 'package:first_app/components/my_description_box.dart';
import 'package:first_app/components/my_tab_bar.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import 'package:first_app/components/my_silver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  //tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // my current location
                MyCurrentLocation(),

                //descriptionbox
                MyDescriptionBox(),
              ],
            ),
            ),
          ],
          body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text("First Tab Items"),
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text("Second Tab Items"),
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text("Third Tab Items"),
                ),
              ],
          ),
      ),
    );
  }
}
