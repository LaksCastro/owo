import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  var value = 0;

  @observable
  var currentText = '';

  @action
  void increment() {
    value++;
  }

  @action
  void changeText(String newText) {
    currentText = newText;
  }
}
