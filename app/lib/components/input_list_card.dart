import 'package:flutter/material.dart';

class InputListCard extends StatefulWidget {
  const InputListCard({super.key});

  @override
  State<InputListCard> createState() => _InputListCardState();
}

class _InputListCardState extends State<InputListCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _textController1 = TextEditingController();
    TextEditingController _textController2 = TextEditingController();

    return Center(
      child: Container(
        color: Colors.white,
        width: size.width * 0.8,
        height: size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _textController1,
                  decoration: InputDecoration(labelText: 'Titulo'),
                  validator: (value) {
                    
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
