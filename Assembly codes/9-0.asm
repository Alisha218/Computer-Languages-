.model small
.stack 100h
.data
.code
main proc
  mov cx,10
  mov dx,57
  
li:
 mov ah,2
 int 21h
 
 dec dx
 loop li
 
 mov ax,4ch
 int 21h
 main endp
end main