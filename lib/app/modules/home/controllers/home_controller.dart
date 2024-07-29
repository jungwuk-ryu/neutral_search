import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/site.dart';

class HomeController extends GetxController {
  final TextEditingController searchTextFieldController = TextEditingController();
  final RxDouble _searchButtonColor = RxDouble(0.2);
  List<Site> _siteList = [];

  @override
  void onInit() {
    super.onInit();

    for (int i = 1; i <= 20; i++) {
      _siteList.add(Site("사이트$i"));
    }

    searchTextFieldController.addListener(() {
      setSearchButtonStatus(searchTextFieldController.text.isNotEmpty);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Site> getSiteList() {
    return _siteList;
  }

  void setSearchButtonStatus(bool enable) {
    if (enable) {
      _searchButtonColor.value = 1;
    } else {
      _searchButtonColor.value = 0.2;
    }
  }

  double getSearchButtonColor() {
    return _searchButtonColor.value;
  }
}
