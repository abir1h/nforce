import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nuforce/app/modules/business_manager/models/regional_setting.dart';

class RegionalSettingController extends GetxController {
  //region Dropdown Data

  String? selectedDropdownValue;
  String? selectedTimeZoneDropdownValue = 'Select Time Zone';
  String? selectedDateFormat = 'Select Date Format';
  String? selectedDay = 'Select Day';
  String? selectedTimeFormat = 'Select Time Format';

  List<String> countries = ['Select Country', 'Afghanistan', 'Albania', 'Algeria', 'Bangladesh', 'United States', 'Uruguay'];
  List<String> timezones = [
    'Select Time Zone',
    'UTC -11:00',
    'UTC -04:00',
    'UTC +07:00',
    'UTC +05:00',
    'UTC +13:00',
    'UTC +03:00',
    'UTC +06:00',
    'UTC -04:00',
    'UTC +04:00',
    'UTC -04:00',
    'UTC +11:00',
    'UTC +09:30',
    'UTC +08:45',
  ];
  List<String> dateFormats = [
    'Select Date Format',
    'yyyy-MM-dd',
    'dd/MM/yyyy',
    'MM/dd/yyyy',
    'yyyy-MM-dd HH:mm:ss',
    // Add more date formats as needed
  ];
  List<String> daysOfWeek = ['Select Day', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  List<String> timeFormateList = [
    'Select Time Format',
    '12 Hour(1.30)',
    '24 Hour(13.30)',
  ];

  void setCountry(String value) {
    selectedDropdownValue = value;
    update();
  }

  void setTimezone(String value) {
    selectedTimeZoneDropdownValue = value;
    update();
  }

  void setDateFormat(String value) {
    selectedDateFormat = value;
    update();
  }

  void setDay(String value) {
    selectedDay = value;
    update();
  }

  void setTime(String value) {
    selectedTimeFormat = value;
    update();
  }

  void reset() {
    selectedTimeFormat = timeFormateList.first;
    selectedDateFormat = dateFormats.first;
    selectedDay = daysOfWeek.first;
    selectedTimeZoneDropdownValue = timezones.first;
    selectedDropdownValue = countries.first;
    update();
  }

  void delete() {
    selectedTimeFormat = timeFormateList.first;
    selectedDateFormat = dateFormats.first;
    selectedDay = daysOfWeek.first;
    selectedTimeZoneDropdownValue = timezones.first;
    selectedDropdownValue = countries.first;
    regionalSetting = null;
    update();
  }

  //endregion

  RegionalSettingModel? regionalSetting;

  void addRegionalSetting(RegionalSettingModel data) {
    regionalSetting = data;
    update();
  }

  void getSetting() {
    print(regionalSetting);
  }
}
