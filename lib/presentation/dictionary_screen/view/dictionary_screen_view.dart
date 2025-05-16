// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/dictionary_screen_contrl.dart';
//
// class DictionarySearchScreen extends StatefulWidget {
//   const DictionarySearchScreen({super.key});
//
//   @override
//   State<DictionarySearchScreen> createState() => _DictionarySearchScreenState();
// }
//
// class _DictionarySearchScreenState extends State<DictionarySearchScreen> {
//   final DictionaryController controller = Get.put(DictionaryController());
//   final FocusNode _searchFocusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dictionary')),
//       body: Column(
//         children: [
//           // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               focusNode: _searchFocusNode,
//               controller: controller.searchController,
//               decoration: InputDecoration(
//                 hintText: 'Enter word to search...',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.search),
//                   onPressed: () => controller.performSearch(controller.searchController.text),
//                 ),
//               ),
//               onChanged: (value) {
//                 // Only search if suggestions are active
//                 if (controller.showSuggestions.value) {
//                   controller.performSearch(value);
//                 }
//               },
//             ),
//           ),
//
//           // "You searched" section
//           Obx(() {
//             if (controller.selectedWord.isNotEmpty && controller.selectedMeaning.isNotEmpty) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'You searched:',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           const Text(
//                             'English: ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Expanded(child: Text(controller.selectedWord.value)),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Urdu: ',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Expanded(
//                             child: Text(
//                               controller.selectedMeaning.value,
//                               textDirection: TextDirection.rtl,
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return const SizedBox.shrink();
//             }
//           }),
//
//           // Suggestions List
//           Expanded(
//             child: Obx(() {
//               if (!controller.showSuggestions.value) {
//                 return const SizedBox.shrink();
//               }
//
//               if (controller.searchResults.isEmpty) {
//                 return const Center(child: Text('No results found.'));
//               } else {
//                 return ListView.builder(
//                   itemCount: controller.searchResults.length,
//                   itemBuilder: (context, index) {
//                     final item = controller.searchResults[index];
//                     final word = item['word'] ?? '';
//                     final meaning = item['meaning'] ?? 'No meaning found';
//
//                     return ListTile(
//                       title: Text(word),
//                       subtitle: Text(meaning),
//                       onTap: () {
//                         controller.onWordTap(context, word, meaning);
//                       },
//                     );
//                   },
//                 );
//               }
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../data/database/db_helper.dart';

class DictionarySearchScreen extends StatefulWidget {
  const DictionarySearchScreen({super.key});

  @override
  _DictionarySearchScreenState createState() => _DictionarySearchScreenState();
}

class _DictionarySearchScreenState extends State<DictionarySearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final DbHelper _dbHelper = DbHelper();
  List<Map<String, dynamic>> _searchResults = [];
  String _selectedWord = '';
  String _selectedMeaning = '';

  @override
  void initState() {
    super.initState();
    _dbHelper.initDatabase(); // Initialize the database
  }

  void _performSearch(String query) async {
    if (query.trim().isEmpty) return;

    final results = await _dbHelper.searchWord(query);
    if (results.isEmpty) {
      Fluttertoast.showToast(msg: "No word in dictionary. Try another word.");
    }

    setState(() {
      _searchResults = results;
      _selectedWord = '';
      _selectedMeaning = '';
    });
  }

  void _onWordTap(String word, String meaning) {
    print('Tapped: $word - $meaning'); // Debugging output
    setState(() {
      _selectedWord = word;
      _selectedMeaning = meaning;
      _controller.clear();
      _searchResults = [];
    });
    FocusScope.of(context).unfocus(); // Hide keyboard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dictionary')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter word to search...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _performSearch(_controller.text),
                ),
              ),
              onChanged: (value) => _performSearch(value),
            ),
          ),

          // You searched section
          if (_selectedWord.isNotEmpty && _selectedMeaning.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You searched:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'English: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Text(_selectedWord)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Urdu: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            _selectedMeaning,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          // Search results
          Expanded(
            child: _searchResults.isEmpty
                ? Center(child: Text('No results found.'))
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final item = _searchResults[index];
                final word = item['word'] ?? '';
                final meaning = item['meaning'] ?? 'No meaning found';

                return ListTile(
                  title: Text(word),
                  subtitle: Text(meaning),
                  onTap: () => _onWordTap(word, meaning),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
