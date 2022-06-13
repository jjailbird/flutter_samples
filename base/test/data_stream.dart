
// [Dart 제너레이터](https://lucky516.tistory.com/84)

Stream<int> dataStream() async* {
  for (int i = 1; i <=3; i++) {
    print("SENDING data ${i.toString()}");
    await Future.delayed(const Duration(seconds: 3));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = dataStream();

  stream.listen((event) { 
    print("RECIEVE data ${event.toString()}");
  });
}