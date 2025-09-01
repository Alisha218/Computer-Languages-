.model small
.stack 100h
.data
  msg1 db 'Hello$'
  msg2 db 'World$'
  newline db 10,13,'$'

.code
print macro message
    mov ah,09
    lea dx,message
    int 21h
endm

main proc
    mov ax,@data
    mov ds,ax
    
    print msg1
    print newline 
    print msg2
    
    mov ah,4ch
    int 21h
    main endp
end main