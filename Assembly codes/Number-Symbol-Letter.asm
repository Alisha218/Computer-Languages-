;code to tell if value is number,
print macro p1
   mov ah,9
   mov dx,offset p1
   int 21h
endm
.model small
.stack 100h
.data
  msg1 db 10,13,'Upper case letter$'
  msg2 db 10,13,'Lower case letter$'
  msg3 db 10,13,'Symbol$'
  msg4 db 10,13,'Number$'
  msg5 db 10,13,'Please enter (ANy number/symbol/Alphabet:):','$' 
.code
main proc
    mov ax,@data
    mov ds,ax
Start:
  print msg5
  mov ah,1
  int 21h  ;input
  
  cmp al,27
  je end1

;if al is less than ,its not a number  
  cmp al,48   ;jump if below
  jb symbol

;if al is between 48 and 57 ,itsjump to number   
  cmp al,57    ;jump if below or equal
  jbe number
  
  cmp al,65
  jb symbol
  
  cmp al,90
  jbe upper
  
  cmp al,97
  jb symbol 
  
  cmp al,122
  jbe lower
  
  cmp al,255
  jbe symbol
  
lower:
 print msg2
 jmp Start
 
upper:
  print msg1
  jmp Start 
  
number:
 print msg4
 jmp Start

symbol:
 print msg3
 jmp start

end1:
 mov ax,4ch
 int 21h
 
 main endp
end main
  