import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medex/ui/news/news_item_model.dart';

const _newsDbName = 'news';

class NewsServiceImpl extends NewsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<NewsItemModel>> getNews() async {
    final List<NewsItemModel> news = [];
    await _firestore.collection(_newsDbName).get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        news.add(NewsItemModel.fromJson(element.data()));
      }
    });
    return news;
  }

  @override
  Future<void> addNews(NewsItemModel newsItemModel) async {
    final collectionReference = _firestore.collection(_newsDbName);
    await collectionReference.add(newsItemModel.toJson());
  }
}

abstract class NewsService {
  Future<List<NewsItemModel>> getNews();

  Future<void> addNews(NewsItemModel newsItemModel);
}
