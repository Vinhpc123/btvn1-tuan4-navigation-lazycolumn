import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation + LazyColumn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootScreen(),
    );
  }
}

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo.png', width: 200, errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, size: 100, color: Colors.red);
            }),
          ),
          const SizedBox(height: 20),
          const Text(
            "Navigation",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "is a framework that simplifies the implementation of navigation between different UI components (activities, fragments, or composables) in a app",
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListScreen()),
              );
            },
            child: const Text("PUSH"),
          ),
        ],
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LazyColumn - Improved')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100, // Giảm số lượng để kiểm tra dễ hơn
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    '$index | "The only way to do great work is to love what you do."',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(quote: 'Quote #$index'),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  final String quote;
  const DetailScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quote,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Back to Root'),
            ),
          ],
        ),
      ),
    );
  }
}
