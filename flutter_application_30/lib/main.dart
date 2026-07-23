import 'dart:async';

void main() {
  /*ONE TIME RUN
  Timer(const Duration(seconds: 5), () {
  print("Yes, I am working");
  });*/

  /*RUN CODE ON EVERY 5 SECONDS
  Timer.periodic(const Duration(seconds: 5), (timer) {
      print("Yes, I am working periodically");
  });
  */

   /*RUN CODE ON EVERY 1 MIN AND 5 SEC, CANCEL
  Timer timer = Timer.periodic(const Duration(minutes: 1, seconds: 5), (timer) {
      print("Yes, I am working periodically");
  });
  timer.cancel();*/


  /*TIME WITH PERIODIC - REPEAT AFTER 1 SEC
  Timer.periodic(const Duration(seconds: 1), (timer) {
    print("After Some time ${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}");
   });*/


  /*STOP/CANCEL PERIOD
  Timer.periodic(Duration(seconds: 1),(timer)
  {
    if(DateTime.now().second == 50)
    {
      timer.cancel();
    }
    print("After some time ${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}");
  });*/

  var a = 0;
  Timer.periodic(Duration(seconds: 1),(timer)
  {
    if(a==5)
    {
      timer.cancel();
    }
    print("Values of a is $a");
    a++;
  });
}
