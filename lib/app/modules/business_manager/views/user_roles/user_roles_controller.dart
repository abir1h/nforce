import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class UserRolesController extends GetxController {
  List<UserRolesMock> userRoles = [];

  void addUserRoles(UserRolesMock userRolesMock) {
    userRoles.add(userRolesMock);
    update();
  }

  void updateUserRoles(UserRolesMock userRolesMock) {
    final index = userRoles.indexWhere((element) => element.id == userRolesMock.id);
    userRoles[index] = userRolesMock;
    update();
  }

  void removeUserRoles(UserRolesMock userRolesMock) {
    userRoles.remove(userRolesMock);
    update();
  }
}

class UserRolesMock extends Equatable {
  final String id;
  final String name;
  final String role;
  final File image;
  final String description;
  final String accessAreas;
  final String accessPolicy;
  final String status;

  const UserRolesMock({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.description,
    required this.accessAreas,
    required this.accessPolicy,
    required this.status,
  });

  @override
  List<Object?> get props => [id, name, role, image, description, accessAreas, accessPolicy, status];
}
