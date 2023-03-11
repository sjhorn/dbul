class Tokenizer {
  static RegExp defaultSeparator = RegExp(r'[\s\-]+');
  late RegExp? separator;

  Tokenizer([this.separator]) {
    separator ??= defaultSeparator;
  }

  List<String> tokenize(String str) => _split(str);

  // this is more optimized when we don't need position in str
  List<String> _split(String str) {
    List<String> result = str.toString().split(separator!);
    if (result.first.isEmpty) result.removeAt(0);
    if (result.last.isEmpty) result.removeAt(0);
    return result;
  }

  // Keep this for later when we need the position in the source
  List<String> _indexOf(String str) {
    List<String> result = [];

    int startIndex = 0;
    int seperatorMatch = 0;
    while (startIndex < str.length &&
        (seperatorMatch = str.indexOf(separator!, startIndex)) > 0) {
      var token = str.substring(startIndex, seperatorMatch).trim();
      if (token.isNotEmpty) {
        result.add(token);
      }
      startIndex = seperatorMatch + 1;
    }
    if (startIndex < str.length) {
      result.add(str.substring(startIndex, str.length));
    }
    return result;
  }
}
