import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/domain/use_cases/get_cep_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum MainControllerStatus { success, initial, error, loading }

class MainController extends ChangeNotifier {
  final GetCepInfoImpl getCepInfoImpl;
  MainController(this.getCepInfoImpl);
  MainControllerStatus mainControllerStatus = MainControllerStatus.initial;
  TextEditingController textEditingController = TextEditingController();
  Cep? cep;

  Future getCepInfo() async {
    mainControllerStatus = MainControllerStatus.loading;
    notifyListeners();
    var result = await getCepInfoImpl(textEditingController.text);
    result.fold((left) {
      mainControllerStatus = MainControllerStatus.error;
    }, (right) {
      cep = right;
      mainControllerStatus = MainControllerStatus.success;
    });
    notifyListeners();
  }
}
