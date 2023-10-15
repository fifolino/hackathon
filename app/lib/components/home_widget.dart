// ignore_for_file: deprecated_member_use

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
            Text(
              text,
              style: TextStyle(
                  color: (isSelected) ? const Color(0xFF1A3C8C) : Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}

class PrioTable extends StatelessWidget {
  final List<Map<String, String>> data;
  const PrioTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = [];

    for (var item in data) {
      List<DataCell> cells = [];
      item.forEach((key, value) =>
          cells.add(DataCell(Center(child: Text(value, softWrap: true)))));
      rows.add(DataRow(cells: cells));
    }

    return DataTable(
      columnSpacing: 0,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      headingRowHeight: 85,
      headingRowColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => const Color.fromARGB(255, 26, 60, 140),
      ),
      dataRowColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => Colors.white),
      headingTextStyle: const TextStyle(fontSize: 22, color: Colors.white),
      dataRowHeight: MediaQuery.of(context).size.height * 0.07,
      dataTextStyle: const TextStyle(fontSize: 20, color: Color(0xFF1A3C8C)),
      columns: data.first.keys
          .map((key) => DataColumn(
                label: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                    child:
                        Text(key, softWrap: true, textAlign: TextAlign.center)),
              ))
          .toList(),
      rows: rows,
    );
  }
}

class ChangeIndex extends StatelessWidget {
  final int index;
  final Function(int) onPageSelected;

  const ChangeIndex({
    Key? key,
    required this.index,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPageSelected(index),
      child: Text('$index', style: TextStyle(fontSize: 16)),
      style: TextButton.styleFrom(
        primary: Color(0xFF1A3C8C), // Customize the color as needed
      ),
    );
  }
}
