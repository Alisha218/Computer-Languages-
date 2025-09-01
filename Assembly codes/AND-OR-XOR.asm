print macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
    
endm
newline macro
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
endm
.model small
.stack 100h
.data
  a db 1001b
  b db 0110b
  msg1 db 'Calculation after and instruction is: $'
  msg2 db 'Calculation after or instruction is:  $'
  msg3 db 'calculation after xor instruction is: $'  
  
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    print msg1
    
    mov bl,a
    mov cl,b
    and bl,cl
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
     
    newline        
    print msg2
    mov bl,a
    mov cl,b
    or bl,cl
    mov dl,bl
    add dl,48  
    sub dl,bl
    mov ah,2
    int 21h 
    
    newline
    print msg3
    mov bl,a
    mov cl,b
    xor bl,cl
    mov dl,bl 
    add dl,48 
    sub dl,bl
    mov ah,2
    int 21h
    
    mov ax,4ch
    int 21h
    
    main endp
end main
    