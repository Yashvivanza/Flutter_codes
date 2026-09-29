import 'dart:io';

void main() {
  int rows = 6;
  for (int i = 0; i < rows; i++) {
    // Print leading spaces
    for (int j = 0; j < rows - i - 1; j++) {
      stdout.write('  ');
    }
    // Print stars
    for (int k = 0; k <= i; k++) {
      stdout.write('* ');
    }
    stdout.writeln();
  }
}