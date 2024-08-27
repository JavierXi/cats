import 'package:cats/http_client/http_client.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  void initFunction() {
    HttpClient().setAuthConfig("ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr");
  }
}