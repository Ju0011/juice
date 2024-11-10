import 'package:http/http.dart' as http;
import 'dart:convert';

class NaverApiService {
  final String clientId = 'kj7P7FfTRJtE6yK5akB6';
  final String clientSecret = 'apD8FAHCDv';

  // 검색 API 요청 함수
  Future<List<dynamic>> searchBooks(String query) async {
    final url = Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$query');

    final response = await http.get(url, headers: {
      'X-Naver-Client-Id': clientId,
      'X-Naver-Client-Secret': clientSecret,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['items']; // 검색 결과 리스트
    } else {
      throw Exception('Failed to load search results');
    }
  }

  Future<List<dynamic>> searchLibrary(String query) async {
    final url = Uri.parse('https://openapi.naver.com/v1/search/local.json?query=$query&display=10&sort=comment');

    final response = await http.get(url, headers: {
      'X-Naver-Client-Id': clientId,
      'X-Naver-Client-Secret': clientSecret,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['items']; // 검색 결과 리스트
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
