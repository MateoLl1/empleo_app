
String? validarCedulaEcuatoriana(String? value) {
  if (value == null || value.trim().isEmpty) return 'Campo requerido';
  if (value.length != 10) return 'La cédula debe tener 10 dígitos';
  final digits = value.split('').map(int.parse).toList();
  if (digits[2] > 5) return 'La cédula no es válida';

  final coeficientes = [2, 1, 2, 1, 2, 1, 2, 1, 2];
  int suma = 0;
  for (int i = 0; i < coeficientes.length; i++) {
    int producto = digits[i] * coeficientes[i];
    suma += producto >= 10 ? producto - 9 : producto;
  }

  int verificador = (10 - (suma % 10)) % 10;
  if (verificador != digits[9]) return 'La cédula no es válida';

  return null;
}

String? validarRucEcuatoriano(String? value) {
  if (value == null || value.trim().isEmpty) return 'Campo requerido';
  if (value.length != 13) return 'El RUC debe tener 13 dígitos';

  // Verifica que los últimos 3 dígitos sean 001
  if (value.substring(10) != '001') return 'El RUC debe terminar en 001';

  return null;
}


