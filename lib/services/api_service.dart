import 'dart:convert' show json;
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:seclob_agent/core/endpoints.dart';
import 'package:seclob_agent/core/token.dart';

class ApiService {
//==================== Login ====================
  static Future<String?> login(
      {required String mobile, required String password}) async {
    try {
      final form = json.encode({
        "mobile": mobile,
        "password": password,
      });

      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: form,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString(), name: 'Response');

        final _result = json.decode(response.body) as Map;
        final _status = _result['sts'];

        if (_status == '01') {
          log('Logged in successfully');
          return _result['access_token'];
        } else {
          log('Invalid User Details');
          return null;
        }
      } else {
        log('Error Occured!');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //==================== Get Districts ====================
  static Future<List<dynamic>> districts({required String query}) async {
    try {
      final form =
          json.encode({"search": query, "limit": "100", "state_id": "0"});

      final response = await http.post(
        Uri.parse(ApiEndpoints.districts),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IlRDIiwiaWF0IjoxNjY2MzUxMjIxLCJleHAiOjE2NjYzOTQ0MjF9.UmdqcYipFP0CXrlhKYmhoIBFpSABIxF_Q6sE369FQ1c'
        },
        body: form,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString(), name: 'Response');
        final _results = json.decode(response.body) as Map;
        final _districts = _results['districts'] as List;
        return _districts;
      } else {
        log('Error Occured!');
        throw Exception;
      }
    } catch (e) {
      log(e.toString());
      throw Exception;
    }
  }
}
