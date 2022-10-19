// basic functin

void main() {
   myFriend();
   
   String txt = wallet();
   print(txt);

   var calc = monneyInBank() * 33;
   print('calculation money in Baht: $calc');
}

void myFriend() {
  print('my friends: ');
}

String wallet() {
  int money = 1000;

  return 'I have money: $money'; 
}

int monneyInBank() {
  return 1000;
}