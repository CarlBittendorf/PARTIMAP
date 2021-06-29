import 'package:stacked/stacked.dart';

class CreateViewModel extends BaseViewModel {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  void increaseStep() {
    _currentStep += 1;
    notifyListeners();
  }

  String _name = '';
  String get name => _name;

  void changeName(String value) {
    _name = value;
    notifyListeners();
  }

  String _specification = '';
  String get specification => _specification;

  void changeSpecification(String value) {
    _specification = value;
    notifyListeners();
  }

  int _radioValue = 0;
  int get radioValue => _radioValue;

  void changeValue(int value) {
    _radioValue = value;
    notifyListeners();
  }
}
