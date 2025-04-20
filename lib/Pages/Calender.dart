import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../Components/EventTile.dart';
import '../Models/EventItem.dart';

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({super.key});

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  late final Map<DateTime, List<EventItem>> _events;
  DateTime _focusedDay = DateTime(2020, 3, 8);
  DateTime? _selectedDay;
  String _filter = 'All'; // All, Holiday, EventItem

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;

    _events = {
      DateTime(2020, 3, 1): [EventItem("National Day", "Holiday", Colors.pink.shade100)],
      DateTime(2020, 3, 10): [EventItem("Summer Holiday EventItem", "EventItem", Colors.blue.shade100)],
      DateTime(2020, 3, 22): [EventItem("School Function", "EventItem", Colors.pink.shade100)],
      DateTime(2020, 3, 26): [EventItem("Dean Meeting", "EventItem", Colors.green.shade100)],
      DateTime(2020, 3, 30): [EventItem("Carnival in the City", "Holiday", Colors.pink.shade100)],
    };
  }

  List<EventItem> _getEventsForDay(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    final allEvents = _events[date] ?? [];
    if (_filter == 'All') return allEvents;
    return allEvents.where((e) => e.type == _filter).toList();
  }

  List<MapEntry<DateTime, List<EventItem>>> _getFilteredEvents() {
    return _events.entries
        .where((entry) =>
            _filter == 'All' ||
            entry.value.any((EventItem) => EventItem.type == _filter))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final yearOptions = [2020, 2021, 2022];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D36FB),
        elevation: 0,
        title: const Text('Calendar', style: TextStyle(fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _focusedDay.year,
              dropdownColor: Colors.deepPurple.shade50,
              items: yearOptions.map((year) {
                return DropdownMenuItem(
                  value: year,
                  child: Text(
                    '$year',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (year) {
                if (year != null) {
                  setState(() {
                    _focusedDay = DateTime(year, _focusedDay.month, _focusedDay.day);
                  });
                }
              },
            ),
          ),
          const SizedBox(width: 12),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Calendar Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                DateFormat('MMMM yyyy').format(_focusedDay),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),

            // Calendar Widget
            TableCalendar<EventItem>(
              firstDay: DateTime(2019),
              lastDay: DateTime(2025),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              calendarFormat: CalendarFormat.month,
              eventLoader: _getEventsForDay,
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  color: Color(0xFF5D36FB),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  shape: BoxShape.circle,
                ),
                markersAlignment: Alignment.bottomCenter,
                markerDecoration: const BoxDecoration(
                  color: Color(0xFF5D36FB),
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
            ),
            const SizedBox(height: 10),

            // Filter Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['All', 'EventItem', 'Holiday'].map((type) {
                final isSelected = _filter == type;
                return ChoiceChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => _filter = type);
                  },
                  selectedColor: Colors.deepPurple.shade100,
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            // EventItem List
            Expanded(
              child: ListView(
                children: _getFilteredEvents().map((entry) {
                  final date = entry.key;
                  return Column(
                    children: entry.value
                        .where((e) => _filter == 'All' || e.type == _filter)
                        .map((EventItem) => EventTile(
                              date: date,
                              title: EventItem.title,
                              type: EventItem.type,
                              color: EventItem.color,
                            ))
                        .toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

