import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/invoice_schedule_mode.dart';
import 'package:nuforce/app/modules/new_orders/services/invoice_schedule_api_services.dart';

class InvoiceScheduleController extends GetxController {
  InvoiceScheduleModel? _invoiceScheduleModel;
  InvoiceScheduleModel? get invoiceScheduleModel => _invoiceScheduleModel;
  set invoiceScheduleModel(InvoiceScheduleModel? value) {
    _invoiceScheduleModel = value;
    update();
  }

  Future<void> getInvoiceSchedule(String workorderId) async {
    await InvoiceScheduleApiServices.getEvents(workorderId: workorderId).then(
      (result) {
        result.fold(
          (data) {
            invoiceScheduleModel = data;
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
  }
}
