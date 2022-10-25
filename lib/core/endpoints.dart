import 'package:seclob_agent/core/urls.dart';

//========== Local Endpoints ==========
const String klImageAppendGlobalUrl = klImageBaseUrl + 'global/';
const String klImageAppendCommonUrl = klImageBaseUrl + 'common/';
const String klImageAppendDashboardUrl = klImageBaseUrl + 'dashboard/';
const String klImageAppendExpenseUrl = klImageBaseUrl + 'expense/';

class ApiEndpoints {
  static const login = kBaseUrl + 'telecaller/login';
  static const districts = kBaseUrl + 'location/district/search';
  static const states = kBaseUrl + 'location/state/search';
  static const services = kBaseUrl + 'home/services/search';
  static const createLeads = kBaseUrl + 'telecaller/leads/create';
}
