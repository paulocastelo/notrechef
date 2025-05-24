extension StringExtensions on String? {
  /// Retorna o valor da string ou um texto padrão se for nula ou vazia
  String orDefault([String defaultValue = 'Não definido']) {
    if (this == null || this!.trim().isEmpty) {
      return defaultValue;
    }
    return this!.trim();
  }
}
