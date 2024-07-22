import 'dart:convert';
import 'dart:io';

import 'package:app/core/constant/storage_key.dart';
import 'package:app/core/storage/local_storage.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BaseNetwork {
  BaseNetwork._();
  static BaseNetwork? _instance;
  static BaseNetwork get instance => _instance ?? BaseNetwork._();
  Duration get _timeout => const Duration(minutes: 1);
  LocalStorageService storage = LocalStorageService.instance;
  final client = http.Client();

  String baseUrl = 'http://patraland.soldigtest.my.id/';

  Map<String, String> get baseHeader => {'Accept': 'application/json'};

  Future<Map<String, String>> get baseOption async => {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${await storage.getToken() ?? ""}',
      };

  // METHOD GET
  Future<Response> get(
    String path, {
    required Map<String, String>? options,
    M,
    queryParameters,
    bool showSnackbarError = true,
    String? errorTitle,
    bool? overrideUrl,
  }) async {
    final client = http.Client();
    final request = client.get(
      queryParameters != null
          ? Uri.parse(overrideUrl == true ? path : baseUrl + path)
              .replace(queryParameters: queryParameters)
          : Uri.parse(overrideUrl == true ? path : baseUrl + path),
      headers: options,
    );

    request.timeout(_timeout);
    final response = await request;

    if (response.statusCode == 200) {
      return response;
    } else {
      if (showSnackbarError) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: Text(
              response.body.toString() != 'null' &&
                      jsonDecode(response.body).containsKey('message')
                  ? jsonDecode(response.body)['message']
                  : 'Terjadi kesalahan',
            ),
          ),
        );
      }

      return response;
    }
  }

  // METHOD POST
  Future<Response> post(
    String path, {
    required Map<String, String>? options,
    dynamic body,
    List<FileModel?>? files,
    bool showSnackbarError = true,
    String? errorTitle,
  }) async {
    if (files != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(baseUrl + path),
      );

      request.headers.addAll(options!);
      request.fields.addAll(body!);

      for (var fileData in files) {
        if (fileData!.files.length > 1) {
          for (var file in fileData.files) {
            request.files.add(
              await http.MultipartFile.fromPath(
                '${fileData.requestName}[${fileData.files.indexOf(file)}]',
                file,
              ),
            );
          }
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              fileData.requestName,
              fileData.files.first,
            ),
          );
        }
      }

      var response = await request.send();
      final resBody = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        return Response(
          resBody,
          response.statusCode,
          request: response.request,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase,
          headers: response.headers,
          isRedirect: response.isRedirect,
        );
      } else {
        if (showSnackbarError) {
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            SnackBar(
              content: Text(
                resBody.toString() != 'null' &&
                        jsonDecode(resBody).containsKey('message')
                    ? jsonDecode(resBody)['message']
                    : 'Terjadi kesalahan',
              ),
            ),
          );
        }

        return Response(
          resBody,
          response.statusCode,
          request: response.request,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase,
          headers: response.headers,
          isRedirect: response.isRedirect,
        );
      }
    } else {
      final client = http.Client();
      final request = client.post(Uri.parse(baseUrl + path), body: body);
      request.timeout(_timeout);
      final response = await request;
      if (response.statusCode == 201) {
        return response;
      } else {
        if (showSnackbarError) {
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            SnackBar(
              content: Text(
                response.body.toString() != 'null' &&
                        jsonDecode(response.body).containsKey('message')
                    ? jsonDecode(response.body)['message']
                    : 'Terjadi kesalahan',
              ),
            ),
          );
        }

        return response;
      }
    }
  }

  // METHOD PUT
  put(
    String path, {
    required Map<String, String>? options,
    dynamic body,
    String? errorTitle,
    bool showSnackbarError = true,
  }) async {
    final client = http.Client();
    final request = client.put(
      Uri.parse(baseUrl + path),
      body: body,
      headers: options,
    );

    request.timeout(_timeout);
    final response = await request;

    if (response.statusCode == 200) {
      return response;
    } else {
      if (showSnackbarError) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: Text(
              response.body.toString() != 'null' &&
                      jsonDecode(response.body).containsKey('message')
                  ? jsonDecode(response.body)['message']
                  : 'Terjadi kesalahan',
            ),
          ),
        );
      }

      return response;
    }
  }
}

class CoreHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class FileModel {
  final String requestName;
  final List<String> files;

  const FileModel({required this.requestName, required this.files});
}
