.model small
.stack 100h
.data           
  msg db 'Hello World$'
  str db 10,13,'Reverse message: $'
.code 
main proc
  mov ax,@data
  mov ds,ax
  
  mov cx,11
  mov si,offset msg
  
L1:
 push [si]
 inc si
 loop L1
 
 mov cx,11
 lea dx,msg
 mov ah,9
 int 21h
 
 lea dx,str
 mov ah,9
 int 21h
 
L2:
 pop dx
 mov ah,2
 int 21h
 loop L2
 
 mov ax,4ch
 int 21h
 main endp
end main