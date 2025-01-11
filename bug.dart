```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect handling of JSON response
      final data = jsonDecode(response.body);
      // Assuming data is a list of maps
      for (var item in data) {
        print(item['name']); // Potential error if 'name' key is missing
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
```