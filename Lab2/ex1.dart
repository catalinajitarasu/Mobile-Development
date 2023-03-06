void main(List<String> arguments) {
  var number = int.parse(arguments.join());
  String stringValue = (number + 1).toString();
  List nums = stringValue.split('');
  print(nums);
}
