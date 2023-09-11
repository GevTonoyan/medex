import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medex/ui/blog/blog_item_model.dart';

const _blogsDbName = 'blogs';

class BlogServiceImpl extends BlogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<BlogItemModel>> getBlogs() async {
    final List<BlogItemModel> blogs = [];
    await _firestore.collection(_blogsDbName).get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        blogs.add(BlogItemModel.fromJson(element.data()));
      }
    });
    return blogs;
  }

  @override
  Future<void> addBlog(BlogItemModel blogItemModel) async {
    final collectionReference = _firestore.collection(_blogsDbName);
    await collectionReference.add(blogItemModel.toJson());
  }
}

abstract class BlogService {
  Future<List<BlogItemModel>> getBlogs();

  Future<void> addBlog(BlogItemModel blogItemModel);
}
