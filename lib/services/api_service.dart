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
      final body = json.encode({
        "mobile": mobile,
        "password": password,
      });

      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body,
      );

      log(response.body.toString(), name: 'Response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map _result = json.decode(response.body) as Map;
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
      log('', error: e.toString());
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
          'Authorization': 'Bearer ${AccessToken.token}'
        },
        body: form,
      );

      log(response.body.toString(), name: 'Response');

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  //==================== Get States ====================
  static Future<List<dynamic>> states({required String query}) async {
    try {
      final form = json.encode({"limit": "100", "search": query});

      final response = await http.post(
        Uri.parse(ApiEndpoints.states),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AccessToken.token}'
        },
        body: form,
      );

      log(response.body.toString(), name: 'Response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final _results = json.decode(response.body) as Map;
        final _districts = _results['states'] as List;
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

  //==================== Get Services ====================
  static Future<List<dynamic>> services({required String query}) async {
    try {
      final form = json.encode({"limit": "100", "search": query});

      final response = await http.post(
        Uri.parse(ApiEndpoints.services),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AccessToken.token}'
        },
        body: form,
      );

      log(response.body.toString(), name: 'Response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final _results = json.decode(response.body) as Map;
        final _districts = _results['services'] as List;
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

  //==================== Create Leads ====================
  static Future createLeads({
    required String name,
    required String companyName,
    required String number,
    required List services,
    required String stateId,
    required String districtId,
  }) async {
    try {
      final form = json.encode({
        "name": name,
        "mobile": number,
        "whatsapp": number,
        "company": companyName,
        "services": services,
        "telle_desc": "description",
        "state_id": stateId,
        "district_id": districtId,
        "address": "",
        "telle_id": "5",
        "hr_id": "11",
        "status": "New"
      });

      final response = await http.post(
        Uri.parse(ApiEndpoints.createLeads),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AccessToken.token}'
        },
        body: form,
      );

      log(response.body.toString(), name: 'Response');

      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   final _results = json.decode(response.body) as Map;
      //   final _districts = _results['services'] as List;
      //   return _districts;
      // } else {
      //   log('Error Occured!');
      //   throw Exception;
      // }
    } catch (e) {
      log(e.toString());
      throw Exception;
    }
  }

  //==================== List Leads ====================
  static Future<List<dynamic>> getLeads(
      {required String query, required String status}) async {
    try {
      final form =
          json.encode({"limit": "100", "search": query, "status": status});

      final response = await http.post(
        Uri.parse(ApiEndpoints.listLeads),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AccessToken.token}'
        },
        body: form,
      );

      log(response.body.toString(), name: 'Response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final _results = json.decode(response.body) as Map;
        final _users = _results['users'] as List;
        return _users;
      } else {
        log('Error Occured!');
        throw Exception;
      }
    } catch (e) {
      log(e.toString());
      throw Exception;
    }
  }

  //==================== Update Lead Status ====================
  static Future updateLeadStatus(
      {required String id, required String status}) async {
    try {
      final form = json.encode({"status": status});

      final response = await http.post(
        Uri.parse(ApiEndpoints.updateLeadStatus + id),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AccessToken.token}'
        },
        body: form,
      );

      log(response.body.toString(), name: 'Response');
    } catch (e) {
      log(e.toString());
      throw Exception;
    }
  }
}
