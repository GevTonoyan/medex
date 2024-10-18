import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medex/ui/news/models/news_item_model.dart';

const _newsDbName = 'news';

abstract interface class NewsService {
  Future<List<NewsItemModel>> getNews();

  Future<void> addNews(NewsItemModel newsItemModel);
}

class NewsServiceImpl extends NewsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<NewsItemModel>> getNews() async {
    final snapshot = await _firestore.collection(_newsDbName).get();
    final news = snapshot.docs
        .map(
          (e) => NewsItemModel.fromJson(
            e.data(),
          ),
        )
        .toList();
    return news;
  }

  @override
  Future<void> addNews(NewsItemModel newsItemModel) async {
    final collectionReference = _firestore.collection(_newsDbName);
    await collectionReference.add(newsItemModel.toJson());
  }
}
