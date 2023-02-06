import 'package:flutter/material.dart';
import 'package:scanner_app/generate.dart';
import 'package:scanner_app/read_qr.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner App"),
        backgroundColor: Colors.black87,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          // isScrollable: true,
          tabs: const [
            Tab(
              text: "Generate",
            ),
            Tab(
              text: "Read",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Generate(),
          Read(),
        ],
      ),
    );
  }
}
