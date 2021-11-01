@ write your arm code below

//1.)

.global _Z12subtract_minPii 
_Z12subtract_minPii: 

  //r0 = points to int a[] 
  //r1 = len. Of the array 

  mov r2, #1 	//r2 = ++ for the loop 
  ldr r3, [r0]//r3 = min value; defaults to a[0] 
  push {r4} 	//r4 compares to min value, then push to stack 

1: 
  add r2, #1 	//i++ 
  cmp r2, r1 	//r2 = i & r1 = len of array 
  bgt a 		//if (i >= len of array) bridge out of loop
  add r0, #4 	//move to next array pointer 
  ldr r4, [r0]	//r4 = a[1, 2, 3, ..., len] (never a[0]) 
  cmp r3, r4 	//r3 = min; r4 = a[i] 
  ble 1 	//if(min <= a[i]), don't change min, loop again 
  mov r3, r4 	//(min > a[i]), set min = a[i] 
  b 1 

a: 
  mov r2, #0 //r2 = i (++ for loop) 
2: 
  cmp r2, r1 //r2 = i; r1 = len of array 
  bge b //if (i >= len) bridge out 
  add r2, #1 //i++ 
  ldr r4, [r0]//r4 = a[i]; r0 = pointer to a[i] 
  sub r4, r3 //a[i] = a[i] - minimum array value str r4, [r0]//store new a[i] back to memory 
  sub r0, #4 //increment to next array pointer (backwards) 
  b 2 //loop again 
b: 
  pop {r4} //return og val
  bx lr
