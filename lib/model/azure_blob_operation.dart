import 'package:http/http.dart' as http;

class MathOperation {
  static int addNumbers(int a, int b) {
    return a + b;
  }

  static Future<void> fetchData() async {
    String storageAccountUrl = "https://strtestmsc.blob.core.windows.net";
    String containerName = "sch-ci";
    String blobName = "appointmenttracker.json";
    String sasToken =
        "sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2024-04-19T23:19:10Z&st=2024-03-20T15:19:10Z&spr=https&sig=V2FcI%2F%2B6TYxRI9sAn8SM%2BYEQWkh3HNfhadGCu45Gh%2B4%3D";
    final response = await http.get(
      Uri.parse('$storageAccountUrl/$containerName/$blobName?$sasToken'),
    );
    if (response.statusCode == 200) {
      // Handle successful response
      print('Blob content: ${response.body}');
    } else {
      // Handle error response
      print('Failed to fetch blob: ${response.statusCode}');
    }
  }
}
