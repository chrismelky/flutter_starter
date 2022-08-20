import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:planrep_mobile/app/data/model/cost_centre.dart';
import 'package:planrep_mobile/app/data/provider/base_provider.dart';
import 'package:planrep_mobile/app/response/custom_response.dart';

const resource = '/api/admin_hierarchy_cost_centres';

class CostCentreApi extends BaseProvider {
  Future<List<CostCentre>> byAdminArea(Map<String, dynamic>? params) async {
    try {
      Response resp = await get(resource, query: params);
      return costCentreListFromJson(customResponseFromJson(resp.body).data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
