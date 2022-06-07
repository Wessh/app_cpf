import 'package:app_cpf/page/home_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Validação CPF', () {
    var cs = HomeStore();

    cs.setCpf('346.314.060-89');

    expect(cs.isValid, 'true');
  });
}
