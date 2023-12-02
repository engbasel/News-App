import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weatherapp/models/Apimodel.dart';
import 'package:weatherapp/models/Model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = 'bef76f3745f14e858972673858a9a662';
  final String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  late List<Article> newsData;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('$baseUrl&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final newsResponse = NewsResponse.fromJson(jsonData);

      setState(() {
        newsData = newsResponse.articles ?? [];
      });
    } else {
      print('Error fetching news: ${response.statusCode}');
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('News App')),
      ),
      body: GridView.builder(
        itemCount: newsData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final article = newsData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(width: 10, height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.title ?? 'No Title',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.description ?? 'No Description',
                      maxLines:
                          3, // You can limit the number of lines for the description
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.content ?? 'No Description',
                      maxLines:
                          3, // You can limit the number of lines for the description
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.publishedAt ?? 'No Description',
                      maxLines:
                          3, // You can limit the number of lines for the description
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.author ?? 'No Description',
                      maxLines:
                          3, // You can limit the number of lines for the description
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

































// GridView.builder(
//         itemCount = newsData.length,
//         gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.5,
//         ),
//         itemBuilder = (context, index) {
//           return Container(
//             child: const Column(
//               children: [
//                 // Text(newsData.),
//                 Text('AAAAAAAAAAAAAAAAAAAAAAAAAAAAa'),
//                 Text('BBBBBBBBBBBBBBBBBBBBBBBBBbbbb'),
//                 Text('CCCCCCCCCCCCCCCCCCCCCCCCCCC'),
//               ],
//             ),
//           );
//         },
//       ),

//  ListView.builder(
//         itemCount: newsData.length,
//         itemBuilder: (context, index) {
//           final article = newsData[index];
//           return ListTile(
//             title: Text(article.title ?? ''),
//             subtitle: Text(article.description ?? ''),
//           );
//         },
//       ),