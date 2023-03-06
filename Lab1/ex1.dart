void main() {
int nr=2;
int count=0;
int s=0;
int i;
while(count<100)
{ s=0;
  for(i=1;i<=nr;i++)
  {
    if(nr%i == 0)
    { s ++;
    }
  }
 if(s==2)
 {
   count++;
   print(nr);
 }
 nr++;
}

} 