import 'package:dbul/tokenizer.dart';

typedef Index = Map<String, List<String>>;
typedef Doc = Map<String, dynamic>;

class Dbul {
  Tokenizer _tokenizer = Tokenizer();
  final Index index = {};
  final Map<String, dynamic> store = {};
  int id = 1;

  void addDoc(Doc doc) {
    for (String field in doc.keys) {
      List<String> tokens = _tokenizer.tokenize(doc[field].toString());
      tokens = _analyze(tokens);
      for (String token in tokens) {
        if (!index.containsKey(token)) {
          index[token] = [];
        }
        index[token]!.add('$id');
      }
    }
    store['$id'] = doc;
    id++;
  }

  List<String> search(String query) {
    List<String> result = [];
    for (String token in _tokenizer.tokenize(query)) {
      if (index.containsKey(token)) {
        result.addAll(index[token]!);
      }
    }
    return result;
  }

  _analyze(List<String> tokens) {
    return tokens;
  }
}
