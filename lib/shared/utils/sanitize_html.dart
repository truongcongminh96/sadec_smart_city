String sanitizeHtml(String html) {
  return html
      .replaceAll(RegExp(r'font-feature-settings:[^;"]*;?'), '')
      .replaceAll(RegExp(r'font-variation-settings:[^;"]*;?'), '');
}
