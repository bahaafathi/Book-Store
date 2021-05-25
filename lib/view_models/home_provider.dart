import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:book_store/models/category.dart';
import 'package:book_store/util/api.dart';
import 'package:book_store/util/enum/api_request_status.dart';
import 'package:book_store/util/functions.dart';

class HomeProvider with ChangeNotifier {
  CategoryFeed top = CategoryFeed();
  CategoryFeed recent = CategoryFeed();
  APIRequestStatus apiRequestStatus = APIRequestStatus.loading;
  Api api = Api();

  getFeeds() async {
    setApiRequestStatus(APIRequestStatus.loading); //on refresh
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
