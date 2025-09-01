
.model small
.stack 500h
.data  
   ;player cell mark
   pc1 db 'X$'
   pc2 db 'O$'
   
   ;cell marks
   c1 db '1$'
   c2 db '2$'
   c3 db '3$'
   c4 db '4$'
   c5 db '5$'
   c6 db '6$'
   c7 db '7$'
   c8 db '8$'
   c9 db '9$' 
   
   ;player no.,moves and check flags if the game is won or not
   player db 50,'$'
   moves db 0 
   done db 0
   dr db 0
   
   
   ;string
   pak db 'Press any key to continue...$'
   
   ;board lines 
   l1 db '|  |$'
   l2 db '-------$'
   n1 db ' |$ ' 
   
   ;input prompts
   inp db 32,' Enter cell no: $'
   tkn db 'this cell is taken! Please any key...$'
   
   ;current marks
   curr db 88
   
   ;final mesage 
   w1 db 'Player $'
   w2 db 'won the match $'
   drw db 'This game is draw $'
   
   ;try again
   tryA db 'want to play again?(y/n): $'
   wrongI db 32,32,32,'Wrong input! Press any key... $'
   
   ;this line is used to overwrite a line to clean the area
   emp db '                                            $'
   
   
      
.code 
macro print message
    mov ah,09h
    lea dx, message
    int 21h
endm
main proc
    mov ax,@data
    mov ds,ax
    
;------intialize variable------
Init:
   mov player ,50
   mov moves, 0 
   mov done, 0
   mov dr, 0 
   
   mov c1,49
   mov c2,50
   mov c3,51
   mov c4,52
   mov c5,53
   mov c6,54
   mov c7,55
   mov c8,56
   mov c9,57
   
   jmp PlayerChange
   
;---------- intialize end-----------
    
    ;victory
Victory:

    print w1
    
    print player
    
    print w2
    
    
    ;set cursor
    mov ah,2
    mov dh,17
    mov dl,28
    int 10h 
    
    print pak 
    
    mov ah,7
    int 21h
    
    jmp Tryagain
    
    
    
    ;draw
    
Draw:  
   print drw
   
   ;set cursor
   mov ah,2
   mov dh,17
   mov dl,28
   int 10h
   
   print pak
   
   mov ah,7
   int 21h
   
   jmp Tryagain
   
   
   ; check if winning condition is met
   
Check: ; there are 8 possible condition

   check1:;checkinh 1,2,3
      
      mov al,c1
      mov bl,c2
      mov cl,c3
      
      cmp al,bl
      jnz check2 
      
      cmp bl,cl
      jnz check2
      
      mov Done,1
      jmp Board
      
      
   check2: ;checking 4,5,6
   
      mov al,c4
      mov bl,c5
      mov cl,c6
      
      cmp al,bl
      jnz check3
      
      cmp bl,cl
      jnz check3
      
      mov Done,1
      jmp Board
      
   check3: ;checking 7,8,9
       mov al,c7
       mov bl,c8
       mov cl,c9
       
       cmp al,bl
       jnz check4
       
       cmp bl,cl
       jnz check4
       
       mov done,1
       jmp Board
       
       
   check4:  ;checking 1,4,7
      mov al,c1
      mov bl,c4
      mov cl,c7
      
      cmp al,bl
      jnz check5
      
      cmp bl,cl
      jnz check5
      
      mov done,1
      jmp Board
      
   check5: ;checking 2,5,8
      mov al,c2
      mov bl,c5
      mov cl,c8
      
      cmp al,bl
      jnz check6
      
      cmp bl,cl
      jnz check6
      
      mov done,1
      jmp Board
      
    check6: ;checking 3,6,9
      mov al,c3
      mov bl,c6
      mov cl,c9
      
      cmp al,bl
      jnz check7
      
      cmp bl,cl
      jnz check7
      
      mov done,1
      jmp Board 
      
    check7: ;checking 1,5,9
      mov al,c1
      mov bl,c5
      mov cl,c9
      
      cmp al,bl
      jnz check8
      
      cmp bl,cl
      jnz check8
      
      mov done,1
      jmp Board 
      
      
    check8: ;checking 3,5,7
      mov al,c3
      mov bl,c5
      mov cl,c7
      
      cmp al,bl
      jnz DrawCheck
      
      cmp bl,cl
      jnz DrawCheck
      
      mov done,1
      jmp Board
      
    DrawCheck:
      mov al,Moves
      cmp al,9
      jb PlayerChange
      
      mov dr,1
      jmp Board
      
      jmp Exit
      

PlayerChange:
     
     cmp Player,49
     jz P2
     cmp Player,50
     jz P1
     
     
     P1:
      mov Player,49
      mov curr,88
      
      jmp Board
      
      
     P2:
      mov Player,50
      mov curr,79
      jmp Board 
      
Board:

    ;clear screen
    mov ax,0600h
    mov bh,07h
    mov cx,0000h
    mov dx,184fh
    int 10h
    
    ;set cursor
    mov ah,2
    mov bh,0
    mov dh,0
    mov dl,30
    int 10h
    
    print l1
    
    ;set cursor
    mov ah,2
    mov dh,7
    mov dl,30
    int 10h
    
    mov ah,2
    mov dl,32
    int 21h
    
;---------------------
   ;cell 1
   
   print c1
      
   print n1
   
   ;cell 2
    
   print c2
   
   print n1
   
   ;cell 3  
   
   print c3
   
;--------------------
   ;set cursor
   mov ah,2
   mov dh,8
   mov dl,30
   int 10h
  
   print l2  
  
   ;set cursor
   mov ah,2
   mov dh,9
   mov dl,30
   int 10h
  
   print l1
   
   ;set cursor
   mov ah,2
   mov dh,10
   mov dl,30 
   int 10h
   
   mov dl,32
   mov ah,02
   int 21h
   
;-----------------------
    ;cell 4
    print c4
    
    print n1
    
    ;cell 5
    print c5
    
    print n1  
    
    ;cell 6
    
    print c6
    
;------------------------ 
   ;set cursor
   mov ah,2
   mov dh,11
   mov dl,30
   int 10h
   
   print l1
   
   ;set cursor
   mov ah,2
   mov dh,12
   mov dl,30
   int 10h
   
   print l2
   
   ;set cursor
   mov ah,2
   mov dh,13
   mov dl,30
   int 10h
   
   print l1
   
   ;set cursor
   mov ah,2
   mov dh,14
   mov dl,30
   int 10h 
   
   mov dl,32
   mov ah,02
   int 21h
   
;------------------------
   
   ;cell 7 
   print c7
   
   print n1    
   
   ;cell8
   print c8
   
   print n1
   
   ;cell 9
   print c9
   
   print n1 
   
;-------------------------
   
   ;set cursor
   mov ah,2
   mov dh,15
   mov dl,30
   int 10h
   
   print l1 
   
   ;set cursor
   
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h
   
   cmp done,1
   jz Victory
   
   cmp dr,1
   jz Draw 
   
;---------------end of board---------


;------------------ input -----------------

Input:
  print w1
  
  mov ah,2
  mov dl,player
  int 21h
  
  cmp player,49
  jz Pl1
  
  print pc2
  jmp TakeInput
  
  
   Pl1:
    print pc1
    
 TakeInput:
  print inp
  
  mov ah,1
  int 21h 
  
  
  inc moves ;increment moves counter by 1
  
  mov bl,al
  sub bl,48
  
  mov cl,curr
  
  ;checking if input is between 1-9
   
   cmp bl,1
   jz C1u
    
   cmp bl,2
   jz C2u
   
   cmp bl,3
   jz C3u
   
   cmp bl,4
   jz C4u
   
   cmp bl,5
   jz C5u
   
   cmp bl,6
   jz C6u
   
   cmp bl,7
   jz C7u
   
   cmp bl,8
   jz C8u
   
   cmp bl,9
   jz C9u
   
   ;------------------------
   
   ;if input is invalid
   
   dec moves;decrementing moves by 1,since it was invalid
   
   ;set cursor
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h
   
   print wrongI ;wrong input message
   
   mov ah,7   ;input without echo
   int 21h
   
   ;set cursor
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h 
   
   print emp
  
   ;set cursor
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h 
   
   jmp Input  
   
 Taken:
  dec moves
   
   ;set cursor
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h
   
   print tkn  
   
   mov ah,7
   int 21h 
   
   ;set cursor
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h
   
   print emp
   
   ;set cursor
   mov ah,2
   mov dh,16
   mov dl,20
   int 10h
   
   jmp Input
   
   ;Adjust
   
   ;setting board position as input mark
    C1u:
    cmp c1,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c1,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c1,cl
    jmp Check
    
    C2u:
    cmp c2,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c2,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c2,cl
    jmp Check
    
    C3u:
    cmp c3,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c3,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c3,cl
    jmp Check
    
    C4u:
    cmp c4,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c4,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c4,cl
    jmp Check
    
    C5u:
    cmp c5,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c5,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c5,cl
    jmp Check
    
    C6u:
    cmp c6,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c6,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c6,cl
    jmp Check
    
    C7u:
    cmp c7,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c7,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c7,cl
    jmp Check
    
    C8u:
    cmp c8,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c8,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c8,cl
    jmp Check
    
    C9u:
    cmp c9,88 ;checking if the cell is already 'X'
    jz Taken
    cmp c9,79 ;checking if the cell is already 'O'
    jz Taken
    
    mov c9,cl
    jmp Check 
    
;--------------------------------

;------------try again-----------

TryAgain:
    ;Clear Screen  
    
    mov ax,0600h
    mov bh,07h
    mov cx,0000h
    mov dx,184fh
    int 10h
    
    ;set cursor
    mov ah,2
    mov bh,0
    mov dh,10
    mov dl,24
    int 10h
    
    print tryA
    
    mov ah,1
    int 21h
    
    ;if input is 'y'/'Y' then repaet the game
    cmp al,121
    jz Init
    
    cmp al,89
    jz Init
    
    
    ;if input is 'n'/'N' then repaet the game
    cmp al,110 ;check if input is 'n' 
    jz Exit
    cmp al,78 ;check if input is 'N'
    jz Exit
    
    ;If input is invalid     
    
    ;set cursor
    mov ah,2
    mov bh,0
    mov dh,10
    mov dl,24
    int 10h 
    
    print wrongI
    
    mov ah,7
    int 21h
    
    ;set cursor
    mov ah,2
    mov bh,0
    mov dh,10
    mov dl,24
    int 10h
    
    print Emp
    
    Jmp TryAgain
    
;---------------- end of input--------------
    
Exit:
  mov ax,4ch
  int 21h
  main endp
    
end main  
    
  
   
   
  
  
   
   
   
   
   
   
   
  
    
    
   
   
  
   
   
   

    
    
   