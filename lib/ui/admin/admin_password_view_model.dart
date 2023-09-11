import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:medex/ui/admin/admin_service.dart';

class AdminPasswordViewModel extends GetxController {
  late final AdminService _adminService;

  AdminPasswordViewModel({
    AdminService? adminService,
  }) : _adminService = adminService ?? AdminServiceImpl();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<bool> isPasswordCorrect(String enteredPassword) async {
    final bytes = utf8.encode(enteredPassword);
    final enteredPasswordHash = sha256.convert(bytes).toString();

    try {
      _isLoading.value = true;
      return enteredPasswordHash == await _adminService.getPasswordHash();
    } catch (error) {
      print(error); //TODO
      return false;
    } finally {
      _isLoading.value = false;
    }
  }
}
