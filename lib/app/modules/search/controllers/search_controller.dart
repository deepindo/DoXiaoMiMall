import 'package:get/get.dart';
import '../../../services/app_searchService.dart';

class SearchController extends GetxController {
  String? searchWords = "";
  RxList searchHistoryList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getSearchHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSearchHistory() async {
    var searchHistoryData = await DoSearchService.getSearchHistory();
    if (searchHistoryData.isNotEmpty) {
      searchHistoryList.addAll(searchHistoryData);
      update();
    }
  }

  void deleteSearchHistoryOf(String keyWords) async {
    await DoSearchService.deleteSearchHistory(keyWords);
    searchHistoryList.remove(keyWords);
    update();
  }

  void removeAllSearchHistory() async {
    await DoSearchService.removeAllSearchHistory();
    // searchHistoryList.value = [];
    searchHistoryList.clear(); //上下两个效果一样
    update();
  }
}
