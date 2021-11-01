.global _Z12subtract_minPii
_Z12subtract_minPii:
            //r0 = pointer to int a[]
            //r1 = length of array
    mov    r2, #1    //r2 = increment for the loop
    ldr    r3, [r0]//r3 = minimum value; defaults to a[0]
    push    {r4}    //r4 compares to minimum value, push to stack
a:
    add    r2, #1    //i++
    cmp    r2, r1    //r2 = i, r1 = length of array
    bgt    2f    //if (i >= length of array) bridge out of loop
    add    r0, #4    //go to next array pointer
    ldr    r4, [r0]//r4 = a[1, 2, 3, ..., len] (never a[0])
    cmp    r3, r4    //r3 = min; r4 = a[i]
    ble    a    //if(min <= a[i]), don't change min, loop again
    mov    r3, r4    //(min > a[i]), set min = a[i]
    b    a
2:
    mov    r2, #0    //r2 = i (increment for loop)
b:
    cmp    r2, r1    //r2 = i; r1 = length of array
    bge    3f    //if (i >= len) bridge out
    add    r2, #1    //i++
    ldr    r4, [r0]//r4 = a[i]; r0 = pointer to a[i]
    sub    r4, r3    //a[i] = a[i] - minimum array value
    str    r4, [r0]//store new a[i] back to memory
    sub    r0, #4    //increment to next array pointer (backwards)
    b    b    //loop again
3:
    pop    {r4}    //return originial value
    bx    lr