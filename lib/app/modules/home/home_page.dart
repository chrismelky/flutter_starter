import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planrep_mobile/app/routes/app_pages.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomePage')),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(child: Text("Header")),
          ListTile(
            title: Text("Facility Type"),
            onTap: () => Get.toNamed(Routes.FACILITY_TYPE),
          ),
          ListTile(
            title: Text("Cost Centrs"),
            onTap: () => Get.toNamed(Routes.COST_CENTRE),
          )
        ])),
        body: SafeArea(child: Text('HomeController')));
  }
}
