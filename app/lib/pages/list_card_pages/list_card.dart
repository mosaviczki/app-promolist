import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/details_page.dart';

// ignore: must_be_immutable
class ListCard extends StatefulWidget {
  ListCard({
    super.key,
    required this.card,
  });

  CardsModel card;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DetailsPages(card: widget.card),
          )),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          border: Border.all(
            width: 0.8,
            color: Colors.blue,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.card.titulo,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
