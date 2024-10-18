import 'package:get/get.dart';
import 'package:medex/ui/sales/models/sale_item_model.dart';
import 'package:medex/ui/sales/services/sales_service.dart';

class SalesViewModel extends GetxController {
  final SalesService _salesService;

  SalesViewModel({
    required SalesService salesService,
  }) : _salesService = salesService {
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
