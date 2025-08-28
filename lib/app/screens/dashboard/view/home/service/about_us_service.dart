// import 'package:dio/dio.dart';
//
// class AboutUs{
//
//   final Dio dio;
//   final String lbu;
//
//   Future<List<ExpApiPolicySummary>?> getPolicies(
//       String clientId,
//       String lbu,
//       ) async {
//     var headers = <String, Object?>{};
//
//     final apiRequest = getRequest(clientId, lbu);
//
//     if (apiRequest.options?.headers != null) {
//       headers = {...headers, ...apiRequest.options!.headers!};
//     }
//     try {
//       final response = await dio.get(
//         apiRequest.path,
//         options: Options(headers: headers),
//       );
//
//       if (response.statusCode == 200) {
//         final result = List<ExpApiPolicySummary>.from(
//           (response.data! as Iterable).map(
//                 (e) => ExpApiPolicySummary.fromJson(e as Map<String, dynamic>),
//           ),
//         );
//         return result;
//       }
//     } catch (e) {
//       return null;
//     }
//
//     return null;
//   }
//
//   ApiRequest getRequest(String clientId, String lbu) {
//     return ApiRequest(
//       path: getRequestUrl(clientId, lbu),
//       options: Options(headers: {ApiRequest.tenantHeaderName: lbu}),
//     );
//   }
//
//   String getRequestUrl(String clientId, String lbu) {
//     return '/getdata?clientId=$clientId&dataContractId=1';
//   }
//
// }