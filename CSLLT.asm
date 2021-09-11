.model large
.stack 100h
.data

;TITLE SCREEN 

title1 db 10,13,"***** ELRIC'S FOOD COURT, WELCOME *****$" 
title7 db 10,13,"1. New Order$"
title2 db 10,13,"2. Order$"
title3 db 10,13,"3. Payment$"
title4 db 10,13,"4. Inventory$"
title5 db 10,13,"5. Exit$"
title6 db 10,13,"Enter option: $"

;ORDER SCREEN
      
order1  db 10,13,"***** MENU *****$"
order2  db 10,13,"1. RICE            RM 2$"
order3  db 10,13,"2. CHICKEN CURRY   RM 5$"
order4  db 10,13,"3. MIX VEGITABLE   RM 5$"
order5  db 10,13,"4. FRIED RICE      RM 8$"
order6  db 10,13,"5. FRIED CHICKEN   RM 8$"
order7  db 10,13,"6. PEPSI           RM 3$"
order8  db 10,13,"7. 100 PLUS        RM 2$"
order9  db 10,13,"8. BACK$"
order10 db 10,13,"Enter option: $"
      
;PAYMENT SCREEN

pay1      db 10,13,"**** BILLING *****$"
pay2      db 10,13,"Your total bill is:RM$" 
pay3      db 10,13,"Pay here:RM$"
remaining db 10,13,"Remaining RM:$"
    
;INVENTORY SCREEN

inv     db 10,13,"***** INVENTORY *****$"
item1   db 10,13,"1. RICE - $ "
item2   db 10,13,"2. CHICKEN CURRY - $"
item3   db 10,13,"3. MIX VEGITABLE - $"
item4   db 10,13,"4. FRIED RICE - $"
item5   db 10,13,"5. FRIED CHICKEN - $"
item6   db 10,13,"6. PEPSI - $"
item7   db 10,13,"7. 100 PLUS - $"

;INVENTORY ITEM QUANTITY

foodRice          db 9
foodChickenCurry  db 9
foodMixVeg        db 9
foodFriedRice     db 9
foodFriedChicken  db 9
drinkPepsi        db 9
drink100Plus      db 9

;MISCELLANIOUS

bill   db ?  
space  db 10,13," $" 
inp    db 10,13,"Enter 1 to return: $"
error  db 10,13,"ERROR, enter 1 to return: $" 
ten    db 10 
temp   db 0
temp2  db 0 
temp3  db 0 
num1   db 0
num2   db 0 
num3   db 0
exmsg  db 10,13,"PROGRAM ENDED$"

;CODE

.code
main proc

    mov ax, @data
    mov ds, ax

Front:;TITLE SCREEN 
                                       
        mov ah, 00                     ;CLEAR SCREEN
        mov al, 02
        int 10h
                                       
        mov ah, 09h
        mov dx, offset title1          ;DISPLAY title1 MESSAGE
        int 21h
    
        mov ah, 09h                    
        mov dx, offset space           ;CREATE SPACE
        int 21h 
        
        mov ah, 09h                    ;DISPLAY title7 MESSAGE
        mov dx, offset title7
        int 21h  
    
        mov ah, 09h
        mov dx, offset title2          ;DISPLAY title2 MESSAGE
        int 21h 
    
        mov ah, 09h
        mov dx, offset title3          ;DISPLAY title3 MESSAGE
        int 21h 
    
        mov ah, 09h
        mov dx, offset title4          ;DISPLAY title4 MESSAGE
        int 21h 
    
        mov ah, 09h                  
        mov dx, offset title5          ;DISPLAY title5 MESSAGE
        int 21h    
    
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h  
    
        mov ah, 09h
        mov dx, offset title6          ;DISPLAY title6 MESSAGE
        int 21h 
    
        mov ah, 01h                    ;TAKE SINGLE DIGIT INPUT
        int 21h 
        
        cmp al, "1"                    ;IF INPUT = 1, JUMP TO newOrder
        je newOrder
        
        cmp al, "2"                    ;IF INPUT = 2, JUMP TO order
        je order
        
        cmp al, "3"                    ;IF INPUT = 3, JUMP TO payment
        je payment
        
        cmp al, "4"                    ;IF INPUT = 4, JUMP TO inventory
        je inventory
        
        cmp al, "5"                    ;IF INPUT = 5, JUMP TO exit
        je exit
      
Invalid:;ERROR MESSAGE

        mov ah, 00                     ;CLEAR SCREEN
        mov al, 02
        int 10h
        
        mov ah, 09h
        mov dx, offset error           ;DISPLAY error MESSAGE
        int 21h
        
        mov ah, 01h
        mov dl,al                      ;STALL PROGRAM USING INPUT FUNCTION AND WAIT FOR USER INPUT
        int 21h
        
        jmp Front                      ;JUMP TO Front
        
order:;NEW ORDER 

        mov ah, 00                     ;CLEAR SCREEN
        mov al, 02
        int 10h

        mov ah, 09h
        mov dx, offset order1          ;DISPLAY order1 MESSAGE
        int 21h   
        
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h 
        
        mov ah, 09h
        mov dx, offset order2          ;DISPLAY order2 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order3          ;DISPLAY order3 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order4          ;DISPLAY order4 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order5          ;DISPLAY order5 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order6          ;DISPLAY order6 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order7          ;DISPLAY order7 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order8          ;DISPLAY order8 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset order9          ;DISPLAY order9 MESSAGE
        int 21h   
        
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h 
        
        mov ah, 09h
        mov dx, offset order10         ;DISPLAY order10 MESSAGE
        int 21h   
        
        mov ah, 01h                    ;TAKE IN SINGLE DIGIT INPUT
        int 21h 
        
        cmp al, "1"                    ;IF INPUT = 1, JUMP TO o1
        je o1
        
        cmp al, "2"                    ;IF INPUT = 2, JUMP TO o2
        je o2
        
        cmp al, "3"                    ;IF INPUT = 3, JUMP TO o3
        je o3
        
        cmp al, "4"                    ;IF INPUT = 4, JUMP TO o4
        je o4
        
        cmp al, "5"                    ;IF INPUT = 5, JUMP TO o5
        je o5
        
        cmp al, "6"                    ;IF INPUT = 6, JUMP TO o6
        je o6
        
        cmp al, "7"                    ;IF INPUT = 7, JUMP TO o7
        je o7
        
        cmp al, "8"                    ;IF INPUT = 8    , JUMP TO Front
        je Front
        
        jmp Invalid                    ;JUMP TO Invalid
        
payment:;PAYMENT 

        mov ah, 00                     ;CLEAR SCREEN
        mov al, 02
        int 10h
        
        mov ah, 09h
        mov dx, offset pay1            ;DISPLAY pay1 MESSAGE
        int 21h
        
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h 
        
        mov ah, 09h
        mov dx, offset pay2            ;DISPLAY pay2 MESSAGE
        int 21h
        
        cmp bill, 9                    ;IF bill IS BIGGER THAN 9, JUMP TO p1
        ja p1
                
        mov al, bill                   ;MOVE bill VALUE TO al REGISTER, MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN al REGISTER TO CHARACTER,
        mov dl, al                     ;DISPLAY CHARACTER USING ah REGISTER
        add al, 48
        mov ah, 02h
        int 21h 
        
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h
        
        mov ah, 09h
        mov dx, offset pay3            ;DISPLAY pay3 MESSAGE
        int 21h
        
        mov ah, 01h                    ;TAKE IN SINGLE DIGIT INPUT AND CHARACTER IS CONVERTED TO DECIMAL
        sub al, 48                    
        int 21h
        
        sub dl, al                     ;SUBTRACT VALUE IN dl REGISTER BY VALUE IN al REGISTER, SINGLE DIGIT PAYMENT CALCULATION
        
        mov ah, 09h
        mov dx, offset remaining       ;DISPLAY remaining MESSAGE
        int 21h
        
        add dl, 48                     ;CONVERT dl REGISTER DECIMAL TO CHARACTER AND DISPLAY
        mov ah, 02h
        int 21h
                
        mov ah, 09h
        mov dx, offset inp             ;DISPLAY inp MESSAGE
        int 21h 
                
        mov ah, 01h                    ;STALL PROGRAM USING INPUT FUNCTION AND WAIT FOR USER INPUT
        int 21h
                
        jmp Front                      ;JUMP TO Front
        
inventory:;INVENTORY

        mov ah, 00                     ;CLEAR SCREEN
        mov al, 02
        int 10h
        
        mov ah, 09h
        mov dx, offset inv             ;DISPLAY inv MESSGAE
        int 21h
        
        mov ah, 09h
        mov dx, offset item1           ;DISPLAY item1 MESSAGE
        int 21h  
        
        mov al, foodRice               ;MOVE foodRice TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h 
        
        mov ah, 09h
        mov dx, offset item2           ;DISPLAY item2 MESSAGE
        int 21h
        
        mov al, foodChickenCurry       ;MOVE foodChickenCurry TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h 
        
        mov ah, 09h
        mov dx, offset item3           ;DISPLAY item3 MESSAGE
        int 21h
        
        mov al, foodMixVeg             ;MOVE foodMixVeg TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov ah, 09h
        mov dx, offset item4           ;DISPLAY item4 MESSAGE
        int 21h
        
        mov al, foodFriedRice          ;MOVE foodFriedRice TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov ah, 09h
        mov dx, offset item5           ;DISPLAY item5 MESSAGE
        int 21h
        
        mov al, foodFriedChicken       ;MOVE foodFriedChicken TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov ah, 09h
        mov dx, offset item6           ;DISPLAY item6 MESSAGE
        int 21h
        
        mov al, drinkPepsi             ;MOVE drinkPepsi TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov ah, 09h
        mov dx, offset item7           ;DISPLAY item7 MESSAGE
        int 21h
        
        mov al, drink100Plus           ;MOVE drinkPepsi TO al REGISTER, MOVE 00 TO ah REGISTER, MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp2,
        mov ah, 00                     ;MOVE al TO dl REGISTER, CONVERT DECIMAL VALUE IN dl TO CHARACTER, DISPLAY THE CHARACTER
        mov dl, ah
        mov temp2, dl 
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h 
        
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h
        
        mov ah, 09h
        mov dx, offset inp             ;DISPLAY inp MESSAGE
        int 21h 
        
        mov ah, 01h                    ;STALL PROGRAM USING INPUT FUNCTION AND WAIT FOR USER INPUT
        int 21h
        
        jmp Front                      ;JUMP TO Front
        
newORder: 
        mov bill, 0                    ;MAKING VALUE OF BILL TO 0
        jmp order                      ;JUMP TO order
          
o1:
        add bill, 2                    ;ADD 2 TO bill
        sub foodRice, 1                ;SUBTRACT 1 FROM foodRice
        jmp order                      ;JUMP TO order
        
o2:
        add bill, 5                    ;ADD 5 TO bill
        sub foodChickenCurry, 1        ;SUBTRACT 1 FROM foodChickenCurry
        jmp order                      ;JUMP TO order
        
o3:
        add bill, 5                    ;ADD 5 TO bill
        sub foodMixVeg, 1              ;SUBTRACT 1 FROM foodMixVeg
        jmp order                      ;JUMP TO order
        
o4:
        add bill, 8                    ;ADD 8 TO bill
        sub foodFriedRice, 1           ;SUBTRACT 1 FROM foodFriedRice
        jmp order                      ;JUMP TO order
        
o5:
        add bill, 8                    ;ADD 8 TO bill
        sub foodFriedChicken, 1        ;SUBTRACT 1 FROM foodFriedChicken
        jmp order                      ;JUMP TO order
        
o6:
        add bill, 3                    ;ADD 3 TO bill
        sub drinkPepsi, 1              ;SUBTRACT 1 FROM drinkPepsi
        jmp order                      ;JUMP TO order
        
o7:
        add bill, 2                    ;ADD 3 TO bill
        sub drink100Plus, 1            ;SUBTRACT 1 FROM drink100Plus
        jmp order                      ;JUMP TO order
        
p1:
        mov al, bill                   ;DIVIDE VALUE IN bill BY ten
        mov ah, 00
        div ten
                                
        mov dl, ah                     ;MOVE ah TO dl REGISTER, MOVE dl REGISTER TO temp
        mov temp, dl
               
        mov dl, al                     ;MOVE al TO dl REGISTER, CONVERT VALUE IN dl REGISTER TO CHARACTER, DISPLAY THE CHARACTER
        add dl, 48
        mov ah, 02h
        int 21h
                
        mov dl, temp                   ;MOVE temp TO dl REGISTER, CONVERT VALUE IN dl REGISTER TO CHARACTER, DISPLAY THE CHARACTER
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov ah, 09h
        mov dx, offset pay3            ;DISPLAY pay3 MESSAGE
        int 21h
        
        mov ah, 01h                    ;TAKE IN INPUT CHARACTER, CONVERT CHARACTER TO DECIMAL, MOVE al REGISTER TO num1
        int 21h
        sub al, 48
        mov num1, al
        
        mov ah, 01h                    ;TAKE IN INPUT CHARACTER, CONVERT CHARACTER TO DECIMAL, MOVE al REGISTER TO num2
        int 21h
        sub al, 48
        mov num2, al 
           
        mov al, num1                   ;MULTIPLY num1 BY ten, ADD num2 WITH al REGISTER
        mul ten
        add al, num2
        
        mov num3, al                   ;MOVE al REGISTER TO num3
        
        mov al, bill                   ;MOVE bill TO al REGISTER, SUBTRACT al REGISTER WITH num3, MOVE al REGISTER TO bill, DOUBLE DIGIT CALCULATION
        sub al, num3
        mov bill, al
        
        mov ah, 09h
        mov dx, offset remaining       ;DISPLAY remaining MESSAGE
        int 21h
        
        mov al, bill                   ;MOVE bill TO al REGISTER, CONVERT DECIMAL VALUE IN al REGISTER TO CHARACTER, DISPLAY CHARACTER
        add al, 48
        mov ah, 02h
        int 21h   
                
        mov ah, 09h
        mov dx, offset space           ;CREATE SPACE
        int 21h
                
        mov ah, 09h
        mov dx, offset inp             ;DISPLAY inp MESSAGE
        int 21h 
                
        mov ah, 01h                    ;STALL PROGRAM USING INPUT FUNCTION AND WAIT FOR USER INPUT
        int 21h
                
        jmp Front                      ;JUMP TO Front
        
exit:   
        mov ah, 00                     ;CLEAR SCREEN
        mov al, 02
        int 10h
        
        mov ah, 09h
        mov dx, offset exmsg           ;DISPLAY exmsg MESSAGE
        int 21h
        
        mov ah, 4ch                    ;END PROGRAM
        int 21h
    
main endp
end main