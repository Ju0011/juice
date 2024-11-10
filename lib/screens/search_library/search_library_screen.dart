import 'package:flutter/material.dart';
import 'package:juice/naver_api/naver_api_service.dart';

import 'components/search_library_item.dart';

class SearchLibraryScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final NaverApiService _apiService = NaverApiService();
  final FocusNode _focusNode = FocusNode(); // 자판 컨트롤용

  final ValueNotifier<List<dynamic>> _searchResults = ValueNotifier([]); // 검색 데이터 저장


  // 검색 버튼 클릭 시 호출될 함수
  void _search() async {
    final query = _controller.text;
    if (query.isNotEmpty) {
      final results = await _apiService.searchLibrary(query);
      _searchResults.value = results;
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // FocusNode 해제
    _searchResults.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('서점 검색'),
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        backgroundColor: Colors.green, // 배경색상 지정
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,         // 한글 자판
                    focusNode: _focusNode,                    // textField 에 FocusNode 할당
                    decoration: const InputDecoration(
                      hintText: '검색어를 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => _search(),        // Enter 키로 검색 실행
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search,                         // 검색 버튼 클릭 시 실행
                ),
              ],
            ),
            const SizedBox(height: 10), // 검색 상자 아래 공백

            Expanded(
              child: ValueListenableBuilder<List<dynamic>>(
                valueListenable: _searchResults,
                builder: (context, searchResults, child) {
                  return searchResults.isEmpty
                      ? const Center(child: Text('검색 결과가 없습니다.'))
                      : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final item = searchResults[index];
                      return SearchLibraryItem(item: item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
