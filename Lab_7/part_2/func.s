@ write your arm code below

//2.)

.global _Z3factoriali 
.global _Z6chooseii 

main: 
  //r0 = int res  
  push {lr} 
  bl _Z6chooseii 
  pop {lr} 
  bx lr 

_Z6chooseii: 
//r0 = n 
//r1 = r 
  push {r1, r4, r5, lr}   //r1 is used int factorial 
                    //r5 will hold r! (non static) 
  subs r4, r0, r1   //r4 = n - r 
                    //n! 
  bl _Z3factoriali  //find n! 
  pop {r1}          //return value of r to r1 
  mov r3, r0        //save n! to r3 
                    //r! 
  mov r0, r1        //r1 holds r; then move to r0 to find r! 
  bl _Z3factoriali  //find r! 
  mov r5, r0        //save r! to r5 
                    //(n-r)! 
  mov r0, r4        //move (n-r) @ r0 in order to find (n-r)! 
  bl _Z3factoriali  //find (n-r)! 

//n! is saved to r3 
//r! is saved to r5 
//(n-r)! is saved to r0 
//n choose r: 

  mul r1, r0, r5    //r1 = den = r! * (n-r)! 
  mov r0, r3        //r0 = num = n! 
  bl __aeabi_idiv   //divide function 
  pop {r4, r5, lr} 
  bx lr             //return n choose r 

_Z3factoriali: 
                    //r0 = k; return k! 
  mov r2, #1        //r2 = answer = 1 
  cmp r0, #0 
  movle r0, #1      //if (r0 <= 0); r0! = 1 
  ble 4f            //return k! = 1 
  subs r1, r0, #1   //r1 = (k-1) 
  b 1f 

2: 
  cmp r1, #1   //r1 = k - 2 
  ble 3f      //if (r1 <= 0); bridge out and end 
  mul r2, r1  //answer = answer * k - 2 (first time) subs r1, #1 //k - 1 
  b 2b        //repeat until r1 = 0 

1:          //only at the first iteration 
  mul r2, r1, r0  //answer = (k-1) * k 
  subs r1, #1     //r1 = (k-1) - 1 
  b 2b 

3:            //r1 = 0 
  mov r0, r2  //move k! into r0
4: 
  bx lr   //return k!
