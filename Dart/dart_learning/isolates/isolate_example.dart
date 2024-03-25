import 'dart:developer';
import 'dart:isolate';

void main(List<String> args) {
  IsolateExample().spawn();
  IsolateExample().run();
}

class IsolateExample {
  spawn() {
    // create receiver port for isolate
    ReceivePort receivePort = ReceivePort();

    // send port

    SendPort sendPort = receivePort.sendPort;

    Isolate.spawn(_heavyTask, [sendPort, "url"]);

    receivePort.listen((message) {
      print(message);
    });
  }

  _heavyTask(args) async {
    SendPort sendPort = args[0];
    int result = 0;
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      result += i;
      log("$result");
      sendPort.send(result);
    }

    Isolate.exit(sendPort, result);
  }

  run() async {
    var x = await Isolate.run(_heavyTaskRun);
    print("ISOLATE_RUN=$x");
  }

  _heavyTaskRun() async {
    int result = 0;
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      result += i;
    }
    return result;
  }
}
