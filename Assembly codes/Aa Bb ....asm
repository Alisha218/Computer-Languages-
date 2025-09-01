 print macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
endm
.model small
.stack 100h
.data   
   a db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    mov bx,65
   
    mov cx,26 
l1:
  
 mov dl,bl
 mov ah,2
 int 21h
 mov a,bl
 add a,32

 
 mov dl,a
 mov ah,2
 int 21h 
 
  mov dl,32
 mov ah,2
 int 21h
 
 
 inc bl 
 loop l1
 
exit:
 mov ax,4ch
 int 21h
 main endp
end main
