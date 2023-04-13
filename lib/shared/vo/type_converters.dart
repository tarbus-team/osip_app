import 'package:floor/floor.dart';
import 'package:osip_app/shared/vo/currency_code.dart';
import 'package:osip_app/shared/vo/date.dart';
import 'package:osip_app/shared/vo/email.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/language_code.dart';
import 'package:osip_app/shared/vo/phone_number.dart';
import 'package:osip_app/shared/vo/time.dart';
import 'package:osip_app/shared/vo/timezone.dart';
import 'package:osip_app/shared/vo/url.dart';

class EmailConverter extends TypeConverter<Email, String> {
  @override
  Email decode(String databaseValue) {
    return Email(databaseValue);
  }

  @override
  String encode(Email value) {
    return value.value;
  }
}

class IDConverter extends TypeConverter<ID, String> {
  @override
  ID decode(String databaseValue) {
    return ID(databaseValue);
  }

  @override
  String encode(ID value) {
    return value.value;
  }
}

class PhoneNumberConverter extends TypeConverter<PhoneNumber, String> {
  @override
  PhoneNumber decode(String databaseValue) {
    return PhoneNumber(databaseValue);
  }

  @override
  String encode(PhoneNumber value) {
    return value.value;
  }
}

class UrlConverter extends TypeConverter<URL, String> {
  @override
  URL decode(String databaseValue) {
    return URL(databaseValue);
  }

  @override
  String encode(URL value) {
    return value.value;
  }
}

class DateConverter extends TypeConverter<Date, String> {
  @override
  Date decode(String databaseValue) {
    return Date(databaseValue);
  }

  @override
  String encode(Date value) {
    return value.value;
  }
}

class LanguageCodeConverter extends TypeConverter<LanguageCode, String> {
  @override
  LanguageCode decode(String databaseValue) {
    return LanguageCode(databaseValue);
  }

  @override
  String encode(LanguageCode value) {
    return value.value;
  }
}

class TimezoneConverter extends TypeConverter<Timezone, String> {
  @override
  Timezone decode(String databaseValue) {
    return Timezone(databaseValue);
  }

  @override
  String encode(Timezone value) {
    return value.value;
  }
}

class CurrencyCodeConverter extends TypeConverter<CurrencyCode, String> {
  @override
  CurrencyCode decode(String databaseValue) {
    return CurrencyCode(databaseValue);
  }

  @override
  String encode(CurrencyCode value) {
    return value.value;
  }
}

class TimeConverter extends TypeConverter<Time, String> {
  @override
  Time decode(String databaseValue) {
    return Time(databaseValue);
  }

  @override
  String encode(Time value) {
    return value.value;
  }
}

class NullableEmailConverter extends TypeConverter<Email?, String?> {
  @override
  Email? decode(String? databaseValue) {
    if (databaseValue != null) {
      return Email(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(Email? value) {
    return value?.value;
  }
}

class NullableIDConverter extends TypeConverter<ID?, String?> {
  @override
  ID? decode(String? databaseValue) {
    if(databaseValue != null) {
      return ID(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(ID? value) {
    return value?.value;
  }
}

class NullablePhoneNumberConverter extends TypeConverter<PhoneNumber?, String?> {
  @override
  PhoneNumber? decode(String? databaseValue) {
    if (databaseValue != null) {
      return PhoneNumber(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(PhoneNumber? value) {
    return value?.value;
  }
}

class NullableUrlConverter extends TypeConverter<URL?, String?> {
  @override
  URL? decode(String? databaseValue) {
    if (databaseValue != null) {
      return URL(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(URL? value) {
    return value?.value;
  }
}

class NullableDateConverter extends TypeConverter<Date?, String?> {
  @override
  Date? decode(String? databaseValue) {
    if (databaseValue != null) {
      return Date(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(Date? value) {
    return value?.value;
  }
}

class NullableLanguageCodeConverter extends TypeConverter<LanguageCode?, String?> {
  @override
  LanguageCode? decode(String? databaseValue) {
    if (databaseValue != null) {
      return LanguageCode(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(LanguageCode? value) {
    return value?.value;
  }
}

class NullableTimezoneConverter extends TypeConverter<Timezone?, String?> {
  @override
  Timezone? decode(String? databaseValue) {
    if (databaseValue != null) {
      return Timezone(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(Timezone? value) {
    return value?.value;
  }
}

class NullableCurrencyCodeConverter extends TypeConverter<CurrencyCode?, String?> {
  @override
  CurrencyCode? decode(String? databaseValue) {
    if (databaseValue != null) {
      return CurrencyCode(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(CurrencyCode? value) {
    return value?.value;
  }
}

class NullableTimeConverter extends TypeConverter<Time?, String?> {
  @override
  Time? decode(String? databaseValue) {
    if (databaseValue != null) {
      return Time(databaseValue);
    } else {
      return null;
    }
  }

  @override
  String? encode(Time? value) {
    return value?.value;
  }
}



