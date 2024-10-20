import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medex/common/models/content_document.dart';
import 'package:medex/ui/admin/views/admin_pages.dart';
import 'package:medex/ui/blog/blog_service.dart';
import 'package:medex/ui/news/models/news_item_model.dart';
import 'package:medex/ui/news/services/news_service.dart';
import 'package:medex/ui/sales/models/sale_item_model.dart';
import 'package:medex/ui/sales/services/sales_service.dart';

enum SalesPageState { list, add }

class AdminViewModel extends GetxController {
  AdminViewModel({
    NewsService? newsService,
    BlogService? blogService,
    SalesService? salesService,
  })  : _newsService = newsService ?? NewsServiceImpl(),
        _blogService = blogService ?? BlogServiceImpl(),
        _salesService = salesService ?? SalesServiceImpl();

  final NewsService _newsService;
  final BlogService _blogService;
  final SalesService _salesService;

  final _selectedPage = AdminPages.addNews.obs;

  AdminPages get selectedPage => _selectedPage.value;

  set selectedPage(AdminPages page) {
    _selectedPage.value = page;
  }

  final _salesPageState = SalesPageState.list.obs;

  SalesPageState get salesPageState => _salesPageState.value;

  set salesPageState(SalesPageState state) {
    _salesPageState.value = state;
  }

  final _isSavingItem = false.obs;

  bool get isSavingItem => _isSavingItem.value;

  set isSavingItem(bool value) {
    _isSavingItem.value = value;
  }

  Stream<QuerySnapshot> getSalesStream() {
    return _salesService.getSalesStream();
  }

  Future<bool> addItemToFirestore({
    required ContentDocument amContent,
    required ContentDocument ruContent,
    required ContentDocument enContent,
    required String imageUrl,
  }) async {
    _isSavingItem.value = true;

    try {
      switch (selectedPage) {
        case AdminPages.addNews:
          DateTime today = DateTime.now();
          String dateStr = "${today.day}-${today.month}-${today.year}";

          final model = NewsItemModel(
            amContent: amContent,
            ruContent: ruContent,
            enContent: enContent,
            imageUrl: imageUrl,
            date: dateStr,
          );
          await _newsService.addNews(model);
          return true;
        // case AdminPages.addBlog:
        //   final model = BlogItemModel(
        //     title: titleMap,
        //     description: descriptionMap,
        //     imageUrl: imageUrl,
        //   );
        //   await _blogService.addBlog(model);
        //   break;
        case AdminPages.addSales:
          final model = SaleItemModel(
            amContent: amContent,
            ruContent: ruContent,
            enContent: enContent,
            imageUrl: imageUrl,
          );
          await _salesService.addSale(model);
          salesPageState = SalesPageState.list;
          return true;
      }

      //TODO add added snack bar
    } catch (error) {
      print("Error adding document: $error");
      return false;
    } finally {
      _isSavingItem.value = false;
    }
  }

  void deleteSale(String id) {
    _salesService.deleteSale(id);
  }
}
