import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var data = [
    ChartData('14', 12),
    ChartData('15', 15),
    ChartData('16', 30),
    ChartData('17', 6.4),
    ChartData('18', 14),
    ChartData('19', 20),
    ChartData('20', 28),
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}