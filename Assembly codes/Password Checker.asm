print macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
endm
.model small
.stack 100h
.data
   msg1 db 'SZABIST$'
   msg2 db 'please neter your passowrd$'
   msg3 db 'password is correct$'
   msg4 db 'invalid password. please try again',10,13,,'$'
   
.code
main proc
start:
  mov ax,@data
  mov ds,ax
  print msg2
  mov si,offset msg1
  mov cx,7
  
l1:
 mov ah,7
 int 21h
 mov bl,al
 mov dl,'*'
 mov ah,2
 int 21h
 cmp [si],bl
 jne incorrect
 inc si
 Loop l1
 print msg3
 jmp end 
 
incorrect:
  dec cx
  
incorrect1:
  mov ah,7
  int 21h
  mov dl,'*'
  mov ah,2
  int 21h
  loop incorrect1
  print msg4
  jmp start
end:
 mov ax,4ch
 int 21h
 main endp
end main
 