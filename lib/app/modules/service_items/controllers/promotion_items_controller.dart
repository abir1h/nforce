import 'package:get/get.dart';

class PromotionItemsController extends GetxController {
  Rx<PromotionTabEnum> miniTabEnum = PromotionTabEnum.coupon.obs;
}

enum PromotionTabEnum { coupon, discount, offer, gift }

enum SelectedPromotionTabEnum { overview, subItems, settings, content }
