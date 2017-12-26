.data
strInstruction: .asciiz "Use keys s-l to play a key on Octave One. Use keys S-L to play on Octave Two.\ne-u and E-U are used to play sharped notes on Octave One and Octave Two respectively.\n\n"
piano1: .asciiz " __________________________________________________________________________ \n"
piano2: .asciiz "|  |  | |  |   |  |  | |  | |  |   |  |  | |  |   |  |  | |  | |  |   |    |\n"
piano3: .asciiz "|  |C#| |D#|   |  |F#| |G#| |A#|   |  |C#| |D#|   |  |F#| |G#| |A#|   |    |\n"
piano4: .asciiz "|  |e | |r |   |  |t | |y | |u |   |  |E | |R |   |  |T | |Y | |U |   |    |\n"
piano5: .asciiz "|  |__| |__|   |  |__| |__| |__|   |  |__| |__|   |  |__| |__| |__|   |    |\n"
piano6: .asciiz "| C  | D  | E  | F  | G  | A  | B  | C2 | D2 | E2 | F2 | G2 | A2 | B2 | C3 |\n"
piano7: .asciiz "|(s) |(d) |(f) |(g) |(h) |(j) |(k) |(S) |(D) |(F) |(G) |(H) |(J) |(K) |(L) |\n"
piano8: .asciiz "|____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|\n\n"

.text
main:
#Display Instructions
li $v0, 4
la $a0, strInstruction
syscall

#Display Ascii Keyboard
la $a0, piano1
syscall
la $a0, piano2
syscall
la $a0, piano3
syscall
la $a0, piano4
syscall
la $a0, piano5
syscall
la $a0, piano6
syscall
la $a0, piano7
syscall
la $a0, piano8
syscall

#Check For Input Loop
PianoLoop:
li $v0, 12
syscall
move $s0, $v0

#Check if Exit Key ('q')
beq $s0, 0x71, Exit
#Check if Lower Octave Key
beq $s0, 0x73, C
beq $s0, 0x64, D
beq $s0, 0x66, E
beq $s0, 0x67, F
beq $s0, 0x68, G
beq $s0, 0x6A, A
beq $s0, 0x6B, B
beq $s0, 0x6C, C2

beq $s0, 0x65, CS
beq $s0, 0x72, DS
beq $s0, 0x74, FS
beq $s0, 0x79, GS
beq $s0, 0x75, AS
#Check if Higher Octave Key
beq $s0, 0x53, C2
beq $s0, 0x44, D2
beq $s0, 0x46, E2
beq $s0, 0x47, F2
beq $s0, 0x48, G2
beq $s0, 0x4A, A2
beq $s0, 0x4B, B2
beq $s0, 0x4C, C3

beq $s0, 0x45, C2S
beq $s0, 0x52, D2S
beq $s0, 0x54, F2S
beq $s0, 0x59, G2S
beq $s0, 0x55, A2S
#Otherwise, ignore key and jump back to PianoLoop
j PianoLoop

#Play Octave One Key Branches
C:
li $v0, 31
li $a0, 60
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

CS:
li $v0, 31
li $a0, 61
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

D:
li $v0, 31
li $a0, 62
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

DS:
li $v0, 31
li $a0, 63
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

E:
li $v0, 31
li $a0, 64
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

F:
li $v0, 31
li $a0, 65
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

FS:
li $v0, 31
li $a0, 66
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

G:
li $v0, 31
li $a0, 67
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

GS:
li $v0, 31
li $a0, 68
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

A:
li $v0, 31
li $a0, 69
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

AS:
li $v0, 31
li $a0, 70
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

B:
li $v0, 31
li $a0, 71
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

C2:
li $v0, 31
li $a0, 72
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

#Play Octave Two Key Branches
C2S:
li $v0, 31
li $a0, 73
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

D2:
li $v0, 31
li $a0, 74
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

D2S:
li $v0, 31
li $a0, 75
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

E2:
li $v0, 31
li $a0, 76
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

F2:
li $v0, 31
li $a0, 77
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

F2S:
li $v0, 31
li $a0, 78
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

G2:
li $v0, 31
li $a0, 79
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

G2S:
li $v0, 31
li $a0, 80
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

A2:
li $v0, 31
li $a0, 81
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

A2S:
li $v0, 31
li $a0, 82
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

B2:
li $v0, 31
li $a0, 83
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

C3:
li $v0, 31
li $a0, 84
li $a1, 500
li $a2, 0
li $a3, 100
syscall

#wait
li $v0, 32
li $a0, 50
syscall
#Jump back to Loop
j PianoLoop

#Exit Program Branch
Exit:
li $v0, 10
syscall
