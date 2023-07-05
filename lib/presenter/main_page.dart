import 'package:flutter/material.dart';

import 'main_controller.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key, required this.mainController});
  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Find Cep'),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: TextField(
                  key: const Key('txt_field_buscar_cep'),
                  controller: mainController.textEditingController,
                  decoration: const InputDecoration(suffixIcon: Icon(Icons.search), border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: OutlinedButton(
                  key: const Key('btn_buscar_cep'),
                  onPressed: () => mainController.getCepInfo(),
                  child: const Center(
                    child: Text('Buscar'),
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: mainController,
                builder: (context, child) {
                  if (mainController.mainControllerStatus == MainControllerStatus.success) {
                    return Padding(
                      key: const Key('state_success_wigets'),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('CEP: '),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mainController.cep!.cep),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('CIDADE: '),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mainController.cep!.city),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('DDD: '),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mainController.cep!.ddd.toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('BAIRRO: '),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mainController.cep!.neighborhood ?? 'N/A'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('RUA: '),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mainController.cep!.street ?? 'N/A'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('COMPLEMENTO: '),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mainController.cep!.complement ?? 'N/A'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (mainController.mainControllerStatus == MainControllerStatus.error) {
                    return const Center(
                      key: Key('state_error_wigets'),
                      child: Text(
                        'Não foi encontrado dados sobre este CEP',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (mainController.mainControllerStatus == MainControllerStatus.loading) {
                    return const Center(key: Key('state_loading_wigets'), child: CircularProgressIndicator());
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
