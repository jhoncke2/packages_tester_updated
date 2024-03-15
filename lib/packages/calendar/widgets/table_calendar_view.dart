import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:packages_tester_updated/packages/calendar/bloc/calendar_bloc.dart';

class TableCalendarView extends StatelessWidget {
  final calendarBloc = CalendarBloc();
  TableCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<CalendarBloc>(
      create: (_) => calendarBloc,
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Información de los Reportes')
            )
          ),
          SizedBox(
            height: screenHeight * 0.55,
            child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                return TableCalendar<String>(
                  
                  calendarStyle: CalendarStyle(

                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false
                  ),
                  simpleSwipeConfig: const SimpleSwipeConfig(
                    verticalThreshold: 0,
                    horizontalThreshold: 100,
                    swipeDetectionBehavior: SwipeDetectionBehavior.continuous
                  ),
                  availableGestures: AvailableGestures.all,
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (_, date, event) {
                      if (event.isNotEmpty) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.1)
                          )
                        );
                      } else {
                        return null;
                      }
                    }
                  ),
                  eventLoader: (dateTime) => dateTime.isAtSameMomentAs(
                    DateTime(2023, 12, 19).subtract(const Duration(days: 2))
                  ) ? [dateTime.toString()]
                    : <String>[],
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(2000, 12, 1),
                  lastDay: DateTime(2040, 12, 31)
                );
              }
            )
          )
        ]
      ),
    );
  }
}
