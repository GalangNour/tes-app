import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'event_form_page.dart'; // Import the EventFormPage
import 'sidebar.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      // when needed dynamic value, remove const
      child: const MaterialApp(
        home: MonthViewScreen(),
      ),
    );
  }
}

class MonthViewScreen extends StatelessWidget {
  const MonthViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Month View'),
      ),
      drawer: Sidebar(), // Add the Sidebar widget here.
      body: Stack(
        children: [
          MonthView(),
          Positioned(
            bottom: 16, // Adjust the bottom distance as needed
            right: 16, // Adjust the right distance as needed
            child: FloatingActionButton(
              onPressed: () {
                _showEventDialog(context);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showEventDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventFormPage(),
      ),
    );
  }
}
