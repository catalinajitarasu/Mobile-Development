void main() {
  List<String> arguments = ["A", "5", "B", "3", "C", "9"];
  String word = "ABBCC";
  var sum = 0;
  var chr = word.split('');
  for (var j = 0; j < chr.length; j++) {
    for (var i = 0; i < arguments.length; i=i+2) {
      if (chr[j] == arguments[i]) sum = sum + int.parse(arguments[i + 1]);
    }
  }
  print(sum);
}
