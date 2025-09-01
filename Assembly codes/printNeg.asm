.model small
.stack 100h
.data 
  a db ?
  b db 2
  c db 10
  d db 2
  
  
  
.code
main proc
    mov ax,@data
    mov ds,ax
             
    mov bl,c
    mov al,d
    sub bl,al
    
      
    mov al,b
    neg al
    add al,bl
     
    mov ah,0
    mov bl,2 
    neg bl

    idiv bl
    mov a,al
    cmp al,0
    jl print_negative
    jmp exit
print_negative:
 mov dl,'-'
 mov ah,2
 int 21h
  
 mov bl,a
 neg bl
 
 
 exit:
 mov dl,bl
 add dl,48
 mov ah,2
 int 21h
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main