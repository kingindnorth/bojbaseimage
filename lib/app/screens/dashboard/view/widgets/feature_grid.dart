

import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/service/model/feature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature_card.dart';

/// 4 columns per row. If < 4 items, tiles expand to fill width evenly.
/// If > 4, overflow wraps to the next row (controller caps at 8 total).
class FeatureGrid extends StatelessWidget {
final List<Feature> items;
final double gap;        // logical units (scaled inside)
final double tileHeight; // logical units (scaled at use)

const FeatureGrid({
super.key,
required this.items,
this.gap = 16,
this.tileHeight = 220,
});

@override
Widget build(BuildContext context) {
if (items.isEmpty) return SizedBox(height: 80.h);

final rows = <Widget>[];
final hGap = gap.w;
final vGap = gap.h;

for (int i = 0; i < items.length; i += 4) {
final end = (i + 4 > items.length) ? items.length : i + 4;
final rowItems = items.sublist(i, end);

rows.add(
Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
for (int j = 0; j < rowItems.length; j++) ...[
Expanded(
child: Padding(
padding: EdgeInsets.only(
left: j == 0 ? 0 : hGap / 2,
right: j == rowItems.length - 1 ? 0 : hGap / 2,
),
child: SizedBox(
height: tileHeight.h,
child: FeatureCard(item: rowItems[j]),
),
),
),
],
],
),
);

if (end < items.length) rows.add(SizedBox(height: vGap));
}

return Column(children: rows);
}
}
