import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'facility_type_controller.dart';

class FacilityTypePage extends GetView<FacilityTypeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => controller.showSearch.value
            ? TextField(
                onChanged: (value) => controller.onSearch(value),
                decoration: InputDecoration(
                  hintText: 'type name...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : Text('Facility Types')),
        automaticallyImplyLeading: false,
        leading: Obx(
          () => !controller.showSearch.value
              ? IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                )
              : SizedBox.shrink(),
        ),
        actions: [
          Obx(() => controller.showSearch.value
              ? IconButton(
                  onPressed: () => controller.clearSearch(),
                  icon: Icon(Icons.cancel))
              : Row(
                  children: [
                    IconButton(
                        onPressed: () => controller.createOrEdit(null),
                        icon: Icon(Icons.add)),
                    IconButton(
                        onPressed: () => controller.toggleSearch(),
                        icon: Icon(Icons.search)),
                    IconButton(
                        onPressed: () => Get.bottomSheet(Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [Text("test Sheet")],
                              ),
                            )),
                        icon: Icon(Icons.filter)),
                  ],
                ))
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Obx(
        () => controller.facilityTypes.length > 0
            ? ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    thickness: 1,
                    color: Colors.grey[200],
                  );
                },
                itemCount: controller.facilityTypes.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  var ft = controller.facilityTypes[index];
                  return GestureDetector(
                      onTap: () => controller.createOrEdit(ft),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                              child: Text(ft.code.substring(0, 1)),
                            ),
                            SizedBox(width: 20),
                            Text(ft.name)
                          ],
                        ),
                      ));
                })
            : Center(
                child: Text("No data found"),
              ),
      )),
    );
  }
}
