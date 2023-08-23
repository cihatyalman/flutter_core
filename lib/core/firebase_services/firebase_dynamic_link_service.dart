// Documents and Integration
// *https://pub.dev/packages/firebase_dynamic_links

// ignore_for_file: avoid_print

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

final dynamicLinkService = FirebaseDynamicLinkService(
  baseLink: "https://appname.page.link/",
  packageName: "com.companyname.appname",
  appName: "App Name",
  appStoreId: "",
);

class FirebaseDynamicLinkService {
  final String baseLink;
  final String packageName;
  final String appName;
  final String appStoreId;
  final int? androidMinimumVersion;
  final String? iosMinimumVersion;

  FirebaseDynamicLinkService({
    required this.baseLink,
    required this.packageName,
    required this.appName,
    required this.appStoreId,
    this.androidMinimumVersion,
    this.iosMinimumVersion,
  });

  bool _listenCheck = false;

  Future<String> create({
    required String link,
    String? title,
    String? description,
    String? imageUrl,
  }) async {
    final params = DynamicLinkParameters(
      uriPrefix: baseLink,
      link: Uri.parse(link),
      androidParameters: AndroidParameters(
        packageName: packageName,
        minimumVersion: androidMinimumVersion,
      ),
      iosParameters: IOSParameters(
        bundleId: packageName,
        appStoreId: appStoreId,
        minimumVersion: iosMinimumVersion,
      ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(source: appName),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: title,
        description: description,
        imageUrl: imageUrl == null ? null : Uri.parse(imageUrl),
      ),
    );
    final r1 = await FirebaseDynamicLinks.instance.buildShortLink(params);
    return r1.shortUrl.toString();
  }

  listen() {
    FirebaseDynamicLinks.instance.getInitialLink().then((value) {
      if (value != null) {
        print("[C_link_data_0]: ${value.link.queryParameters["data"]}");
      }
    });
    if (!_listenCheck) {
      _listenCheck = true;
      FirebaseDynamicLinks.instance.onLink.listen((event) {
        print("[C_link_data_1]: ${event.link.queryParameters["data"]}");
      });
    }
  }
}
