import 'package:get/get.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/ui/blog/blog_service.dart';

class BlogViewModel extends GetxController {
  late final BlogService _blogService;

  BlogViewModel({
    BlogService? blogService,
  }) : _blogService = blogService ?? BlogServiceImpl() {
    getBlogs();
  }

  final _blogs = <BlogItemModel>[].obs;

  List<BlogItemModel> get blogs => _blogs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void getBlogs() async {
    _isLoading.value = true;

    try {
      _blogs.value = await _blogService.getBlogs();
    } catch (error) {
      //TODO
      print(error);
    } finally {
      _isLoading.value = false;
    }
  }
}
