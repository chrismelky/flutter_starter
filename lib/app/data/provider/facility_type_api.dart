import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:planrep_mobile/app/data/model/facility_type.dart';
import 'package:planrep_mobile/app/data/provider/base_provider.dart';
import 'package:planrep_mobile/app/response/custom_response.dart';

const resource = '/api/facility_types';

class FacilityTypeApi extends BaseProvider {
  Future<List<FacilityType>> all(Map<String, dynamic>? params) async {
    try {
      Response resp = await get(resource, query: params);
      return facilityTypeListFromJson(customResponseFromJson(resp.body).data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FacilityType> create(dynamic data) async {
    try {
      Response resp = await post(resource, data);
      return facilityTypeFromJson(customResponseFromJson(resp.body).data);
    } catch (e) {
      throw (e);
    }
  }

  Future<FacilityType> update(int id, dynamic data) async {
    try {
      Response resp = await put(resource + '/' + id.toString(), data);
      return facilityTypeFromJson(customResponseFromJson(resp.body).data);
    } catch (e) {
      throw (e);
    }
  }
}
