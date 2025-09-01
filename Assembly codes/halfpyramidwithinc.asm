;half pyramid with inc number
.model small
.stack 100h
.data
 noi dw 1
 var1 db '1'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,9
Label1:
  mov bx,cx
  mov cx,noi
 
Label2:
  mov dl,var1
  mov ah,2
  int 21h
  
  loop Label2
  inc var1
  inc noi
  
  mov ah,2
  mov dl,10
  int 21h
  
  mov ah,2
  mov dl,13
  int 21h
  
  mov cx,bx
  loop Label1   
  
  mov ax,4ch
  int 21h
  main endp
end main