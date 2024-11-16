import 'package:flutter/material.dart';
import 'package:axislift_shuttle/widgets/hover_card.dart';

class PricingTable extends StatelessWidget {
  final List<PricingPlan> plans;

  PricingTable({@required this.plans});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HoverCard(
            child: Container(
              width: 300,
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plans[index].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'R${plans[index].price.toStringAsFixed(2)} / ${plans[index].duration}',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 24),
                  ...plans[index].features.map((feature) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 8),
                        Text(feature),
                      ],
                    ),
                  )).toList(),
                  Spacer(),
                  ElevatedButton(
                    child: Text('Select Plan'),
                    onPressed: () {
                      // TODO: Implement plan selection
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PricingPlan {
  final String name;
  final double price;
  final String duration;
  final List<String> features;

  PricingPlan({
    @required this.name,
    @required this.price,
    @required this.duration,
    @required this.features,
  });
}