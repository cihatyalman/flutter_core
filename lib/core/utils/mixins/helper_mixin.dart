import 'dart:io';

import '../../storage_services/cache_service.dart';

mixin HelperMixin {
  Map<String, String> get getHeaders {
    final token = cacheService.box.get('token');
    return {
      HttpHeaders.authorizationHeader: token == null ? "" : "Bearer $token",
      'language': 'tr',
    };
  }

  String passingTime(DateTime? datetime) {
    if (datetime == null) {
      return " - ";
    }

    final differenceTime = DateTime.now().difference(datetime);
    String result = "";
    if (differenceTime.inMinutes < 1) {
      return "şimdi";
    } else if (differenceTime.inMinutes < 60) {
      result = "${differenceTime.inMinutes} dk";
    } else if (differenceTime.inHours < 48) {
      result = "${differenceTime.inHours} saat";
    } else if (differenceTime.inDays < 30) {
      result = "${differenceTime.inDays} gün";
    } else {
      result = "${(differenceTime.inDays ~/ 30)} ay";
    }
    return "$result önce";
  }

  String passingTimeSort(DateTime? datetime) {
    if (datetime == null) {
      return " - ";
    }

    final differenceTime = DateTime.now().difference(datetime);
    String result = "";
    if (differenceTime.inMinutes < 1) {
      result = "şimdi";
    } else if (differenceTime.inMinutes < 60) {
      result = "${differenceTime.inMinutes}dk";
    } else if (differenceTime.inHours < 48) {
      result = "${differenceTime.inHours}s";
    } else if (differenceTime.inDays < 30) {
      result = "${differenceTime.inDays}g";
    } else {
      result = "${(differenceTime.inDays ~/ 30)}ay";
    }
    return result;
  }
}
