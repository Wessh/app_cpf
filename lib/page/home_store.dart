///Store responsável por toda logica de validação de CPF.
class HomeStore {
  List _cpf = [];

  /// Define o CPF que sera usado para validação
  void setCpf(String cpf) => cpf.length >= 11
      ? _cpf = cpf.replaceAll(RegExp('[^\\d]'), '').length >= 11
          ? cpf
              .replaceAll(RegExp('[^\\d]'), '')
              .replaceAllMapped(
                  RegExp(r".{9}"), (match) => "${match.group(0)}-")
              .split('-')
          : []
      : [];

  ///Retorna `True` para CPF valido e `False` para CPF inválido
  String get isValid => _cpf.isEmpty ? '' : '${_validarCpf(_cpf)}';

  int _resto({required List cpf, required int digito}) {
    var posicao = 0;
    var retorno = 0;

    cpf[0] = digito == 1 ? cpf[0] + cpf[1][0] : cpf[0];

    for (int i = cpf[0].length + 1; i >= 2; i--) {
      var vPosi = int.tryParse(cpf[0][posicao])!;
      retorno += vPosi * i;
      posicao++;
    }
    _cpf[0] = _cpf[0].toString().substring(0, 9);
    retorno = (retorno * 10) % 11;
    return retorno == 10 ? 0 : retorno;
  }

  bool _verificaValidadores(
          {required int resto, required String digitoValidador}) =>
      resto == int.parse(digitoValidador);

  bool _validarCpf(cpf) =>
      _verificaValidadores(
          resto: _resto(cpf: cpf, digito: 0), digitoValidador: cpf[1][0]) &&
      _verificaValidadores(
          resto: _resto(cpf: cpf, digito: 1), digitoValidador: cpf[1][1]);
}
