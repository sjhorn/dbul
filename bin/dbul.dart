import 'dart:convert';
import 'dart:io';

import 'package:dbul/dbul.dart';

final separator = RegExp(r'[\s\-]+');

void main(List<String> args) async {
  Dbul dbul = Dbul();

  var movies = json.decode(File('./movies.json').readAsStringSync());
  int length = movies.length;

  for (var movie in movies) {
    dbul.addDoc(movie);
  }
  for (String id in dbul.search('Saint')) {
    print(dbul.store[id]['title']);
  }
}
