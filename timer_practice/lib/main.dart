import 'dart:async';

main()
{
  Timer.periodic(
    Duration(seconds: 1 ), (timer) {
      if(DateTime.now().second == 20)
      {
        timer.cancel();
      }
      print(
      "After sometime ${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}");
    }
  );
}