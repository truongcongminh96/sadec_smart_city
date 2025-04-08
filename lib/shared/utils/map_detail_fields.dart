Map<String, String?> mapDetailFields({
  required Map<String, dynamic> template,
  required Map<String, dynamic> realData,
}) {
  final Map<String, String?> result = {};

  for (final key in template.keys) {
    final label = template[key];
    final value = realData[key];

    if (label is String && value != null && value.toString().trim().isNotEmpty) {
      result[label] = value.toString();
    }
  }

  return result;
}
