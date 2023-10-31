import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/item_model.dart';

class InputListCard extends StatefulWidget {
  final Function toggleIsVisible;

  const InputListCard({
    super.key,
    required this.toggleIsVisible,
  });

  @override
  State<InputListCard> createState() => _InputListCardState();
}

class _InputListCardState extends State<InputListCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController cardTitleController = TextEditingController();
    TextEditingController itemNameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    List<ItemModel> listaItem = [];

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: size.width * 0.8,
        height: size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => widget.toggleIsVisible(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    controller: cardTitleController,
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
                  TextFormField(
                    controller: itemNameController,
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
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.62,
                        child: TextFormField(
                          controller: quantityController,
                          decoration:
                              const InputDecoration(labelText: 'Quantidade'),
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
                          onPressed: () {
                            setState(() {
                              listaItem
                                  .add(ItemModel(nome: 'teste', quantidade: 2));
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              listaItem.isEmpty
                  ? const Text('')
                  : SizedBox(
                      height: 180,
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: ListView.separated(
                          itemBuilder: (context, index) => ListTile(
                            visualDensity: const VisualDensity(vertical: -3),
                            leading: const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.circle,
                                size: 15,
                              ),
                            ),
                            title: Text(listaItem[index].nome),
                            trailing: const Icon(Icons.delete),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: listaItem.length,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                },
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
