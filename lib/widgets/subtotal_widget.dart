import 'package:flutter/material.dart';
import 'reusable_widget.dart';

class SubTotalWidget extends StatelessWidget {
  const SubTotalWidget({
    super.key,
    required this.totalPrice,
  });

  final ValueNotifier<int?> totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int?>(
          valueListenable: totalPrice,
          builder: (context, val, child) {
            return ReusableWidget(
              title: 'Sub-Total',
              value: r'IDR ' + (val?.toStringAsFixed(2) ?? '0'),
            );
          },
        ),
      ],
    );
  }
}
