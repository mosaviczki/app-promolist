import 'package:flutter/material.dart';

class InputListCard extends StatefulWidget {
  const InputListCard({
    super.key,
    required this.isOpen,
  });

  final bool isOpen;

  @override
  State<InputListCard> createState() => _InputListCardState();
}

class _InputListCardState extends State<InputListCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();

    closeCard() {}

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: size.width * 0.8,
        height: size.height * 0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => print('teste'),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    controller: textController1,
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value != null) {
                        return value.isEmpty
                            ? 'Por favor, insira um titulo!'
                            : null;
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.62,
                        child: TextFormField(
                          controller: textController2,
                          decoration: const InputDecoration(labelText: 'Item'),
                          validator: (value) {
                            if (value != null) {
                              return value.isEmpty
                                  ? 'Por favor, insira um item!'
                                  : null;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 180,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.separated(
                    itemBuilder: (context, index) => const ListTile(
                      visualDensity: VisualDensity(vertical: -3),
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.circle,
                          size: 15,
                        ),
                      ),
                      title: Text('Item'),
                      trailing: Icon(Icons.delete),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: 10,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(size.width * 0.4, size.height * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
