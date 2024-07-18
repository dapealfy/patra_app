import 'dart:convert';
import 'dart:developer';
import 'package:app/core/response/json_response.dart';
import 'package:app/core/type_defs.dart';
import 'package:http/http.dart';

/// {
///  "data": ???,
///  "pagination": null,
///  "stat_code": 200,
///  "stat_msg": "success"
/// }
/// this class is the core base class to support wider scheme of response data.
/// [rawData] field is [dynamic] at this point.
/// typical implementation can
/// use [JsonResponse], [ScalarResponse] and [JsonListResponse].
class ApiResponse extends Response {
  /// response body in (assumed) JSON form
  /// null if body is not JSON
  late final Json? jsonBody = _decodeToJsonOrNull(body);

  dynamic get rawData => jsonBody;

  int? get statCode => jsonBody?['stat_code'];

  String? get message => jsonBody?['message'];

  /// wrap http.Response with ApiResponse
  ApiResponse(Response response)
      : super(
          response.body,
          response.statusCode,
          request: response.request,
          headers: response.headers,
          isRedirect: response.isRedirect,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase,
        );

  static JsonResponse<T> json<T>(
          Response response, T Function(Json json) cast) =>
      JsonResponse(response, cast);

  // return empty Json if decode failed
  static Json? _decodeToJsonOrNull(String body) {
    try {
      return jsonDecode(body);
    } on FormatException catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
        name: 'ApiResponse._decodeToJsonOrNull',
        error: body,
      );
      return null;
    }
  }
}
