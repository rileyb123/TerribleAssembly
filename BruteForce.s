.globl main 
.globl iMain
.globl main2
.globl dec
.globl read     
.globl read1
.globl read2
.globl read3
.globl read4
.globl read5
.globl read6
.globl adOne
.globl adChange
.globl sort



.data
    .space 40
    Prompt: .asciiz "Enter a Five decimal number:" #Null terminated 

.text

main:
    jal dec
    add $t7 , $0 , $0
    addi $t7 , $0 , 6
    beq $v1,  $t7 , sort    # Branches to done and ends program once 5 decimal values are entered
    add $0 , $0 , $0       # NO OP
    add $t6 , $0 , $0
    addi $t6 , $0 , 1
    beq $t6 , $v1 , adOne
    add $0 , $0 , $0

iMain:
    slt  $t5 , $t6 , $v1
    bne $t5 , $0 , adChange
    add $0 , $0 , $0

main2:
    add $s2 , $0 , $0
    add $s2 , $s1 , $s2
    lui $a0 , 0x1000       # load address of prompt into a0 ( 0x10000040 )
    addi $a0 , $a0 , 40
    addi $v0 ,$0, 4        # Put 4 into $v0 for syscall for prompt
    syscall                # Display prompt 
    addi $v0 , $0 , 8      # Get five decimal number from user
    lui $a0 , 0x1000       # Create Garbage Address for holding entered values (0x10000088)
    addi $a0 , $a0 , 136   
    addi $a1 , $0 , 9      # Number of characters to be read
    syscall                # Get Decimal number
    
#####READS ARE FOR EACH POSSIBLE PART OF ENTERED NUMBER UP TO WORST CASE +##,### 
read: 	 

    addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , read1     # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , read1        # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    addi $s2 , $s2 , 1

read1:
    addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , read2        # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , read2       # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    addi $s2 , $s2 , 1

read2:
     addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , read3        # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , read3        # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    addi $s2 , $s2 , 1
read3:
      addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , read4         # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , read4        # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    addi $s2 , $s2 , 1

read4:
      addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , read5         # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , read5        # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    addi $s2 , $s2 , 1

read5:
     addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , read6         # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , read6        # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    addi $s2 , $s2 , 1

read6:
    addi $t3 , $0 , 43            # Store value for + in t3
    lb $t1, 0($a0) 
    addi $a0 , $a0 , 1
    beq $t3 , $t1 , main         # Skip storing if value is a +
    add $0 , $0 ,$0
    addi $t3 ,$0 , 44
    beq $t3 , $t1 , main        # skip storing if value is ,
    add $0 , $0 ,$0
    addi $t3 , $0 , 10
    beq $t3 , $t1 , main       # Skip storing if Value is a Cariage Value(new line)
    add $0,$0,$0
    sb $t1 , 0($s2)  
    j main 
    add $0 , $0 , $0
 dec:
    addi $v1 , $v1 , 1      # v1 will be count for the 5 decimal numbers
    jr $ra
    add $0 , $0, $0

 adChange:                  # Increases adress of $s1 by 8 for different numbers entered
    addi $s1 , $s1 , 8
    j main2
    add $0 , $0 , $0

 adOne:                     #Loads first starting adress into s1 (0x10000000)
    lui $s1 , 0x1000
    j iMain
    add $0 , $0 , $0
    
######################################################################
 sort:
 	lui $t8 , 0x1000		#T8 FOR STRING ADRESSES
 	lui $t6, 0x1000          	#t6 will hold garbage adresses for storing
 	addi $t6 , $t6 , 160		#### T1 - T5 will hold number of digits in string 6 means its a negative 
 	add $t1 , $0 , $0		### ALSO SETS T1-T5 TO 0 FOR COUNTING NUMBER OF NUMBERS IN STRING
 	add $t2 , $0 , $0
 	add $t3 , $0 , $0
 	add $t4 , $0 , $0
 	add $t5 , $0 , $0
 	 	
 	data1:		
 		add $t7 , $0 , $0		#LOADS DATA INTO TEMPORARY GARBAGE ADRESSES    # T7 will hold bytes for checking if end of string reached
 		add $0 , $0 , $0
 		lb $t7 , 0($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb1
 		add $0 , $0 , $0
 		sb $t7 , 0($t6)
 		addi $t1 , $t1 , 1
 		
 		lb $t7 , 1($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb1
 		add $0 , $0 , $0
 		sb $t7 , 1($t6)
 		addi $t1 , $t1 , 1
 		
 		lb $t7 , 2($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb1
 		add $0 , $0 , $0
 		sb $t7 , 2($t6)
 		addi $t1 , $t1 , 1
 		
 		lb $t7 , 3($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb1
 		add $0 , $0 , $0
 		sb $t7 , 3($t6)
 		addi $t1 , $t1 , 1
 		
 		lb $t7 , 4($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb1
 		add $0 , $0 , $0
 		sb $t7 , 4($t6)
 		addi $t1 , $t1 , 1
 		
 		lb $t7 , 5($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb1
 		add $0 , $0 , $0
 		sb $t7 , 5($t6)
 		addi $t1 , $t1 , 1
 	data2:
 		add $t7 , $0 , $0		#LOADS DATA INTO TEMPORARY GARBAGE ADRESSES    # T7 will hold bytes for checking if end of string reached
 		add $0 , $0 , $0
 		lb $t7 , 0($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb2
 		add $0 , $0 , $0
 		sb $t7 , 0($t6)
 		addi $t2 , $t2 , 1
 		
 		lb $t7 , 1($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb2
 		add $0 , $0 , $0
 		sb $t7 , 1($t6)
 		addi $t2 , $t2 , 1
 		
 		lb $t7 , 2($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb2
 		add $0 , $0 , $0
 		sb $t7 , 2($t6)
 		addi $t2 , $t2 , 1
 		
 		lb $t7 , 3($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb2
 		add $0 , $0 , $0
 		sb $t7 , 3($t6)
 		addi $t2 , $t2 , 1
 		
 		lb $t7 , 4($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb2
 		add $0 , $0 , $0
 		sb $t7 , 4($t6)
 		addi $t2 , $t2 , 1
 		
 		lb $t7 , 5($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb2
 		add $0 , $0 , $0
 		sb $t7 , 5($t6)
 		addi $t2 , $t2 , 1
 	data3:
 		add $t7 , $0 , $0		#LOADS DATA INTO TEMPORARY GARBAGE ADRESSES    # T7 will hold bytes for checking if end of string reached
 		add $0 , $0 , $0
 		lb $t7 , 0($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb3
 		add $0 , $0 , $0
 		sb $t7 , 0($t6)
 		addi $t3 , $t3 , 1
 		
 		lb $t7 , 1($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb3
 		add $0 , $0 , $0
 		sb $t7 , 1($t6)
 		addi $t3 , $t3 , 1
 		
 		lb $t7 , 2($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb3
 		add $0 , $0 , $0
 		sb $t7 , 2($t6)
 		addi $t3 , $t3 , 1
 		
 		lb $t7 , 3($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb3
 		add $0 , $0 , $0
 		sb $t7 , 3($t6)
 		addi $t3 , $t3 , 1
 		
 		lb $t7 , 4($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb3
 		add $0 , $0 , $0
 		sb $t7 , 4($t6)
 		addi $t3 , $t3 , 1
 		
 		lb $t7 , 5($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb3
 		add $0 , $0 , $0
 		sb $t7 , 5($t6)
 		addi $t3 , $t3 , 1
 	data4:
 		add $t7 , $0 , $0		#LOADS DATA INTO TEMPORARY GARBAGE ADRESSES    # T7 will hold bytes for checking if end of string reached
 		add $0 , $0 , $0
 		lb $t7 , 0($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb4
 		add $0 , $0 , $0
 		sb $t7 , 0($t6)
 		addi $t4 , $t4 , 1
 		
 		lb $t7 , 1($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb4
 		add $0 , $0 , $0
 		sb $t7 , 1($t6)
 		addi $t4 , $t4 , 1
 		
 		lb $t7 , 2($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb4
 		add $0 , $0 , $0
 		sb $t7 , 2($t6)
 		addi $t4 , $t4 , 1
 		
 		lb $t7 , 3($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb4
 		add $0 , $0 , $0
 		sb $t7 , 3($t6)
 		addi $t4 , $t4 , 1
 		
 		lb $t7 , 4($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb4
 		add $0 , $0 , $0
 		sb $t7 , 4($t6)
 		addi $t4 , $t4 , 1
 		
 		lb $t7 , 5($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rgarb4
 		add $0 , $0 , $0
 		sb $t7 , 5($t6)
 		addi $t4 , $t4 , 1
 	data5:	
 		add $t7 , $0 , $0		#LOADS DATA INTO TEMPORARY GARBAGE ADRESSES    # T7 will hold bytes for checking if end of string reached
 		add $0 , $0 , $0
 		lb $t7 , 0($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rsortstore
 		add $0 , $0 , $0
 		sb $t7 , 0($t6)
 		addi $t5 , $t5 , 1
 		
 		lb $t7 , 1($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rsortstore
 		add $0 , $0 , $0
 		sb $t7 , 1($t6)
 		addi $t5 , $t5 , 1
 		
 		lb $t7 , 2($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rsortstore
 		add $0 , $0 , $0
 		sb $t7 , 2($t6)
 		addi $t5 , $t5 , 1
 		
 		lb $t7 , 3($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rsortstore
 		add $0 , $0 , $0
 		sb $t7 , 3($t6)
 		addi $t5 , $t5 , 1
 		
 		lb $t7 , 4($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rsortstore
 		add $0 , $0 , $0
 		sb $t7 , 4($t6)
 		addi $t5 , $t5 , 1
 		
 		lb $t7 , 5($t8)
 		add $0 , $0 , $0
 		beq $t7 ,$0 , rsortstore
 		add $0 , $0 , $0
 		sb $t7 , 5($t6)
 		addi $t5 , $t5 , 1
 		j rsortstore
 		add $0,$0,$0
 #######################################################################################		
 	rgarb1: 
 		addi $t8 , $t8 , 8
 		addi $t6 , $t6 , 8
 		j data2
 		add $0 , $0 , $0
 	rgarb2: 
 		addi $t8 , $t8 , 8
 		addi $t6 , $t6 , 8
 		j data3
 		add $0 , $0 , $0
 	rgarb3: 
 		addi $t8 , $t8 , 8
 		addi $t6 , $t6 , 8
 		j data4
 		add $0 , $0 , $0
 	rgarb4: 
 		addi $t8 , $t8 , 8
 		addi $t6 , $t6 , 8
 		j data5
 		add $0 , $0 , $0
############################################################################################
 	rsortstore:
 		add $t8 , $0 , $0
 		addi $t8 , $t8, 45
 		add $t9 , $t9 , $0
 		addi $t9 , $t9, 1
 		lui $s1 , 0x1000
 		addi $s1 , $s1 , 160		### LOAD ADRESSES OF OF TEMP MEMORY FOR STRINGS TO USE FOR COMPARISONS ###
		lui $s2 , 0x1000
 		addi $s2 , $s2 , 168
 		lui $s3 , 0x1000		#     $s6 will be value we are currently sorting, s7 will be the compared to value
 		addi $s3 , $s3 , 176
 		lui $s4 , 0x1000
 		addi $s4 , $s4 , 184
 		lui $s5 , 0x1000
 		addi $s5 , $s5 , 192 
 		
 	
 		rsort12:
 			beq $t1, $t2 , equalt12
 			add $0 , $0 , $0
 			j neqt12
 			add $0 , $0 , $0
 		rsort13:
 			beq $t1, $t3 , equalt13
 			add $0 , $0 , $0
 			j neqt13
 			add $0 , $0 , $0
 		rsort14:
 			beq $t1, $t4 , equalt14
 			add $0 , $0 , $0
 			j neqt14
 			add $0 , $0 , $0
 		rsort15:
 			beq $t1, $t5 , equalt15
 			add $0 , $0 , $0
 			j neqt15
 			add $0 , $0 , $0
 		rsort23:
 			beq $t2, $t3 , equalt23
 			add $0 , $0 , $0
 			j neqt23
 			add $0 , $0 , $0
 		rsort24:
 			beq $t2, $t4 , equalt24
 			add $0 , $0 , $0
 			j neqt24
 			add $0 , $0 , $0
 		rsort25:
 			beq $t2, $t5 , equalt25
 			add $0 , $0 , $0
 			j neqt25
 			add $0 , $0 , $0
 		rsort34:
 			beq $t3, $t4 , equalt34
 			add $0 , $0 , $0
 			j neqt34
 			add $0 , $0 , $0
 		rsort35:
 			beq $t3, $t5 , equalt35
 			add $0 , $0 , $0
 			j neqt35
 			add $0 , $0 , $0
 		rsort45:
 			beq $t4, $t5 , equalt45
 			add $0 , $0 , $0
 			j neqt45
 			add $0 , $0 , $0
 		
 ##############################################################################################
 ######     SECTION FOR WHEN T VALUES ARE EQUAL ITERATE REGULAR UNTIL FIND PART THATS GREATER/THE NUMBERS ARE EQUAL   ########
 	equalt12:
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s2)
 		beq $s6 , $t8 , sc12		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt12pos
 		add $0 , $0 , $0
 		equalt12neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s2)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort13
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap12
 			add $0 , $0, $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s2)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort13
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap12
 			add $0 , $0, $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s2)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort13
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap12
 			add $0 , $0, $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s2)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort13
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap12
 			add $0 , $0, $0
 			lb $s6 , 5($s1)
 			lb $s7 , 5($s2)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort13
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap12
 			add $0 , $0, $0
 			j rsort13
 			add $0 , $0 , $0
 			
 		equalt12pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort13			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap12
 			add $0 , $0 , $0
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s2)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort13			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap12
 			add $0 , $0 , $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s2)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort13			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap12
 			add $0 , $0 , $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s2)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort13			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap12
 			add $0 , $0 , $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s2)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort13			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap12
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort13
 			add $0 , $0 , $0 
 				
 	equalt13:
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s3)##
 		beq $s6 , $t8 , sc13##		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt13pos###
 		add $0 , $0 , $0
 		equalt13neg:		####	#BOTH NEGATIVE 
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s3)###
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort14
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap13
 			add $0 , $0, $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort14
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap13
 			add $0 , $0, $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort14
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap13
 			add $0 , $0, $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort14
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap13
 			add $0 , $0, $0
 			lb $s6 , 5($s1)
 			lb $s7 , 5($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort14
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap13
 			add $0 , $0, $0
 			j rsort14
 			add $0 , $0 , $0
 			
 		equalt13pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort14		#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap13
 			add $0 , $0 , $0
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort14			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap13
 			add $0 , $0 , $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort14			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap13
 			add $0 , $0 , $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort14			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap13
 			add $0 , $0 , $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort14			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap13
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort14
 			add $0 , $0 , $0 
 	equalt14:
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s4)
 		beq $s6 , $t8 , sc14		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt14pos
 		add $0 , $0 , $0
 		equalt14neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort15
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap14
 			add $0 , $0, $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort15
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap14
 			add $0 , $0, $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort15
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap14
 			add $0 , $0, $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort15
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap14
 			add $0 , $0, $0
 			lb $s6 , 5($s1)
 			lb $s7 , 5($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort15
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap14
 			add $0 , $0, $0
 			j rsort15
 			add $0 , $0 , $0
 			
 		equalt14pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort15			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap14
 			add $0 , $0 , $0
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort15			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap14
 			add $0 , $0 , $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort15			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap14
 			add $0 , $0 , $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort15			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap14
 			add $0 , $0 , $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort15			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap14
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort15
 			add $0 , $0 , $0 
 	equalt15:
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s5)
 		beq $s6 , $t8 , sc15		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt15pos
 		add $0 , $0 , $0
 		equalt15neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort23
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap15
 			add $0 , $0, $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort23
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap15
 			add $0 , $0, $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort23
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap15
 			add $0 , $0, $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort23
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap15
 			add $0 , $0, $0
 			lb $s6 , 5($s1)
 			lb $s7 , 5($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort23
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap15
 			add $0 , $0, $0
 			j rsort23
 			add $0 , $0 , $0
 			
 		equalt15pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort23			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap15
 			add $0 , $0 , $0
 			lb $s6 , 1($s1)
 			lb $s7 , 1($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort23			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap15
 			add $0 , $0 , $0
 			lb $s6 , 2($s1)
 			lb $s7 , 2($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort23			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap15
 			add $0 , $0 , $0
 			lb $s6 , 3($s1)
 			lb $s7 , 3($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort23			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap15
 			add $0 , $0 , $0
 			lb $s6 , 4($s1)
 			lb $s7 , 4($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort23			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap15
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort23
 			add $0 , $0 , $0 
 	equalt23:
 		lb $s6 , 0($s2)
 		lb $s7 , 0($s3)
 		beq $s6 , $t8 , sc23		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt23pos
 		add $0 , $0 , $0
 		equalt23neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s2)
 			lb $s7 , 1($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort24
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap23
 			add $0 , $0, $0
 			lb $s6 , 2($s2)
 			lb $s7 , 2($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort24
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap23
 			add $0 , $0, $0
 			lb $s6 , 3($s2)
 			lb $s7 , 3($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort24
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap23
 			add $0 , $0, $0
 			lb $s6 , 4($s2)
 			lb $s7 , 4($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort24
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap23
 			add $0 , $0, $0
 			lb $s6 , 5($s2)
 			lb $s7 , 5($s3)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort24
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap23
 			add $0 , $0, $0
 			j rsort24
 			add $0 , $0 , $0
 			
 		equalt23pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort24			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap23
 			add $0 , $0 , $0
 			lb $s6 , 1($s2)
 			lb $s7 , 1($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort24			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap23
 			add $0 , $0 , $0
 			lb $s6 , 2($s2)
 			lb $s7 , 2($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort24			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap23
 			add $0 , $0 , $0
 			lb $s6 , 3($s2)
 			lb $s7 , 3($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort24			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap23
 			add $0 , $0 , $0
 			lb $s6 , 4($s2)
 			lb $s7 , 4($s3)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort24			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap23
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort24
 			add $0 , $0 , $0 
 	equalt24:
 		lb $s6 , 0($s2)
 		lb $s7 , 0($s4)
 		beq $s6 , $t8 , sc24		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt24pos
 		add $0 , $0 , $0
 		equalt24neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s2)
 			lb $s7 , 1($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort25
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap24
 			add $0 , $0, $0
 			lb $s6 , 2($s2)
 			lb $s7 , 2($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort25
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap24
 			add $0 , $0, $0
 			lb $s6 , 3($s2)
 			lb $s7 , 3($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort25
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap24
 			add $0 , $0, $0
 			lb $s6 , 4($s2)
 			lb $s7 , 4($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort25
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap24
 			add $0 , $0, $0
 			lb $s6 , 5($s2)
 			lb $s7 , 5($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort25
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap24
 			add $0 , $0, $0
 			j rsort25
 			add $0 , $0 , $0
 			
 		equalt24pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort25			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap24
 			add $0 , $0 , $0
 			lb $s6 , 1($s2)
 			lb $s7 , 1($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort25			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap24
 			add $0 , $0 , $0
 			lb $s6 , 2($s2)
 			lb $s7 , 2($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort25			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap24
 			add $0 , $0 , $0
 			lb $s6 , 3($s2)
 			lb $s7 , 3($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort25			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap24
 			add $0 , $0 , $0
 			lb $s6 , 4($s2)
 			lb $s7 , 4($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort25			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap24
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort25
 			add $0 , $0 , $0 
 	equalt25:
 		lb $s6 , 0($s2)
 		lb $s7 , 0($s5)
 		beq $s6 , $t8 , sc25		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt25pos
 		add $0 , $0 , $0
 		equalt25neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s2)
 			lb $s7 , 1($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort34
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap25
 			add $0 , $0, $0
 			lb $s6 , 2($s2)
 			lb $s7 , 2($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort34
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap25
 			add $0 , $0, $0
 			lb $s6 , 3($s2)
 			lb $s7 , 3($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort34
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap25
 			add $0 , $0, $0
 			lb $s6 , 4($s2)
 			lb $s7 , 4($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort34
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap25
 			add $0 , $0, $0
 			lb $s6 , 5($s2)
 			lb $s7 , 5($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort34
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap25
 			add $0 , $0, $0
 			j rsort34
 			add $0 , $0 , $0
 			
 		equalt25pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort34			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap25
 			add $0 , $0 , $0
 			lb $s6 , 1($s2)
 			lb $s7 , 1($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort34			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap25
 			add $0 , $0 , $0
 			lb $s6 , 2($s2)
 			lb $s7 , 2($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort34			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap25
 			add $0 , $0 , $0
 			lb $s6 , 3($s2)
 			lb $s7 , 3($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort34			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap25
 			add $0 , $0 , $0
 			lb $s6 , 4($s2)
 			lb $s7 , 4($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort34			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap25
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort34
 			add $0 , $0 , $0 
 	equalt34:
 		lb $s6 , 0($s3)
 		lb $s7 , 0($s4)
 		beq $s6 , $t8 , sc34		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt34pos
 		add $0 , $0 , $0
 		equalt34neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s3)
 			lb $s7 , 1($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort35
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap34
 			add $0 , $0, $0
 			lb $s6 , 2($s3)
 			lb $s7 , 2($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort35
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap34
 			add $0 , $0, $0
 			lb $s6 , 3($s3)
 			lb $s7 , 3($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort35
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap34
 			add $0 , $0, $0
 			lb $s6 , 4($s3)
 			lb $s7 , 4($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort35
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap34
 			add $0 , $0, $0
 			lb $s6 , 5($s3)
 			lb $s7 , 5($s4)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort35
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap34
 			add $0 , $0, $0
 			j rsort34
 			add $0 , $0 , $0
 			
 		equalt34pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort35		#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap34
 			add $0 , $0 , $0
 			lb $s6 , 1($s3)
 			lb $s7 , 1($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort35		#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap34
 			add $0 , $0 , $0
 			lb $s6 , 2($s3)
 			lb $s7 , 2($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort35			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap34
 			add $0 , $0 , $0
 			lb $s6 , 3($s3)
 			lb $s7 , 3($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort35			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap34
 			add $0 , $0 , $0
 			lb $s6 , 4($s3)
 			lb $s7 , 4($s4)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort35			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap34
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort34
 			add $0 , $0 , $0 
 	equalt35:
 		lb $s6 , 0($s3)
 		lb $s7 , 0($s5)
 		beq $s6 , $t8 , sc35		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt35pos
 		add $0 , $0 , $0
 		equalt35neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s3)
 			lb $s7 , 1($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort45
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap35
 			add $0 , $0, $0
 			lb $s6 , 2($s3)
 			lb $s7 , 2($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort45
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap35
 			add $0 , $0, $0
 			lb $s6 , 3($s3)
 			lb $s7 , 3($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort45
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap35
 			add $0 , $0, $0
 			lb $s6 , 4($s3)
 			lb $s7 , 4($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort45
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap35
 			add $0 , $0, $0
 			lb $s6 , 5($s3)
 			lb $s7 , 5($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , rsort45
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap35
 			add $0 , $0, $0
 			j rsort45
 			add $0 , $0 , $0
 			
 		equalt35pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort45			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap35
 			add $0 , $0 , $0
 			lb $s6 , 1($s3)
 			lb $s7 , 1($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort45			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap35
 			add $0 , $0 , $0
 			lb $s6 , 2($s3)
 			lb $s7 , 2($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort45			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap35
 			add $0 , $0 , $0
 			lb $s6 , 3($s3)
 			lb $s7 , 3($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort45			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap35
 			add $0 , $0 , $0
 			lb $s6 , 4($s3)
 			lb $s7 , 4($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , rsort45			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap35
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j rsort45
 			add $0 , $0 , $0 
 	equalt45:
 		lb $s6 , 0($s4)
 		lb $s7 , 0($s5)
 		beq $s6 , $t8 , sc45		#CHECKS IF CURRENT BIGGEST VALUE IS NEGATIVE, t8 holds 2d
 		add $0 , $0 , $0
 		j equalt45pos
 		add $0 , $0 , $0
 		equalt45neg:			#BOTH NEGATIVE 
 			lb $s6 , 1($s4)
 			lb $s7 , 1($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , finalMove
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap45
 			add $0 , $0, $0
 			lb $s6 , 2($s4)
 			lb $s7 , 2($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , finalMove
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap45
 			add $0 , $0, $0
 			lb $s6 , 3($s4)
 			lb $s7 , 3($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , finalMove
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap45
 			add $0 , $0, $0
 			lb $s6 , 4($s4)
 			lb $s7 , 4($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , finalMove
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap45
 			add $0 , $0, $0
 			lb $s6 , 5($s4)
 			lb $s7 , 5($s5)
 			add $0 ,$0 , $0
 			slt $t7, $s6 ,$s7
 			beq $t7 , $t9 , finalMove
 			add $0 , $0 , $0
 			slt $t7, $s7 , $s6 
 			beq $t7 , $t9 , swap45
 			add $0 , $0, $0
 			j finalMove
 			add $0 , $0 , $0
 			
 		equalt45pos:
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , finalMove			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap45
 			add $0 , $0 , $0
 			lb $s6 , 1($s4)
 			lb $s7 , 1($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , finalMove			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap45
 			add $0 , $0 , $0
 			lb $s6 , 2($s4)
 			lb $s7 , 2($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , finalMove			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap45
 			add $0 , $0 , $0
 			lb $s6 , 3($s4)
 			lb $s7 , 3($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , finalMove			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap45
 			add $0 , $0 , $0
 			lb $s6 , 4($s4)
 			lb $s7 , 4($s5)	
 			add $0 , $0 , $0
 			slt $t7 , $s7 ,$s6
 			beq $t7 , $t9 , finalMove			#BOTH POSITIVE or s6 is positive and s7 is negative, either way compare normal
 			add $0 , $0 , $0
 			slt $t7 , $s6 , $s7
 			beq $t7 , $t9 , swap45
 			add $0 , $0 , $0			# IF REACHES END THEN THE VALUES WERE EQUAL AND IT DOESN"T MATTER WHICH IS FIRST
 			j finalMove
 			add $0 , $0 , $0 
 ###############################################################################################
 ######  SPOT FOR SIGN CHECK #######
 	sc12:
 		beq $s6 , $s7 , equalt12neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap12
 		add $0 , $0 , $0 			
 	sc13:
 		beq $s6 , $s7 , equalt13neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap13
 		add $0 , $0 , $0 
 	sc14:
 		beq $s6 , $s7 , equalt14neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap14
 		add $0 , $0 , $0 
 	sc15:	
 		beq $s6 , $s7 , equalt15neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap15
 		add $0 , $0 , $0 
 	sc23:
 		beq $s6 , $s7 , equalt23neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap23
 		add $0 , $0 , $0 
 	sc24:
 		beq $s6 , $s7 , equalt24neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap24
 		add $0 , $0 , $0 
 	sc25:
 		beq $s6 , $s7 , equalt25neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap25
 		add $0 , $0 , $0 
 	sc34:
 		beq $s6 , $s7 , equalt34neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap34
 		add $0 , $0 , $0 
 	sc35:
 		beq $s6 , $s7 , equalt35neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap35
 		add $0 , $0 , $0 
 	sc45:
 		beq $s6 , $s7 , equalt45neg		#IF SIGN BOTH NEG GO TO EQUALT12NEG IF NOT THE S7 IS POS AND WE SWAP
 		add $0 , $0 , $0 
 		j swap45
 		add $0 , $0 , $0 
 			
 #################################################################################################
 ##### SPOT FOR ALL LABELS WHEN T VALUE IS NOT EQUAL ####################
 	
 	neqt12:	
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s2)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s12
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort13
 		add $0 , $0 , $0
 		slt $t7 , $t1 , $t2
 		beq $t7 , $t9 , swap12
 		add $0 , $0 , $0
 		j rsort13
 		add $0 , $0 , $0
 		ctn12:
 			slt $t7 , $t2 , $t1
 			beq $t7 , $t9 , swap12
 			add $0 , $0 , $0
 		 	j rsort13
 		 	add $0 , $0 , $0
 			
 	neqt13:
 		and $s6 , $s6 , $0
 		and $s7 , $s6 , $0
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s3)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s13
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort14
 		add $0 , $0 , $0
 		slt $t7 , $t1 , $t3
 		beq $t7 , $t9 , swap13
 		add $0 , $0 , $0
 		j rsort14
 		add $0 , $0 , $0
 		ctn13:
 			slt $t7 , $t3 , $t1
 			beq $t7 , $t9 , swap13
 			add $0 , $0 , $0
 		 	j rsort14
 		 	add $0 , $0 , $0
 	neqt14:
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s4)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s14
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort15
 		add $0 , $0 , $0
 		slt $t7 , $t1 , $t4
 		beq $t7 , $t9 , swap14
 		add $0 , $0 , $0
 		j rsort15
 		add $0 , $0 , $0
 		ctn14:
 			slt $t7 , $t4 , $t1
 			beq $t7 , $t9 , swap14
 			add $0 , $0 , $0
 		 	j rsort15
 		 	add $0 , $0 , $0
 	neqt15:
 		lb $s6 , 0($s1)
 		lb $s7 , 0($s5)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s15
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort23
 		add $0 , $0 , $0
 		slt $t7 , $t1 , $t5
 		beq $t7 , $t9 , swap15
 		add $0 , $0 , $0
 		j rsort23
 		add $0 , $0 , $0
 		ctn15:
 			slt $t7 , $t5 , $t1
 			beq $t7 , $t9 , swap15
 			add $0 , $0 , $0
 		 	j rsort23
 		 	add $0 , $0 , $0
 	neqt23:
 		lb $s6 , 0($s2)
 		lb $s7 , 0($s3)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s23
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort24
 		add $0 , $0 , $0
 		slt $t7 , $t2 , $t3
 		beq $t7 , $t9 , swap23
 		add $0 , $0 , $0
 		j rsort24
 		add $0 , $0 , $0
 		ctn23:
 			slt $t7 , $t3 , $t2
 			beq $t7 , $t9 , swap23
 			add $0 , $0 , $0
 		 	j rsort24
 		 	add $0 , $0 , $0
 	neqt24:
 		lb $s6 , 0($s2)
 		lb $s7 , 0($s4)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s24
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort25
 		add $0 , $0 , $0
 		slt $t7 , $t2 , $t4
 		beq $t7 , $t9 , swap24
 		add $0 , $0 , $0
 		j rsort25
 		add $0 , $0 , $0
 		ctn24:
 			slt $t7 , $t4 , $t2
 			beq $t7 , $t9 , swap24
 			add $0 , $0 , $0
 		 	j rsort25
 		 	add $0 , $0 , $0
 	neqt25:
 		lb $s6 , 0($s2)
 		lb $s7 , 0($s5)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s25
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort34
 		add $0 , $0 , $0
 		slt $t7 , $t2 , $t5
 		beq $t7 , $t9 , swap25
 		add $0 , $0 , $0
 		j rsort34
 		add $0 , $0 , $0
 		ctn25:
 			slt $t7 , $t5 , $t2
 			beq $t7 , $t9 , swap25
 			add $0 , $0 , $0
 		 	j rsort34
 		 	add $0 , $0 , $0
 	neqt34:
 		lb $s6 , 0($s3)
 		lb $s7 , 0($s4)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s34
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort35
 		add $0 , $0 , $0
 		slt $t7 , $t3 , $t4
 		beq $t7 , $t9 , swap34
 		add $0 , $0 , $0
 		j rsort35
 		add $0 , $0 , $0
 		ctn34:
 			slt $t7 , $t4 , $t3
 			beq $t7 , $t9 , swap34
 			add $0 , $0 , $0
 		 	j rsort35
 		 	add $0 , $0 , $0
 	neqt35:
 		lb $s6 , 0($s3)
 		lb $s7 , 0($s5)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s35
 		add $0 , $0 , $0
 		beq $s7 , $t8 , rsort45
 		add $0 , $0 , $0
 		slt $t7 , $t3 , $t5
 		beq $t7 , $t9 , swap35
 		add $0 , $0 , $0
 		j rsort45
 		add $0 , $0 , $0
 		ctn35:
 			slt $t7 , $t5 , $t3
 			beq $t7 , $t9 , swap35
 			add $0 , $0 , $0
 		 	j rsort45
 		 	add $0 , $0 , $0
 	neqt45:
 		lb $s6 , 0($s4)
 		lb $s7 , 0($s5)
 		add $0 , $0 , $0
 		beq $s6 , $t8 , s45
 		add $0 , $0 , $0
 		beq $s7 , $t8 , finalMove
 		add $0 , $0 , $0
 		slt $t7 , $t4 , $t5
 		beq $t7 , $t9 , swap45
 		add $0 , $0 , $0
 		j finalMove
 		add $0 , $0 , $0
 		ctn45:
 			slt $t7 , $t5 , $t4
 			beq $t7 , $t9 , swap45
 			add $0 , $0 , $0
 		 	j finalMove
 		 	add $0 , $0 , $0
 	
############################################################################################## 
###   SIGN CHECK WHEN T ISNT EQUAL
 	s12:
 		bne $s7 , $t8 , swap12
 		add $0 , $0 , $0
 		j ctn12
 		add $0 , $0 , $0
 	s13:
 		bne $s7 , $t8 , swap13
 		add $0 , $0 , $0
 		j ctn13
 		add $0 , $0 , $0
 	s14:
 		bne $s7 , $t8 , swap14
 		add $0 , $0 , $0
 		j ctn14
 		add $0 , $0 , $0
 	s15:
 		bne $s7 , $t8 , swap15
 		add $0 , $0 , $0
 		j ctn15
 		add $0 , $0 , $0
 	s23:
 		bne $s7 , $t8 , swap23
 		add $0 , $0 , $0
 		j ctn23
 		add $0 , $0 , $0
 	s24:
 		bne $s7 , $t8 , swap24
 		add $0 , $0 , $0
 		j ctn24
 		add $0 , $0 , $0
 	s25:
 		bne $s7 , $t8 , swap25
 		add $0 , $0 , $0
 		j ctn25
 		add $0 , $0 , $0
 	s34:
 		bne $s7 , $t8 , swap34
 		add $0 , $0 , $0
 		j ctn34
 		add $0 , $0 , $0
 	s35:
 		bne $s7 , $t8 , swap35
 		add $0 , $0 , $0
 		j ctn35
 		add $0 , $0 , $0
 	s45:
 		bne $s7 , $t8 , swap45
 		add $0 , $0 , $0
 		j ctn45
 		add $0 , $0 , $0	
 ##############################################################################################
 #####  SPOT FOR ALL LABELS WHEN SWAPPING VALUES  ###########
 	swap12:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t1
 		and $t1 , $t1 , $0
 		add $t1 , $t1 , $t2
 		and $t2 , $t2 , $0
 		add $t2 , $t2 , $t0 ###CLEAR 2ns S SO IT STARTS FRESH
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s1
 		and $s1 , $s1 , $0
 		add $s1 , $s1 , $s2
 		and $s2 , $s2 , $0
 		add $s2 , $s2 , $t0
 		j rsort13
 		add $0 ,$0 , $0
 	swap13:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t1
 		and $t1 , $t1 , $0
 		add $t1 , $t1 , $t3
 		and $t3 , $t3 , $0
 		add $t3 , $t3 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s1
 		and $s1 , $s1 , $0
 		add $s1 , $s1 , $s3
 		and $s3 , $s3 , $0
 		add $s3 , $s3 , $t0
 		j rsort14
 		add $0 ,$0 , $0
 	swap14:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t1
 		and $t1 , $t1 , $0
 		add $t1 , $t1 , $t4
 		and $t4 , $t4 , $0
 		add $t4 , $t4 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s1
 		and $s1 , $s1 , $0
 		add $s1 , $s1 , $s4
 		and $s4 , $s4 , $0
 		add $s4 , $s4 , $t0
 		j rsort15
 		add $0 ,$0 , $0
 	swap15:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t1
 		and $t1 , $t1 , $0
 		add $t1 , $t1 , $t5
 		and $t5 , $t5 , $0
 		add $t5 , $t5 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s1
 		and $s1 , $s1 , $0
 		add $s1 , $s1 , $s5
 		and $s5 , $s5 , $0
 		add $s5 , $s5 , $t0
 		j rsort23
 		add $0 ,$0 , $0
 	swap23:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t2
 		and $t2 , $t2 , $0
 		add $t2 , $t2 , $t3
 		and $t3 , $t3 , $0
 		add $t3 , $t3 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s2
 		and $s2 , $s2 , $0
 		add $s2 , $s2 , $s3
 		and $s3 , $s3 , $0
 		add $s3 , $s3 , $t0
 		j rsort24
 		add $0 ,$0 , $0
 	swap24:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t2
 		and $t2 , $t2 , $0
 		add $t2 , $t2 , $t4
 		and $t4 , $t4 , $0
 		add $t4 , $t4 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s2
 		and $s2 , $s2 , $0
 		add $s2 , $s2 , $s4
 		and $s4 , $s4 , $0
 		add $s4 , $s4 , $t0
 		j rsort25
 		add $0 ,$0 , $0
 	swap25:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t2
 		and $t2 , $t2 , $0
 		add $t2 , $t2 , $t5
 		and $t5 , $t5 , $0
 		add $t5 , $t5 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s2
 		and $s2 , $s2 , $0
 		add $s2 , $s2 , $s5
 		and $s5 , $s5 , $0
 		add $s5 , $s5 , $t0
 		j rsort34
 		add $0 ,$0 , $0
 	swap34:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t3
 		and $t3 , $t3 , $0
 		add $t3 , $t3 , $t4
 		and $t4 , $t4 , $0
 		add $t4 , $t4 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s3
 		and $s3 , $s3 , $0
 		add $s3 , $s3 , $s4
 		and $s4 , $s4 , $0
 		add $s4 , $s4 , $t0
 		j rsort35
 		add $0 ,$0 , $0
 	swap35:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $t3
 		and $t3 , $t3 , $0
 		add $t3 , $t3 , $t5
 		and $t5 , $t5 , $0
 		add $t5 , $t5 , $t0
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s3
 		and $s3 , $s3 , $0
 		add $s3 , $s3 , $s5
 		and $s5 , $s5 , $0
 		add $s5 , $s5 , $t0
 		j rsort45
 		add $0 ,$0 , $0
 	swap45:
 		and $t0 , $t0 , $0
 		add $t0 , $t0 , $s4
 		and $s4 , $s4 , $0
 		add $s4 , $s4 , $s5
 		and $s5 , $s5 , $0
 		add $s5 , $s5 , $t0
 		j finalMove
 		add $0 ,$0 , $0
################################################################################################
 	
 	finalMove:
 		lui $t0 , 0x1000
 		and $t2 , $t2 , $0
 		sb $t2 , 0($t0)
 		sb $t2 , 1($t0)
 		sb $t2 , 2($t0)
 		sb $t2 , 3($t0)
 		sb $t2 , 4($t0)
 		sb $t2 , 5($t0)
 		sb $t2 , 6($t0)
 		sb $t2 , 7($t0)
 		sb $t2 , 8($t0)
 		sb $t2 , 9($t0)
 		sb $t2 , 10($t0)
 		sb $t2 , 11($t0)
 		sb $t2 , 12($t0)
 		sb $t2 , 13($t0)
 		sb $t2 , 14($t0)
 		sb $t2 , 15($t0)
 		sb $t2 , 16($t0)
 		sb $t2 , 17($t0)
 		sb $t2 , 18($t0)
 		sb $t2 , 19($t0)
 		sb $t2 , 20($t0)
 		sb $t2 , 21($t0)
 		sb $t2 , 22($t0)
 		sb $t2 , 23($t0)
 		sb $t2 , 24($t0)
 		sb $t2 , 25($t0)
 		sb $t2 , 26($t0)
 		sb $t2 , 27($t0)
 		
 		lb $t1 , 0($s5)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next4
 		sb $t1 , 0($t0)
 
 		lb $t1 , 1($s5)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next4
 		add $0 , $0 , $0 
 		sb $t1 , 1($t0)
 		
 		lb $t1 , 2($s5)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next4
 		add $0 , $0 , $0 
 		sb $t1 , 2($t0)
 		
 		lb $t1 , 3($s5)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next4
 		add $0 , $0 , $0 
 		sb $t1 , 3($t0)
 		
 		lb $t1 , 4($s5)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next4
 		add $0 , $0 , $0 
 		sb $t1 , 4($t0)
 		
 		lb $t1 , 5($s5)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next4
 		add $0 , $0 , $0 
 		sb $t1 , 5($t0)
 	next4:
 		addi $t0 , $t0 , 8
 		lb $t1 , 0($s4)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next3
 		add $0 , $0 , $0 
 		sb $t1 , 0($t0)
 		
 		lb $t1 , 1($s4)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next3
 		add $0 , $0 , $0 
 		sb $t1 , 1($t0)
 		
 		lb $t1 , 2($s4)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next3
 		add $0 , $0 , $0 
 		sb $t1 , 2($t0)
 		
 		lb $t1 , 3($s4)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next3
 		add $0 , $0 , $0 
 		sb $t1 , 3($t0)
 		
 		lb $t1 , 4($s4)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next3
 		add $0 , $0 , $0 
 		sb $t1 , 4($t0)
 		
 		lb $t1 , 5($s4)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next3
 		add $0 , $0 , $0 
 		sb $t1 , 5($t0)
 	next3:
 		addi $t0 , $t0 , 8
 		lb $t1 , 0($s3)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next2
 		add $0 , $0 , $0 
 		sb $t1 , 0($t0)
 		
 		lb $t1 , 1($s3)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next2
 		add $0 , $0 , $0 
 		sb $t1 , 1($t0)
 		
 		lb $t1 , 2($s3)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next2
 		add $0 , $0 , $0 
 		sb $t1 , 2($t0)

 		lb $t1 , 3($s3)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next2
 		add $0 , $0 , $0 
 		sb $t1 , 3($t0)
 		
 		lb $t1 , 4($s3)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next2
 		add $0 , $0 , $0 
 		sb $t1 , 4($t0)
 		
 		lb $t1 , 5($s3)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next2
 		add $0 , $0 , $0 
 		sb $t1 , 5($t0)
 	next2:
 		addi $t0 , $t0 , 8
 		lb $t1 , 0($s2)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next1
 		add $0 , $0 , $0 
 		sb $t1 , 0($t0)
 		
 		lb $t1 , 1($s2)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next1
 		add $0 , $0 , $0 
 		sb $t1 , 1($t0)
 		
 		lb $t1 , 2($s2)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next1
 		add $0 , $0 , $0 
 		sb $t1 , 2($t0)
 		
 		lb $t1 , 3($s2)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next1
 		add $0 , $0 , $0 
 		sb $t1 , 3($t0)
 		
 		lb $t1 , 4($s2)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next1
 		add $0 , $0 , $0 
 		sb $t1 , 4($t0)
 		
 		lb $t1 , 5($s2)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , next1
 		add $0 , $0 , $0 
 		sb $t1 , 5($t0)
 	next1:
 		addi $t0 , $t0 , 8
 		lb $t1 , 0($s1)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , done
 		add $0 , $0 , $0 
 		sb $t1 , 0($t0)
 	
 		lb $t1 , 1($s1)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , done
 		add $0 , $0 , $0 
 		sb $t1 , 1($t0)
 		
 		lb $t1 , 2($s1)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , done
 		add $0 , $0 , $0 
 		sb $t1 , 2($t0)
 	
 		lb $t1 , 3($s1)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , done
 		add $0 , $0 , $0 
 		sb $t1 , 3($t0)
 		
 		lb $t1 , 4($s1)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , done
 		add $0 , $0 , $0 
 		sb $t1 , 4($t0)
 	
 		lb $t1 , 5($s1)
 		add $0 , $0 , $0 
 		beq $t1 , $0 , done
 		add $0 , $0 , $0 
 		sb $t1 , 5($t0)
 		
 		
 done:	
 #Jumped to when program is finsihed, ie all 5 nubers have been input and moved to proper location in memory and sorted (PART 3)
   	addi $v0 , $0 , 10 
   	syscall
