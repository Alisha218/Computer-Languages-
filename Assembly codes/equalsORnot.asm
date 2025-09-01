.model small
.stack 100h
.data
   msg1 db 'number is equal$'
   msg2 db 'number is not equal$'
   num db '5'
   
.code
main proc
    mov ax,@data
    mov ds,ax
     
    mov ah,1
    int 21h
    
    mov dl,num
    cmp al,dl
    je equal
    
    mov dx,offset msg2
    mov ah,9
    int 21h
    jmp exit1
    
equal:
   mov dx,offset msg1
   mov ah,9
   int 21h
   
exit1:
   mov ax,4ch
   int 21h
main endp 
end main