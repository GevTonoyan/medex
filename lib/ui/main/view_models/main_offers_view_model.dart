import 'package:get/get.dart';
import 'package:medex/ui/main/models/main_offers_model.dart';
import 'package:medex/ui/main/services/main_service.dart';

//TODO get from server
class MainOffersViewModel extends GetxController {
  final MainService _mainService;

  MainOffersViewModel({
    required MainService mainService,
  }) : _mainService = mainService {
    getOffers();
  }

  final _offers = <MainOffersModel>[].obs;

  List<MainOffersModel> get offers => _offers;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> getOffers() async {
    _isLoading.value = true;

    try {
      _offers.value = await _mainService.getMainOffers();
    } catch (error) {
      //TODO
      print(error);
    } finally {
      _isLoading.value = false;
    }
  }
}
