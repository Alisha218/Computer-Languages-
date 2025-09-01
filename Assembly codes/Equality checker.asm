.model small
.stack 100h
.data
  msg1 db 'Enter a number: $'
  msgequal db 'number is equal$'
  msgnotequal db 'number is not equal$'
  msgLess db 'Number is less$'
  msgGreater db 'Number is greater$'
  msgGreaterOrEqual db 'Number is greater or equal$'
  msgLessOrEqual db 'Number is less or equal$'
  num db '3'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov dl,num
    cmp al,dl
    
    je equal
    jne notequal
    jg greater
    jl less
    jge greaterorequal
    jle lessorequal

equal:
  mov dx,offset msgequal
  jmp printmsg
  
notequal:
  mov dx,offset msgnotequal
  jmp printmsg
  
greater:
  mov dx,offset  msgGreater
  jmp printmsg
  
greaterorequal:
  mov dx,offset msgGreaterOrEqual
  jmp printmsg 

    
less:
  mov dx,offset msgLess
  jmp printmsg
  
lessorequal:
  mov dx,offset  msgLessOrEqual
  jmp printmsg  
  
printmsg:
  mov ah,9
  int 21h
  
exit1:
 mov ax,4ch
 int 21h
 main endp
end main