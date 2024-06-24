import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

const List<Map<String, String>> events = [
  {
    'title': 'Event 1',
    'description': 'Description for Event 1',
    'time': '10:00 AM - 12:00 PM',
  },
  {
    'title': 'Event 2',
    'description': 'Description for Event 2',
    'time': '01:00 PM - 03:00 PM',
  },
  {
    'title': 'Event 3',
    'description': 'Description for Event 3',
    'time': '04:00 PM - 06:00 PM',
  },
];

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Events',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return ExpandablePanel(
                      header: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          event['title']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      collapsed: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          event['description']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      expanded: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(event['description']!),
                            SizedBox(height: 8),
                            Text(
                              'Time: ${event['time']}',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      theme: ExpandableThemeData(
                        iconColor: Colors.blue,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
