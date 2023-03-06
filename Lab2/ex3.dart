void main() {
  var list_of_numbers = [4, 5, 6, 8, 3, 1, 4, 7, 9, 5, 2, 5, 7];
  var set_of_tuple = Set<String>();
  for (var i = 0; i < list_of_numbers.length; i++)
    for (var j = i+1; j < list_of_numbers.length; j++) {
      if (list_of_numbers[i] == list_of_numbers[j])
        set_of_tuple.add('($i,$j)');
    }
  print(set_of_tuple);
  print(set_of_tuple.length);
}
