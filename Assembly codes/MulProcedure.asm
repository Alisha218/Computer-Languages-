;multplication of two number
.model small
.stack 100h
.data
     msg1 db 'After Multiplication: $'
.code
main proc
    mov ax,@data
    mov ds,ax   
    
    call Multipliaction 
    main endp
   

 
Multipliaction proc
    ;Multiplication
    
    mov al,2
    mov bl,5
    mul bl
    
    AAM  ;ascii adjust after multiplication
    
    mov ch,ah    ;store the higher Bcd digit in ch
    mov cl,al    ;store the lower Bcd digit in cl
    
    ;display the message
    lea dx, msg1
    mov ah,9
    int 21h
    
    ;display the higher Bcd digit
    mov dl,ch
    add dl,48
    mov ah,2
    int 21h
    
    ;display the higher Bcd digit
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
 Multipliaction endp