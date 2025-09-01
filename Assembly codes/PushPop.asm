
.model small
.stack 100h  
.data
  var1 db '2'
  var2 db '3'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dl,var1
    mov ah,2
    int 21h
    
    mov dl,var2
    mov ah,2
    int 21h  
    
    mov al,var1
    push ax
    
    mov al,var2
    push ax
    
    pop ax
    mov var1,al
    
    pop ax
    mov var2,al
    
    mov dl,var1
    mov ah,2
    int 21h
    
    mov dl,var2
    mov ah,2
    int 21h  
    
    mov ax,4ch
    int 21h
    main endp
end main
    