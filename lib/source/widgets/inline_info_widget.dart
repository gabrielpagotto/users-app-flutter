import 'package:flutter/material.dart';

class InlineInfoWidget extends StatelessWidget {
  final String label, value;
  const InlineInfoWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: Row(
            children: [
              Text(label),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 0, indent: 17),
      ],
    );
  }
}
