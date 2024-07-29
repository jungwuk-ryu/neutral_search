import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:neutral_search/app/ui/themes/app_color.dart';

import '../../../data/models/site.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        _title(),
        _textField(),
        SizedBox(height: 16.h),
        Text("검색할 사이트를 선택하세요",
            style: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.bold,
              color: AppColor.textBlack,
            )),
        SizedBox(height: 16.h),
        Expanded(child: _siteList())
      ],
    );
  }

  Widget _title() {
    return Text("검색",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.spMin,
            color: AppColor.textBlack));
  }

  Widget _textField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 56.h,
            decoration: BoxDecoration(
                color: AppColor.backgroundGray,
                borderRadius: BorderRadius.circular(12.r)),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: controller.searchTextFieldController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "검색어 입력",
                            hintStyle: TextStyle(color: AppColor.textBlueGray)),
                      )),
                ],
              ),
            ),
          )),
          Obx(() => AnimatedOpacity(
              opacity: controller.getSearchButtonColor(),
              duration: const Duration(milliseconds: 400),
              child: Container(
                margin: EdgeInsets.only(left: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 56.h,
                decoration: BoxDecoration(
                    color: AppColor.backgroundGray,
                    borderRadius: BorderRadius.circular(12.r)),
                child: const Icon(CupertinoIcons.search),
              )))
        ],
      ),
    );
  }

  Widget _siteList() {
    List<Site> siteList = controller.getSiteList();
    return ListView.builder(
      itemCount: siteList.length,
      itemBuilder: (BuildContext context, int index) {
        Site site = siteList[index];
        return Row(
          children: [
            Text(site.siteName,
                style:
                    TextStyle(fontSize: 16.spMin, color: AppColor.textBlack)),
            const Expanded(child: SizedBox()),
            Checkbox(value: false, onChanged: (v) {}),
          ],
        );
      },
    );
  }
}
