import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medex/ui/main/models/main_offers_model.dart';

const _mainOffersDbName = 'main_offers';

abstract interface class MainService {
  Future<List<MainOffersModel>> getMainOffers();
}

class MainServiceImpl implements MainService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<MainOffersModel>> getMainOffers() async {
    // Fetch the main offers collection from Firestore
    final querySnapshot = await _firestore.collection(_mainOffersDbName).get();

    // Convert the documents into MainOffersModel list
    final offers = querySnapshot.docs.map((doc) {
      return MainOffersModel.fromJson(doc.data());
    }).toList();

    return offers;
  }
}
