import 'package:get/get.dart';
import 'package:medex/ui/sales/sale_item_model.dart';
import 'package:medex/ui/sales/sales_service.dart';

class SalesViewModel extends GetxController {
  late final SalesService _salesService;

  SalesViewModel({
    SalesService? salesService,
  }) : _salesService = salesService ?? SalesServiceImpl() {
    getSales();
  }

  final _sales = <SaleItemModel>[].obs;

  List<SaleItemModel> get sales => _sales;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void getSales() async {
    _isLoading.value = true;

    try {
      final fetchedSales = await _salesService.getSales();
      _sales.value = fetchedSales.where((sale) => sale.enabled).toList();
    } catch (error) {
      //TODO
      print(error);
    } finally {
      _isLoading.value = false;
    }
  }
}
