import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class BusinessManagerServiceTopicController extends GetxController {
  final List<MockServiceTopic> _mockServiceTopic = [];

  List<MockServiceTopic> get mockServiceTopic => _mockServiceTopic;

  void addServiceTopic(MockServiceTopic mockServiceTopic) {
    _mockServiceTopic.add(mockServiceTopic);
    update();
  }

  void updateServiceTopic(MockServiceTopic mockServiceTopic) {
    final index = _mockServiceTopic.indexWhere((element) => element.id == mockServiceTopic.id);
    _mockServiceTopic[index] = mockServiceTopic;
    update();
  }

  void removeServiceTopic(MockServiceTopic mockServiceTopic) {
    _mockServiceTopic.remove(mockServiceTopic);
    update();
  }
}

class MockServiceTopic extends Equatable {
  final String id;
  final String name;
  final String? topicNo;
  final String? description;

  const MockServiceTopic({
    required this.id,
    required this.name,
    required this.topicNo,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, topicNo, description];
}
