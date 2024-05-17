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

  DateTime? _eventMinDate;
  DateTime? get eventMinDate => _eventMinDate;
  set eventMinDate(DateTime? value) {
    _eventMinDate = value;
    update();
  }

  DateTime? _eventMaxDate;
  DateTime? get eventMaxDate => _eventMaxDate;
  set eventMaxDate(DateTime? value) {
    _eventMaxDate = value;
    update();
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
    update();
  }

  Future<void> getInvoiceSchedule(String workorderId) async {
    await InvoiceScheduleApiServices.getEvents(workorderId: workorderId).then(
      (result) {
        result.fold(
          (data) {
            invoiceScheduleModel = data;

            eventMinDate = invoiceScheduleModel?.data?.first.startAt;
            invoiceScheduleModel?.data?.forEach((element) {
              if (element.startAt != null && element.startAt!.isBefore(eventMinDate!)) {
                eventMinDate = element.startAt;
              }
            });

            eventMaxDate = invoiceScheduleModel?.data?.first.startAt;
            invoiceScheduleModel?.data?.forEach((element) {
              if (element.startAt != null && element.startAt!.isAfter(eventMaxDate!)) {
                eventMaxDate = element.startAt;
              }
            });

            // if today is in the range of eventMinDate and eventMaxDate, then set today as selectedDate
            // else set eventMinDate as selectedDate

            selectedDate = DateTime.now();
            if (selectedDate!.isBefore(eventMinDate!)) {
              selectedDate = eventMinDate;
            } else if (selectedDate!.isAfter(eventMaxDate!)) {
              selectedDate = eventMaxDate;
            }
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
  }
}
