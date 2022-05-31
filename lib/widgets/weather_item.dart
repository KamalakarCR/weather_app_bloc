import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/weather_detail_item.dart';
import '../models/forecast_item.dart';

class WeatherItem extends StatefulWidget {
  final String dateStr;
  final List<ForecastItem> list;

  const WeatherItem({Key? key, required this.dateStr, required this.list})
      : super(key: key);

  @override
  _WeatherItemState createState() => _WeatherItemState();
}

class _WeatherItemState extends State<WeatherItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 800),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListHeading(widget: widget);
          },
          body: Column(
            children: [
              for (var item in widget.list)
                WeatherDetailItem(weatherItem: item),
            ],
          ),
          isExpanded: _expanded,
          canTapOnHeader: true,
        ),
      ],
      dividerColor: Colors.grey,
      expansionCallback: (panelIndex, isExpanded) {
        _expanded = !_expanded;
        setState(() {});
      },
    );
  }
}

class ListHeading extends StatelessWidget {
  const ListHeading({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final WeatherItem widget;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(widget.dateStr);
    final weekday = DateFormat.EEEE().format(date);
    final day = DateFormat.MMMMd().format(date);
    return ListTile(
      title: Text(
        weekday,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        day,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
