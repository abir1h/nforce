
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_topic_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_topic_api_service.dart';


class BusinessManagerServiceTopicController extends GetxController {
  List<ServiceTopicModel> topicList = [];

  @override
  void onInit() {
    super.onInit();
    getServiceTopics();
  }
  getServiceTopics() {
    ServiceTopicApiService.getServiceTopics().then((value) {
      value.fold((l) {
        topicList = l.data!;
        update();
      }, (r) => print(r));
    });
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
