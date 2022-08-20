import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cost_centre_controller.dart';

class CostCentrePage extends GetView<CostCentreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cost Centres')),
        body: SafeArea(child: Text('CostCentreController')));
  }
}
