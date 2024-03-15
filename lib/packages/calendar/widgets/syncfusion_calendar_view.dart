import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packages_tester_updated/packages/calendar/bloc/calendar_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class SyncfusionCalendarView extends StatelessWidget {
  final calendarBloc = CalendarBloc();
  SyncfusionCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => calendarBloc,
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Información de los reportes'
              )
            )
          ),
          Container(
            height: screenHeight * 0.5,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3)
            ),
            child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                _addPostFrameCallBack(state, context);
                if(state is OnCalendarActive){
                  return SfCalendar(
                    selectionDecoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 2
                      )
                    ),
                    allowDragAndDrop: true,
                    allowAppointmentResize: false,
                    allowViewNavigation: false,
                    viewNavigationMode: ViewNavigationMode.snap,
                    backgroundColor: Colors.white,
                    view: CalendarView.month,
                    dataSource: MeetingDataSource(_getDataSource(state)),
                    appointmentBuilder: (_, details){
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.blue
                      );
                    },
                    // by default the month appointment display mode set as Indicator, we can
                    // change the display mode as appointment using the appointment display
                    // mode property
                    timeSlotViewSettings: const TimeSlotViewSettings (),
                    resourceViewSettings: const ResourceViewSettings(),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                      navigationDirection: MonthNavigationDirection.vertical
                    ),
                    onTap: (details) {
                      print('****************');
                      print('On tap');
                      print(details.appointments?.length);
                      print(details.date);
                    },
                    onViewChanged: (details) {
                      final initDate = state.viewInitDate;
                      final lastDate = state.viewEndDate;
                      if(
                        (initDate == null && lastDate == null) ||
                        (
                          !details.visibleDates.first.isAtSameMomentAs(state.viewInitDate!) 
                          && !details.visibleDates.last.isAtSameMomentAs(state.viewEndDate!)
                        )
                      ){
                        calendarBloc.add(ChangeCalendarView(
                          initDate: details.visibleDates.first,
                          endDate: details.visibleDates.last
                        ));
                      }
                    }
                  );
                }else{
                  return Container();
                }
              }
            )
          )
        ]
      ),
    );
  }

  List<Meeting> _getDataSource(OnCalendarActive state) {
    return state.viewSpecialDays.map<Meeting>(
      (date) => Meeting(
        'pera',
        date,
        date,
        Colors.blueAccent,
        true
      )
    ).toList();
  }

  void _addPostFrameCallBack(CalendarState state, BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(state is CalendarInitial){
        calendarBloc.add(InitCalendarView());
      }
    });
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source):super(
    
  ) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) => true;

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
