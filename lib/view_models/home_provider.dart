import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/models/category.dart';
import 'package:flutter_ebook_app/util/api.dart';
import 'package:flutter_ebook_app/util/enum/api_request_status.dart';
import 'package:flutter_ebook_app/util/functions.dart';

class HomeProvider with ChangeNotifier {
  CategoryFeed top = CategoryFeed();
  CategoryFeed recent = CategoryFeed();
  APIRequestStatus apiRequestStatus =
      APIRequestStatus.loading; //اي نام حاطت فيه اسامي للتحميل
  Api api = Api();

  getFeeds() async {
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      CategoryFeed popular = await api.getCategory(Api.popular);
      setTop(popular);
      CategoryFeed newReleases = await api.getCategory(Api.recent);
      setRecent(newReleases);
      setApiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      checkError(e);
    }
  }

//اول لما يعمل جيت فيد
//هيعبي المتغيرات الي فوق في الكلاس دي الي هي
//التوب والريسينت
  ///من الاخر لازم يعمل
  ///جيت فيد الاول قبل اي حاجه
  ///بعد يعمل جيت فيد يقدر بعد كدة
  ///يستخدم المتغيرات الي فوق او يستخدم الفانكشن الجيتر
  ///بتاعت الريسينت والتوب

  CategoryFeed getRecent() {
    return recent;
  }

  CategoryFeed getTop() {
    return top;
  }

  void checkError(e) {
    if (Functions.checkConnectionError(e)) {
      setApiRequestStatus(APIRequestStatus.connectionError);
    } else {
      setApiRequestStatus(APIRequestStatus.error);
    }
  }

  void setApiRequestStatus(APIRequestStatus value) {
    apiRequestStatus = value;
    notifyListeners();
  }

  void setTop(value) {
    top = value;
    notifyListeners();
  }

  void setRecent(value) {
    recent = value;
    notifyListeners();
  }
}
