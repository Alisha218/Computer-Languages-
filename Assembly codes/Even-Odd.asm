print macro p1
    mov dx,offset p1
    mov ah,09
    int 21h
endm
.model small
.stack 100h
.data  
  msg db 'enter an number: $'
  msg1 db 'number is even $'
  msg2 db 'number is odd $'
  
.code
main proc
    mov ax,@data
    mov ds,ax
    print msg   
    
    mov ah,1
    int 21h
    
    mov bl,2
    div bl
    
    cmp ah,0
    je l1
    jne l2

l1:
 print msg1
 jmp end1
 
l2:
 print msg2
 jmp end1
    
    
    
end1:  
  
  mov ax,4c00h
  int 21h
  main endp
end main
  