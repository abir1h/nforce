import 'package:get/get.dart';

class Language {
  final String countryCode;
  final String countryName;
  final List<LanguageElement> languages;

  Language({
    required this.countryCode,
    required this.countryName,
    required this.languages,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    countryCode: json["countryCode"],
    countryName: json["countryName"],
    languages: List<LanguageElement>.from(json["languages"].map((x) => LanguageElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "countryName": countryName,
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
  };
}

class LanguageElement {
  final String languageName;
  final String flagUrl;

  LanguageElement({
    required this.languageName,
    required this.flagUrl,
  });

  factory LanguageElement.fromJson(Map<String, dynamic> json) => LanguageElement(
    languageName: json["languageName"],
    flagUrl: json["flagUrl"],
  );

  Map<String, dynamic> toJson() => {
    "languageName": languageName,
    "flagUrl": flagUrl,
  };
}

class CustomerLanguageController extends GetxController {
  //TODO: Implement CustomerLanguageController
  var data = [
    {
      "countryCode": "AF",
      "countryName": "Afghanistan",
      "languages": [
        {
          "languageName": "Pashto",
          "flagUrl": "https://flagcdn.com/w320/af.png"
        },
        {"languageName": "Dari", "flagUrl": "https://flagcdn.com/w320/af.png"}
      ]
    },
    {
      "countryCode": "AL",
      "countryName": "Albania",
      "languages": [
        {
          "languageName": "Albanian",
          "flagUrl": "https://flagcdn.com/w320/al.png"
        }
      ]
    },
    {
      "countryCode": "DZ",
      "countryName": "Algeria",
      "languages": [
        {"languageName": "Arabic", "flagUrl": "https://flagcdn.com/w320/dz.png"}
      ]
    },
    {
      "countryCode": "AD",
      "countryName": "Andorra",
      "languages": [
        {
          "languageName": "Catalan",
          "flagUrl": "https://flagcdn.com/w320/ad.png"
        }
      ]
    },
    {
      "countryCode": "AO",
      "countryName": "Angola",
      "languages": [
        {
          "languageName": "Portuguese",
          "flagUrl": "https://flagcdn.com/w320/ao.png"
        }
      ]
    },
    {
      "countryCode": "AG",
      "countryName": "Antigua and Barbuda",
      "languages": [
        {
          "languageName": "English",
          "flagUrl": "https://flagcdn.com/w320/ag.png"
        }
      ]
    },
    {
      "countryCode": "AR",
      "countryName": "Argentina",
      "languages": [
        {
          "languageName": "Spanish",
          "flagUrl": "https://flagcdn.com/w320/ar.png"
        }
      ]
    },
    {
      "countryCode": "AM",
      "countryName": "Armenia",
      "languages": [
        {
          "languageName": "Armenian",
          "flagUrl": "https://flagcdn.com/w320/am.png"
        }
      ]
    },
    {
      "countryCode": "AU",
      "countryName": "Australia",
      "languages": [
        {
          "languageName": "English",
          "flagUrl": "https://flagcdn.com/w320/au.png"
        }
      ]
    },
    {
      "countryCode": "AT",
      "countryName": "Austria",
      "languages": [
        {"languageName": "German", "flagUrl": "https://flagcdn.com/w320/at.png"}
      ]
    },
    {
      "countryCode": "AZ",
      "countryName": "Azerbaijan",
      "languages": [
        {
          "languageName": "Azerbaijani",
          "flagUrl": "https://flagcdn.com/w320/az.png"
        }
      ]
    },
    {
      "countryCode": "BS",
      "countryName": "Bahamas",
      "languages": [
        {
          "languageName": "English",
          "flagUrl": "https://flagcdn.com/w320/bs.png"
        }
      ]
    },
    {
      "countryCode": "BH",
      "countryName": "Bahrain",
      "languages": [
        {"languageName": "Arabic", "flagUrl": "https://flagcdn.com/w320/bh.png"}
      ]
    },
    {
      "countryCode": "BD",
      "countryName": "Bangladesh",
      "languages": [
        {
          "languageName": "Bengali",
          "flagUrl": "https://flagcdn.com/w320/bd.png"
        }
      ]
    },
    {
      "countryCode": "BB",
      "countryName": "Barbados",
      "languages": [
        {
          "languageName": "English",
          "flagUrl": "https://flagcdn.com/w320/bb.png"
        }
      ]
    },
    {
      "countryCode": "BY",
      "countryName": "Belarus",
      "languages": [
        {
          "languageName": "Belarusian",
          "flagUrl": "https://flagcdn.com/w320/by.png"
        }
      ]
    },
    {
      "countryCode": "BE",
      "countryName": "Belgium",
      "languages": [
        {"languageName": "Dutch", "flagUrl": "https://flagcdn.com/w320/be.png"},
        {
          "languageName": "French",
          "flagUrl": "https://flagcdn.com/w320/be.png"
        },
        {"languageName": "German", "flagUrl": "https://flagcdn.com/w320/be.png"}
      ]
    },
    {
      "countryCode": "BZ",
      "countryName": "Belize",
      "languages": [
        {
          "languageName": "English",
          "flagUrl": "https://flagcdn.com/w320/bz.png"
        }
      ]
    },
    {
      "countryCode": "BJ",
      "countryName": "Benin",
      "languages": [
        {"languageName": "French", "flagUrl": "https://flagcdn.com/w320/bj.png"}
      ]
    },
    {
      "countryCode": "BT",
      "countryName": "Bhutan",
      "languages": [
        {
          "languageName": "Dzongkha",
          "flagUrl": "https://flagcdn.com/w320/bt.png"
        }
      ]
    },
    {
      "countryCode": "BO",
      "countryName": "Bolivia",
      "languages": [
        {
          "languageName": "Spanish",
          "flagUrl": "https://flagcdn.com/w320/bo.png"
        }
      ]
    },
    {
      "countryCode": "BA",
      "countryName": "Bosnia and Herzegovina",
      "languages": [
        {
          "languageName": "Bosnian",
          "flagUrl": "https://flagcdn.com/w320/ba.png"
        },
        {
          "languageName": "Croatian",
          "flagUrl": "https://flagcdn.com/w320/ba.png"
        },
        {
          "languageName": "Serbian",
          "flagUrl": "https://flagcdn.com/w320/ba.png"
        }
      ]
    },
  ];
  final languages = <Language>[].obs;
  final selectedLanguage = Rx<Language?>(null);


  void fetchLanguages() {
    final List<Map<String, dynamic>> jsonData = data;
    for (var json in jsonData) {
      languages.add(Language.fromJson(json));
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchLanguages();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
