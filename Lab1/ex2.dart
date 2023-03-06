void main(){
final String string = 'My n0ame    **   is,flutter! ';
String word;
String result = string.replaceAll(RegExp(r"\s+"), " ");
List words = result.split(RegExp(r"[,;.! ]"));
  
for (word in words)
{if(RegExp(r'^[A-Za-z0-9]+$').hasMatch(word) == true)
    print(word);
}
  
}