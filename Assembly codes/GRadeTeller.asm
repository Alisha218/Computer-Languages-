print macro p1
    lea dx,p1
    mov ah,09
    int 21h
    
endm
.model small
.stack 100h
.data
   msg db 'enter score: $'
   msg1 db 'Grade "A" $' 
   msg2 db 'Grade "B" $'
   msg3 db 'Grade "C" $'
   msg4 db 'Grade "D" $'
   msg5 db 'Grade "F" $' 
.code
main proc
    mov ax,@data
    mov ds,ax
    print msg
    
    mov ah,1
    int 21h
    mov bl,al
    mov ah,1
    int 21h
    
   
    
    mov ah,2
    mov dl,10
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    
    cmp bl,057
    je A
    
    cmp bl,56
    je B
    
    cmp bl,55
    je c
    
    cmp bl,54
    je D
    
    cmp bl,54
    jl F
    
    
A:

 print msg1
 jmp exit1
 
B:

 print msg2
 jmp exit1
 
C:
  print msg3
  jmp exit1
 
D:
  print msg4
 jmp exit1
 
F: 
  print msg5
 jmp exit1 
 
exit1:
 mov ax,4ch
 int 21h
 main endp
end main
  
                   