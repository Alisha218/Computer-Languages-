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
    
    mov al,c
    mov bl,d
    sub al,bl
    
    
    mov bl,b
    neg bl
    add bl,al
    
    mov a,bl
    mov dl,a
    add dl,48
    mov ah,2
    int 21h
    
    mov ax,4ch
    int 21h
    
    main endp
end main