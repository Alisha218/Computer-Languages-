
print MACRO p1
    
    
    lea dx,p1
    mov ah,9
    int 21h
endm


.MODEL SMALL
.STACK 100H

.DATA
msg1 db 'Enter a statement: $'
msg2 db 'Total number of characters: $'

.CODE  
main proc

mov ax,@data
mov ds,ax



print msg1
 mov bl , 48
 
 
 l1: mov ah,1
 int 21h
 cmp al,13
 je end1
 inc bl
 jmp l1
 
 
 
 
 
end1: mov dl,10
mov ah,2
int 21h



mov dl ,13
mov ah,2
int 21h



print msg2


mov dl,bl
mov ah ,2
int 21h


mov ax,4c00h
int 21h



main endp    