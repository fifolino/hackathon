// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onClick;
  final bool isSelected;

  const FilterButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onClick,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onClick,
        child: Container(
          width: 240,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: (isSelected)
                ? Colors.white.withOpacity(0.800000011920929)
                : Colors.white.withOpacity(0.4000000059604645),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(icon,
                color: (isSelected) ? const Color(0xFF1A3C8C) : Colors.white),
            const SizedBox(width: 25),
            Text(text,
                style: TextStyle(
                    color:
                        (isSelected) ? const Color(0xFF1A3C8C) : Colors.white)),
          ]),
        ),
      ),
    );
  }
}

class PrioTable extends StatelessWidget {
  const PrioTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class ChangeIndex extends StatelessWidget {
  final int index;

  const ChangeIndex({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
