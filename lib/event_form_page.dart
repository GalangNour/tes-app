import 'package:flutter/material.dart';

class EventFormPage extends StatefulWidget {
  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  List<String> teamOptions = ['Team1', 'Team2', 'Team3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Event Title',
              ),
              // Handle user input for event title.
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: startDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );

                    if (pickedDate != null && pickedDate != startDate) {
                      setState(() {
                        startDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    "Start Date: ${startDate.toLocal()}".split(' ')[0],
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: endDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );

                    if (pickedDate != null && pickedDate != endDate) {
                      setState(() {
                        endDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    "End Date: ${endDate.toLocal()}".split(' ')[0],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: teamOptions.first,
              items: teamOptions.map((team) {
                return DropdownMenuItem<String>(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  // Handle team selection here
                });
              },
              decoration: InputDecoration(
                hintText: 'Select Team',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Event Description',
              ),
              // Handle user input for event description.
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle form submission and event creation here.
                // You can access the user input for title, start date, end date, team, and description.
                // Create a CalendarEventData object and add it to the controller.
              },
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
