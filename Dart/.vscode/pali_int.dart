void main() {
  checkPali(1001);
}

bool checkPali(int value) {
  int res = 0;
  int temp = value;
  while (temp > 0) {
    res = (res * 10) + (temp % 10);

    temp = temp ~/ 10;
  }
  print(res);
  return res == value;
}
