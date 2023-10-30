import 'package:flutter/material.dart';

class MapsCard extends StatefulWidget {
  const MapsCard({super.key, required this.titulo, required this.deleteCard});
  final String titulo;
  final VoidCallback deleteCard;
  @override
  State<MapsCard> createState() => _MapsCardState();
}

class _MapsCardState extends State<MapsCard> {
  bool isMarked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.titulo),
          leading: const Icon(Icons.shopping_bag_rounded),
          trailing: IconButton(
            icon: isMarked
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            onPressed: () {
              widget.deleteCard();
            },
          ),
        )
      ],
    );
  }
}
