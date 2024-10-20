import 'package:get/get.dart';
import 'package:medex/ui/news/models/news_item_model.dart';
import 'package:medex/ui/news/services/news_service.dart';

class NewsViewModel extends GetxController {
  final NewsService _newsService;

  NewsViewModel({
    required NewsService newsService,
  }) : _newsService = newsService {
    getNews();
  }

  final _news = <NewsItemModel>[].obs;

  List<NewsItemModel> get news => _news;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void getNews() async {
    _isLoading.value = true;

    try {
      _news.value = await _newsService.getNews();
    } catch (error) {
      //TODO
      print(error);
    } finally {
      _isLoading.value = false;
    }
  }
}
