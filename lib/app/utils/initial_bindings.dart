import 'package:get/get.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // ApiClient.init();
    Get.putAsync<SharedPreferenceService>(
      () => SharedPreferenceService().init(),
    );
  }
}
