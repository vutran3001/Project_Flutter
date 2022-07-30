// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class Apigiay extends ChangeNotifier {
  List<Product_main> lst = [];
  Future<void> fetchProduct_giay() async {
    List<Product_main> tmpList = [];
    final response =
        await http.get(Uri.parse('http://192.168.5.192:8000/api/SanPham/giay'));
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }
      // List ProductMains = jsonDecode(response.body);
      // return ProductMains.map<Product_main>((json) => Product_main.fromJson(json))
      //     .toList();
      lst = tmpList;

      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<void> SapXepGiayDep(String $Loai) async {
    List<Product_main> tmpList = [];

    final response = await http.get(
        Uri.parse('http://192.168.5.192:8000/api/SanPham/xepGIAY/' + $Loai));

    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        // print(data);
        data.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lst = tmpList;
// print(lstTS[0].gia);
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

}
