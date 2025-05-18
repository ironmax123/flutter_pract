import 'dart:convert';
import 'dart:io';

import 'package:untitled/apps/books/logic/books.dart';

Future<List<Books>> fetchBooks(String searchQuery) async {
  final api = HttpClient();
  final request = await api.getUrl(Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$searchQuery&maxResults=40&language=ja'));
  final response = await request.close();

  final responseBody = await response.transform(const Utf8Decoder()).join();
  final Map<String, dynamic> jsonData = json.decode(responseBody);
  final List<dynamic> items = jsonData['items'] ?? [];

  // items から Books インスタンスを生成して返す
  return items.map((item) {
    final volumeInfo = item['volumeInfo'] ?? {};
    print(volumeInfo['description']);
    return Books(
      title: volumeInfo['title'] ?? '',
      authors: (volumeInfo['authors'] ?? []).join(', '),
      thumbnail: (volumeInfo['imageLinks']?['thumbnail'] ?? ''),
      description: (volumeInfo['description'] ?? ''),
    );
  }).toList();
}
