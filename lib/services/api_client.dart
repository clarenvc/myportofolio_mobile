import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/models/education.dart';

class ApiException implements Exception {
  const ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class ApiClient {
  ApiClient({http.Client? client, this.baseUrl = apiBaseUrl})
    : _client = client ?? http.Client();

  final http.Client _client;
  final String baseUrl;

  Uri _uri(String path) => Uri.parse('$baseUrl$path');


// SKILLS
  Future<List<Skill>> getSkills() async {
    final response = await _client.get(
      _uri('/api/v1/skills/'),
      headers: const {'Accept': 'application/json'},
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Skill.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Skill> createSkill(Skill skill, {required String token}) async {
    final response = await _client.post(
      _uri('/api/v1/skills/'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonEncode(skill.toJson()),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return Skill.fromJson(decoded);
  }


// EDUCATOIN
  Future<List<Education>> getEducations() async {
    final response = await _client.get(
      _uri('/api/v1/education/'),
      headers: const {'Accept': 'application/json'},
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Education.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Education> createEducation(
    Education education, {
    required String token,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/education/'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonEncode(education.toJson()),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return Education.fromJson(decoded);
  }

  Future<String> obtainToken(String username, String password) async {
    final response = await _client.post(
      _uri('/api/v1/auth/token/'),
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return decoded['token'] as String;
  }

  Future<void> logout({required String token}) async {
    final response = await _client.post(
      _uri('/api/v1/auth/logout/'),
      headers: {'Accept': 'application/json', 'Authorization': 'Token $token'},
    );
    _ensureSuccess(response);
  }

  void _ensureSuccess(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    }
    throw ApiException(response.statusCode, response.body);
  }
}
