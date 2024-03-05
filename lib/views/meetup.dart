import 'package:flutter/material.dart';
import 'package:promilo_task/viewmodel/meetup_provider.dart';
import 'package:provider/provider.dart';

class MeetupPage extends StatelessWidget {
  const MeetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Meetup'),
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
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16.0),
            Consumer<MeetupProvider>(
              builder: (context, meetupProvider, _) => Container(
                height: 200.0,
                child: PageView.builder(
                  itemCount: meetupProvider.images.length,
                  onPageChanged: (index) {
                    meetupProvider.currentIndex = index;
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/${meetupProvider.images[index]}',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Consumer<MeetupProvider>(
              builder: (context, meetupProvider, _) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  meetupProvider.images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: meetupProvider.currentIndex == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Center(
                          child: Text(
                            'Card $index',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}