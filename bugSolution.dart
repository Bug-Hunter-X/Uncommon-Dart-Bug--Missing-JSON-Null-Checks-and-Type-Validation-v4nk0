```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      //Check if data is a List
      if (data is List) {
        for (var item in data) {
          //Check if item is a Map
          if (item is Map && item.containsKey('name')) {
            print(item['name']);
          } else {
            print('Invalid item structure in JSON');
          }
        }
      } else {
        print('Unexpected JSON response');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
```