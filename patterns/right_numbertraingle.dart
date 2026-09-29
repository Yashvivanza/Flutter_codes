import 'dart:io';

void main() {
  int numbers, n = 10;

  for(int i=0;i<n;i++){
    numbers = 1;
    for(int j = 0; j<=i; j++)
    {
      stdout.write('$numbers ');
      numbers++;
    }
    stdout.writeln();
  }

}