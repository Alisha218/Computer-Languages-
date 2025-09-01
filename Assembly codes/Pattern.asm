 .model small
.stack 100h
.data
   p1 db 49,48,'$'
   
.code 
main proc
  mov ax,@data
  mov ds,ax
   ;10,9,8----1
  mov ah,9
  lea dx,p1
  int 21h
  
  mov cx,9
  mov dx,57
  
l1:
 mov ah,2
 int 21h
 
 dec dx
  
 loop l1
  ;10,8,6
 call newline

 
 mov ah,9
  lea dx,p1
  int 21h
  
  mov cx,4
  mov dx,56
l2:
   mov ah,2
   int 21h
   sub dx,2
   loop l2 
   
   ;105
   call newline

l3: 
   mov ah,9
  lea dx,p1
  int 21h
  
  mov ah,2
  mov dl,'5'
  int 21h
 
  
      
    
  
 
exit:
 mov ax,4ch
 int 21h
 main endp
newline proc
    mov dl,10
    mov ah,2
    int 21h
     
    mov dl,13
    mov ah,2
    int 21h
    ret
end main
