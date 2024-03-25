Future<void> main(List<String> args) async {
  print("A");
  method();
  print("E");
}

method() async {
  Future(() {
    print("B");
  }).then((value) {
    print("C");
  });
  print("D");
}
