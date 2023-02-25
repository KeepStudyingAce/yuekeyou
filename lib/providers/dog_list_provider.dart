import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yuekeyouinterview/common_widget/loading.dart';
import 'package:yuekeyouinterview/request/api.dart';
import 'package:yuekeyouinterview/utils/app_config.dart';
import 'package:yuekeyouinterview/utils/local_storage.dart';

/* 
  DogListPage's Provider 
  :manage page's state
*/
class DogListProvider with ChangeNotifier {
  // ========= Public ===========
  Map<String, List<String>>? getPageData() {
    return _pageData;
  }

  String getPageSortType() {
    return _sortType;
  }

  void requestData() {
    // load localCache data
    _loadCacheData();
    Loading.show();
    AppApi.getBreedsList().then((data) {
      Loading.dismiss();
      _pageData = _mapFromJson(data['message']);
      // cache to localStorage
      /* 
        Because shared_ Preferences requires native code support, 
        so there will be a prompt when running on the web side
      */
      LocalStorage.save(LocalStorage.breedsStoragePath,
          jsonEncode(_mapFromJson(data['message'])));
      notifyListeners();
    }).catchError((error) {
      Loading.dismiss();
    });
  }

  void _loadCacheData() async {
    dynamic data = await LocalStorage.get(LocalStorage.breedsStoragePath);
    _pageData = jsonDecode(data);
    notifyListeners();
  }

  // update page's sortType
  void sortList(sortTemp) {
    _sortType = sortTemp;
    notifyListeners();
  }

  // ========= Private ===========
  // page's data;
  Map<String, List<String>>? _pageData;
  String _sortType = 'A-Z';
  _mapFromJson(Map<String, dynamic> data) {
    Map<String, List<String>>? result = {};
    for (var item in data.keys) {
      List<String> sub = [];
      for (var subItem in data[item]) {
        sub.add(subItem as String);
      }
      result[item] = sub;
    }
    return result;
  }
}
