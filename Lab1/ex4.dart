//ex 4
void main(){
String givenString = "This MAy LoOk aWkwaRd";

var resultantString = givenString.toLowerCase(); //
print(resultantString); // "this may look awkward"
var result = resultantString.replaceAll(RegExp(r"\s+"), "_");
  print(result);
}