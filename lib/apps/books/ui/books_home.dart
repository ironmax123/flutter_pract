import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/books/logic/api.dart';
import 'package:untitled/apps/books/logic/books.dart';

class BooksHomePage extends HookWidget {
  const BooksHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');
    return Scaffold(
      appBar: AppBar(title: const Text('書籍一覧')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'タイトル',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  searchQuery.value = searchController.text;
                },
                child: Text('検索'),
              ),
            ],
          ),
          FutureBuilder<List<Books>>(
            future: fetchBooks(searchQuery.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('エラーが発生しました: ${snapshot.error}'));
              }
              final books = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          book.thumbnail.isNotEmpty
                              ? Image.network(book.thumbnail, width: 120)
                              : const Icon(Icons.book),
                          Gap(20),
                          Text(
                            book.title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Gap(10),
                          Text(
                            book.authors,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Divider()
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
