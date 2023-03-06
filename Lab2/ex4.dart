int getSum(int n) {
  int result = 0;
  for (int i = n; i > 0; i = (i / 10).floor()) {
    result += (i % 10);
  }
  return result;
}

void main() {
  int n = 13;
  var arr = [];
  var list = <int, List<int>>{};

  int maxi = 0;

  for (var i = 1; i <= n; i++) {
    if (getSum(i) > maxi) maxi = getSum(i);
  }
  print(maxi);

  for (var i = 1; i <= maxi; i++) {
    arr.add(0);
  }

  for (var j = 0; j <= arr.length; j++)
    for (var i = 1; i <= n; i++) {
      if (j + 1 == getSum(i)) arr[j] = arr[j] + 1;
    }

  print(arr);

  int maxx = 0;

  for (var i = 0; i < arr.length; i++) {
    if (arr[i] >= maxx) maxx = arr[i];
  }

  var nr = 0;
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] == maxx) nr++;
  }

  print(nr);
}
