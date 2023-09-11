import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medex/ui/sales/sale_item_model.dart';

const _salesDbName = 'sales';

class SalesServiceImpl extends SalesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<SaleItemModel>> getSales() async {
    final List<SaleItemModel> sales = [];
    await _firestore.collection(_salesDbName).get().then((querySnapshot) {
      for (final sale in querySnapshot.docs) {
        sales.add(SaleItemModel.fromJson(sale.data()));
      }
    });
    return sales;
  }

  @override
  Stream<QuerySnapshot> getSalesStream() {
    return _firestore.collection(_salesDbName).snapshots();
  }

  @override
  Future<void> addSale(SaleItemModel saleItemModel) async {
    final collectionReference = _firestore.collection(_salesDbName);
    await collectionReference.add(saleItemModel.toJson());
  }

  @override
  Future<void> deleteSale(String id) async {
    final documentReference = _firestore.collection(_salesDbName).doc(id);
    await documentReference.delete();
  }
}

abstract class SalesService {
  Future<List<SaleItemModel>> getSales();

  Stream<QuerySnapshot> getSalesStream();

  Future<void> addSale(SaleItemModel saleItemModel);

  Future<void> deleteSale(String id);
}
