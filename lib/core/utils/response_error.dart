/// Extrai mensagem de erro do body da resposta (message, error ou errors).
String? messageFromResponse(dynamic data) {
  if (data is! Map<String, dynamic>) return null;
  final errors = data['errors'];
  if (errors is Map<String, dynamic> && errors.isNotEmpty) {
    final parts = <String>[];
    for (final v in errors.values) {
      if (v is List) {
        for (final e in v) {
          if (e != null && e.toString().trim().isNotEmpty) parts.add(e.toString());
        }
      } else if (v != null && v.toString().trim().isNotEmpty) {
        parts.add(v.toString());
      }
    }
    if (parts.isNotEmpty) return parts.join('\n');
  }
  return data['message'] as String? ?? data['error'] as String?;
}
