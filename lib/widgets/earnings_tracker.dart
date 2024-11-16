import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EarningsTracker extends StatelessWidget {
  final List<double> weeklyEarnings = [150, 200, 175, 225, 190, 210, 180];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Earnings Tracker',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 250,
                lineBarsData: [
                  LineChartBarData(
                    spots: weeklyEarnings
                        .asMap()
                        .entries
                        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                        .toList(),
                    isCurved: true,
                    colors: [Theme.of(context).primaryColor],
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Weekly Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildWeeklySummary(),
        ],
      ),
    );
  }

  Widget _buildWeeklySummary() {
    final totalEarnings = weeklyEarnings.reduce((a, b) => a + b);
    final averageEarnings = totalEarnings / weeklyEarnings.length;

    return Column(
      children: [
        _buildSummaryItem('Total Earnings', 'R${totalEarnings.toStringAsFixed(2)}'),
        _buildSummaryItem('Average Daily Earnings', 'R${averageEarnings.toStringAsFixed(2)}'),
        _buildSummaryItem('Highest Earning Day', 'R${weeklyEarnings.reduce((a, b) => a > b ? a : b).toStringAsFixed(2)}'),
        _buildSummaryItem('Lowest Earning Day', 'R${weeklyEarnings.reduce((a, b) => a < b ? a : b).toStringAsFixed(2)}'),
      ],
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}