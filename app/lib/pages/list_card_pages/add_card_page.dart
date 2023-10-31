import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/model/item_model.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/list_card_page.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:provider/provider.dart';

class AddCardPage extends StatefulWidget {
  final CardsModel? card;
  const AddCardPage({super.key, this.card});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
        text: widget.card == null ? '' : widget.card?.titulo);
  }

  late CardRepository cardsRepository;
  TextEditingController _titleController = TextEditingController();
  final _itemController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  List<ItemModel> listaItens = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void iniciaLista() {
    if (widget.card != null) {
      listaItens = widget.card!.listaItens;
    }
  }

  void incrementValue() {
    int currentValue = int.tryParse(_quantityController.text) ?? 1;
    currentValue++;
    _quantityController.text = currentValue.toString();
  }

  void decrementValue() {
    int currentValue = int.tryParse(_quantityController.text) ?? 1;
    if (currentValue != 1) {
      currentValue--;
      _quantityController.text = currentValue.toString();
    }
  }

  void saveCard() {
    setState(() {
      CardsModel card = CardsModel(
        titulo: _titleController.text,
        listaItens: listaItens,
      );
      cardsRepository.saveAll(card, cardARemover: widget.card);
    });
  }

  void limpaLista() {
    setState(() {
      listaItens = [];
      _quantityController.text = '1';
      _titleController.clear();
      _itemController.clear();
    });
  }

  void showMessageAndRedirect(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Center(child: Text(message)),
      duration:
          const Duration(seconds: 4), // Duração da notificação em segundos
      backgroundColor: Colors.green[300],
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ListCardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    cardsRepository = Provider.of<CardRepository>(context);
    iniciaLista();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const Text('Adicionar Lista'),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Titulo para a compra',
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
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 230,
                    child: TextFormField(
                      controller: _itemController,
                      decoration: const InputDecoration(
                        labelText: 'Adicione um item',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () => {
                            setState(
                              () {
                                incrementValue();
                              },
                            )
                          },
                      icon: const Icon(Icons.add)),
                  Text(_quantityController.text),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        decrementValue();
                      });
                    },
                    icon: const Icon(Icons.remove),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: const Text('Adicionar item'),
                  onPressed: () => {
                    setState(
                      () {
                        if (_itemController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    const Text('O item não pode estar vazio!'),
                                backgroundColor: Colors.red[300]),
                          );
                        } else {
                          listaItens.add(
                            ItemModel(
                              nome: _itemController.text,
                              quantidade: int.parse(_quantityController.text),
                            ),
                          );
                          _itemController.clear();
                          _quantityController.text = '1';
                        }
                      },
                    )
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
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
                      title: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(listaItens[index].nome),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            listaItens[index].quantidade.toString(),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            listaItens.remove(listaItens[index]);
                          });
                        },
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: listaItens.length,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              listaItens.isNotEmpty
                  ? SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        child: const Text('Salvar Lista'),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      const Text('Preencha todos os campos!'),
                                  backgroundColor: Colors.red[300]),
                            );
                          } else {
                            String message = widget.card == null
                                ? 'Lista criada com sucesso!'
                                : 'Lista atualizada com sucesso!';
                            saveCard();
                            showMessageAndRedirect(context, message);
                          }
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
