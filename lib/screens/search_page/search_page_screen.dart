import 'package:flutter/material.dart';
import 'package:juice/naver_api/naver_api_service.dart';
import 'components/search_item.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final NaverApiService _apiService = NaverApiService();
  final FocusNode _focusNode = FocusNode(); // 자판 컨트롤용

  final ValueNotifier<List<dynamic>> _searchResults = ValueNotifier([]); // 검색 데이터 저장
  final ValueNotifier<bool> _isAscending = ValueNotifier(true); // 가격순 정렬 상태 저장

  // 검색 버튼 클릭 시 호출될 함수
  void _search() async {
    final query = _controller.text;
    if (query.isNotEmpty) {
      final results = await _apiService.searchBooks(query);
      _searchResults.value = results;
      _sortResultsByPrice();
    }
  }

  // 가격 순서대로 정렬하는 함수
  void _sortResultsByPrice() {
    _searchResults.value.sort((a, b) {
      final priceA = int.tryParse(a['discount']) ?? 0;
      final priceB = int.tryParse(b['discount']) ?? 0;
      return _isAscending.value ? priceA.compareTo(priceB) : priceB.compareTo(priceA);
    });
    _searchResults.notifyListeners(); // 수동으로 변경사항 알림
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // FocusNode 해제
    _searchResults.dispose();
    _isAscending.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('책 검색'),
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
                    keyboardType: TextInputType.text, // 한글 자판
                    focusNode: _focusNode, // textField 에 FocusNode 할당
                    decoration: const InputDecoration(
                      hintText: '검색어를 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => _search(), // Enter 키로 검색 실행
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search, // 검색 버튼 클릭 시 실행
                ),
              ],
            ),
            const SizedBox(height: 10), // 검색 상자 아래 공백

            // 정렬 버튼
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _isAscending,
                  builder: (context, isAscending, child) {
                    return ElevatedButton.icon(
                      icon: Icon(isAscending ? Icons.arrow_downward : Icons.arrow_upward),
                      label: const Text('가격순 정렬'),
                      onPressed: () {
                        _isAscending.value = !_isAscending.value;
                        _sortResultsByPrice();
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10), // 정렬 버튼 아래 공백

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
                      return SearchResultItem(item: item);
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
