void main(){
String str = "Hafce00453dfg234fdksd";

//get the integer
int newnum1 = int.parse(str.replaceAll(RegExp(r'[^0-9]'),''));
print(newnum1); //output: 453234
}
