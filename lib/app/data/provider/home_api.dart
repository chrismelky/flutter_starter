import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:planrep_mobile/app/data/model/home_model.dart';
import 'package:planrep_mobile/app/data/provider/base_provider.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class HomeApi extends BaseProvider {
// Get request
  Future<Response> getUser(int id) => get('http://youapi/users/id');
// Post request
  Future<Response> postUser(Map data) => post('http://youapi/users', data);
// Post request with File
  Future<Response<HomeModel>> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }

  GetSocket userMessages() {
    return socket('https://yourapi/users/socket');
  }
}
