import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planrep_mobile/app/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'facility_type_detail_controller.dart';

class FacilityTypeDetailPage extends GetView<FacilityTypeDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Facility Type Detail')),
        body: SafeArea(
            child: ReactiveForm(
                formGroup: controller.editForm,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ReactiveTextField(
                          formControlName: 'name',
                          decoration: inputDecoration('Name')),
                      SizedBox(
                        height: 20,
                      ),
                      ReactiveTextField(
                        formControlName: 'code',
                        decoration: inputDecoration('Code'),
                      ),
                      ElevatedButton(
                          onPressed: () => controller.fromForm(),
                          child: Text('Save')),
                    ],
                  ),
                ))));
  }
}
