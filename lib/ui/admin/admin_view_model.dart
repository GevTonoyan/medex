import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/ui/news/news_item_model.dart';
import 'package:medex/ui/sales/sale_item_model.dart';

enum AdminPages {
  addNews,
  addBlog,
  addSales;

  String get addText {
    switch (this) {
      case addNews:
        return 'add_news'.tr;
      case addBlog:
        return 'add_blog'.tr;
      case addSales:
        return 'add_sale'.tr;
    }
  }
}

enum SalesPageState { list, add }

class AdminViewModel extends GetxController {
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

  void addItemToFirestore({
    required String title,
    required String imageUrl,
    required String description,
  }) async {
    _isSavingItem.value = true;

    late String collectionName;
    late final Map<String, dynamic> mapJson;

    switch (selectedPage) {
      case AdminPages.addNews:
        collectionName = 'news';
        DateTime today = DateTime.now();
        String dateStr = "${today.day}-${today.month}-${today.year}";

        final model = NewsItemModel(
          title: title,
          description: description,
          imageUrl: imageUrl,
          date: dateStr,
        );
        mapJson = model.toJson();
        break;
      case AdminPages.addBlog:
        final model = BlogItemModel(
          title: title,
          description: description,
          imageUrl: imageUrl,
        );
        mapJson = model.toJson();
        collectionName = 'blogs';
        break;
      case AdminPages.addSales:
        final model = SaleItemModel(
          title: title,
          description: description,
          imageUrl: imageUrl,
        );
        mapJson = model.toJson();
        collectionName = 'sales';
        break;
    }
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionName);

    try {
      final documentReference = await collectionReference.add(mapJson);
      if (selectedPage == AdminPages.addSales) {
        salesPageState = SalesPageState.list;
      }
      print("Document added with ID: ${documentReference.id}");
    } catch (error) {
      print("Error adding document: $error");
    } finally {
      _isSavingItem.value = false;
    }
  }

  void deleteSale(String id) {
    final documentReference = FirebaseFirestore.instance.collection('sales').doc(id);
    documentReference.delete();
  }
}
