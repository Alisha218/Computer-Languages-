
; Macros
newline macro 
    mov dl, 10        ;Macro for newline
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h    
endm

input macro
    mov ah, 1               ;Macro for input 
    int 21h
endm

print macro str               ;Macro for print 
    mov ah, 9
    lea dx, str
    int 21h
endm





.model small
.stack 100h
.data
    msg1 db '  Enter string Input: $'
    msg2 db '  Converted to lowercase: $'
    msg3 db '  Converted to uppercase: $'
    msg4 db '  Converted to togglecase: $'                                           ;Messgaes 
    msg5 db '  Your Count is: $'
    msg6 db '  Press Enter to run again or Esc to terminate the Program: $'  
    invalid db 'Invalid Option. Choose the correct key...... $' 
    Seperator db '|-----------------------------------| $'
    array db 50 dup('$')                     
    arrayLower db 50 dup('$')               
    arrayUpper db 50 dup('$')                  ;Arrays to store Strings
    arrayToggle db 50 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax          

    ; Main loop
main_loop:
   
    mov bl, 0           ; Character count                  ; Initializing  counters
    mov si, 0           ; Index for input array

    
    
    newline            
   
    print Seperator
     newline
    print msg1               ; Prompt for input

   
   
read_input:
    input                    
    cmp al, 13                ; Check for Enter key
    je process_input          
    cmp al, 27                ; Check for Esc key
    je terminate_program       
    cmp al, ' '               ; Ignore spaces
    je read_input             
    mov array[si], al         ; Store character in array
    inc bl                    ; Increment character count
    inc si                    ; Move to next index
    jmp read_input           

process_input:
    mov array[si], '$'       ; Null-terminate the string

    
    
    newline
    print Seperator
    
    ; Display character count
    newline                
    print msg5          
    mov dl, bl          
    add dl, '0'          ; Convert count to ASCII
    mov ah, 2           
    int 21h
    
    
    
     newline
     print Seperator
    
    
    newline               
    print msg2         
    mov si, 0          
lowercase_conversion:
    mov al, array[si]             
    cmp al, '$'                    
    je display_lowercase     
    cmp al, 'A'                         
    jl skip_lowercase_char                          ; Convert to lowercase
    cmp al, 'Z'                         
    jg skip_lowercase_char
    add al, 32                          
    mov arrayLower[si], al             
    jmp store_lowercase

skip_lowercase_char:
    mov arrayLower[si], al             

store_lowercase:
    inc si                              
    jmp lowercase_conversion          

display_lowercase:
    mov arrayLower[si], '$'       ; Null-terminate the lowercase string
    print arrayLower               

   
   
   
     newline
     print Seperator
   
    
    newline               
    print msg3         
    mov si, 0          
uppercase_conversion:
    mov al, arrayLower[si]             
    cmp al, '$'                         
    je display_uppercase     
    cmp al, 'a'                         
    jl skip_uppercase_char                          ; Convert to uppercase
    cmp al, 'z'                         
    jg skip_uppercase_char
    sub al, 32                          
    mov arrayUpper[si], al             
    jmp store_uppercase

skip_uppercase_char:
    mov arrayUpper[si], al             

store_uppercase:
    inc si                              
    jmp uppercase_conversion          

display_uppercase:
    mov arrayUpper[si], '$'       ; Null-terminate the uppercase string
    print arrayUpper               

   
   
   
   
   
   
   
    newline
    print Seperator
   
    newline               
    print msg4          
    mov si, 0           
togglecase_conversion:
    mov al, array[si]                   
    cmp al, '$'                         
    je display_togglecase                     
    cmp al, ' '                         
    je store_togglecase
    cmp al, 'A'                         
    jl check_lowercase                         ; Convert to toggle case
    cmp al, 'Z'                         
    jg check_lowercase
    add al, 32                          
    jmp store_togglecase

check_lowercase:
    cmp al, 'a'                         
    jl store_togglecase                   
cmp al, 'z'                         
jg store_togglecase                   
sub al, 32                          

store_togglecase:
    mov arrayToggle[si], al                   
    inc si                              
    jmp togglecase_conversion           

display_togglecase:        
    mov arrayToggle[si], '$'       ; Null-terminate the toggle case string
    print arrayToggle               

     
     
     
     
     newline
     print Seperator
     
exit_menu:      
    newline            
    print msg6      
    input           
    cmp al, 13      ; Check for Enter key
    je main_loop                                                  ; Ask user to run again or terminate
    cmp al, 27      ; Check for Esc key
    je terminate_program         
    newline
    print invalid
    newline
    jmp exit_menu   

terminate_program:
    mov ah, 4ch
    int 21h        

main endp