import 'package:flutter/material.dart';
import 'package:promilo_task/viewmodel/description_provider.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatelessWidget {
  final int cardIndex;

  const DescriptionPage(this.cardIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details for Card $cardIndex',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Consumer<DescriptionProvider>(
              builder: (context, descriptionProvider, _) => TextField(
                onChanged: (value) {
                  descriptionProvider.description = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Consumer<DescriptionProvider>(
              builder: (context, descriptionProvider, _) => SizedBox(
                height: 200.0,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: descriptionProvider.images.length,
                      onPageChanged: (index) {
                        descriptionProvider.currentIndex = index;
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'assets/${descriptionProvider.images[index]}',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.7),
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.download),
                            onPressed: () {
                              // TODO: Implement download logic
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              // TODO: Implement share logic
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite),
                            onPressed: () {
                              // TODO: Implement favorite logic
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.star),
                            onPressed: () {
                              // TODO: Implement star logic
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Consumer<DescriptionProvider>(
              builder: (context, descriptionProvider, _) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  descriptionProvider.images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: descriptionProvider.currentIndex == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Add logic to save description
                print('Description Saved: ${context.read<DescriptionProvider>().description}');
              },
              child: const Text('Save Description'),
            ),
          ],
        ),
      ),
    );
  }
}