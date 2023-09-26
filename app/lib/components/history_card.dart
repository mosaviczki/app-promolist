import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    double cardWidth = 315;
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          width: cardWidth,
          child: const ListTile(
            visualDensity: VisualDensity(vertical: -4),
            title: Text(
              'Aniversario do João',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: Color.fromRGBO(71, 101, 255, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
        ),
        Container(
          width: cardWidth,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R350,00',
                  style: TextStyle(
                      color: Color.fromRGBO(9, 107, 0, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.history,
                          color: Color.fromRGBO(163, 163, 163, 1)),
                    ),
                    Text(
                      '1 week ago',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(163, 163, 163, 1),
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
