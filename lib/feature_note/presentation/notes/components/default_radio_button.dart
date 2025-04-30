import 'package:flutter/material.dart';

class DefaultRadioButton extends StatelessWidget {
  const DefaultRadioButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelect,
  });

  final String text;
  final bool selected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Radio<bool>(
          value: true,
          groupValue: selected,
          onChanged: (_) => onSelect(),
        ),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
