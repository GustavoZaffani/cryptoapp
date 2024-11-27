// import 'package:cryptoapp/repositories/db_repository.dart';
// import 'package:cryptoapp/source/local/authentication.dart';
// import 'package:get/get.dart';
//
// class DbController extends GetxController with StateMixin<AuthenticationData> {
//   DbController({required this.repository}) {
//     change(null, status: RxStatus.empty());
//   }
//
//   final DbRepository repository;
//
//   Future<void> getCurrentAuthentication() async {
//     change(null, status: RxStatus.loading());
//
//     await repository.getCurrentAuthentication().then((value) {
//       change(value, status: RxStatus.success());
//     }).onError((error, stackTrace) {
//       change(null, status: RxStatus.error(error.toString()));
//     });
//   }
//
//   Future<int> insertAuthentication(String currentEmail) {
//     return repository.insertAuthentication(currentEmail);
//   }
// }
