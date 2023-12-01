import 'dart:io';

import 'package:get/get.dart';

class UserRolesController extends GetxController {
  List<UserRolesMock> userRoles = [];

  void addUserRoles(UserRolesMock userRolesMock) {
    userRoles.add(userRolesMock);
    update();
  }
}

class UserRolesMock {
  final String id;
  final String name;
  final String role;
  final File image;
  final String description;
  final String accessAreas;
  final String accessPolicy;
  final String status;

  UserRolesMock({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.description,
    required this.accessAreas,
    required this.accessPolicy,
    required this.status,
  });
}
