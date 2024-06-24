import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

const List<Map<String, String>> events = [
  {
    'title': 'Extravaganza 24',
    'description':
        'Join us for Extravaganza 24, a grand celebration featuring live music, dance performances, and a variety of food stalls. Don\'t miss out on the chance to win exciting prizes in our games and raffles.',
    'time': '10:00 AM - 12:00 PM',
  },
  {
    'title': 'Baila Night 24',
    'description':
        'Get ready to dance the night away at Baila Night 24 Enjoy a mix of Latin and international music performed by top DJs. There will also be salsa lessons for beginners and a special performance by renowned dancers.',
    'time': '01:00 PM - 03:00 PM',
  },
  {
    'title': 'Christmas Party 24',
    'description':
        'Celebrate the holiday season with us at the Christmas Party 24 Indulge in festive foods, enjoy carols sung by local choirs, and participate in our Christmas-themed games and competitions. Bring your family and friends for a joyful afternoon.',
    'time': '04:00 PM - 06:00 PM',
  },
];

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
