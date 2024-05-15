import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/model/agents_model.dart';
import 'package:nuforce/app/model/card_model.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/modules/new_orders/models/activity_log_model.dart';
import 'package:nuforce/app/modules/new_orders/models/contact_details_model.dart';
import 'package:nuforce/app/modules/new_orders/models/payment_method_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_success_model.dart';
import 'package:nuforce/app/modules/new_orders/services/activity_log_api_service.dart';
import 'package:nuforce/app/modules/new_orders/services/note_api_service.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/utils/colors.dart';

class InvoiceController extends GetxController {
  List<ActivityListData> activityLogList = [];
  List<Email> noteList = [];

  @override
  void onInit() {
    super.onInit();
    getInvoice();
    getActivityLog();
    getNotes();
  }

  void getInvoice() {
    final invoice = Get.arguments as Invoice;
    updateInvoice(invoice);
  }

  ///Activity Log
  getActivityLog() {
    final invoice = Get.arguments as Invoice;
    ActivityLogApiService.getActivityLog(invoice.id!).then((value) {
      value.fold((l) {
        activityLogList = l.data!;
        update();
      }, (r) => print(r));
    });
  }

  ///Note
  getNotes() {
    final invoice = Get.arguments as Invoice;
    NoteApiService.getNote(invoice.contactId.toString()).then((value) {
      value.fold((l) {
        noteList = l.notes!;
        update();
      }, (r) => print(r));
    });
  }

  // New code
  Invoice? _invoice;
  Invoice? get invoice => _invoice;
  void updateInvoice(Invoice invoice) {
    _invoice = invoice;
    update();
  }

  // Previous code
  XFile? _image;
  XFile? get image => _image;
  Future<void> setImage() async {
    _image = await pickImage(ImageSource.gallery);
    update();
  }

  DateTime? _invDate;
  DateTime? get invDate => _invDate;
  void updateInvDate(DateTime? date) {
    _invDate = date;
    update();
  }

  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  void updateExpireDate(DateTime? date) {
    _expireDate = date;
    update();
  }

  List<Agent> get agents => _agents;
  final List<Agent> _agents = const [
    Agent(
      id: 1,
      name: 'Agent 1',
      image: 'assets/images/agents/agent1.png',
      status: 'Away(10 min ago)',
      color: AppColors.agentCardBg1,
    ),
    Agent(
      id: 2,
      name: 'Agent 2',
      image: 'assets/images/agents/agent2.png',
      status: 'Not Available',
      color: AppColors.agentCardBg2,
    ),
    Agent(
      id: 3,
      name: 'Agent 3',
      image: 'assets/images/agents/agent3.png',
      status: 'Active',
      color: AppColors.agentCardBg1,
    ),
    Agent(
      id: 4,
      name: 'Agent 4',
      image: 'assets/images/agents/agent4.png',
      status: 'Not Available',
      color: AppColors.agentCardBg2,
    ),
    Agent(
      id: 5,
      name: 'Agent 5',
      image: 'assets/images/agents/agent5.png',
      status: 'Not Available',
      color: AppColors.agentCardBg1,
    ),
  ];

  Agent? _selectedAgent;
  Agent? get selectedAgent => _selectedAgent;
  void updateSelectedAgent(Agent agent) {
    _selectedAgent = agent;
    update();
  }

  PaymentMethodModel? _selectedPaymentMethod;
  PaymentMethodModel? get selectedPaymentMethod => _selectedPaymentMethod;
  void updateSelectedPaymentMethod(PaymentMethodModel paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    update();
  }

  String? _cancellationNote =
      r'$5.00 cancellation fee might be applied if cancelled after activation.';
  String? get cancellationNote => _cancellationNote;
  void updateCancellationNote(String note) {
    _cancellationNote = note;
    update();
  }

  Card? _savedCard;
  Card? get savedCard => _savedCard;
  void updateSavedCard(Card card) {
    _savedCard = card;
    update();
  }

  // add to cart
  final List<LineItem> _cartItems = [];
  List<LineItem> get cartItems => _cartItems;
  void addLineItem(LineItem item) {
    _cartItems.add(item);
    update();
  }

  void removeLineItem(int index) {
    _cartItems.removeAt(index);
    update();
  }
}
