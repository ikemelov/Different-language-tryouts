set board {. . . . . . . . .}
set pos {0 1 2 3 4 5 6 7 8}
set human {h u m a n . . .}
set pawn {O X}
set players {Computer Human}

set start [clock milliseconds]
puts "Welcome to Tcl-Tacl-Toel"

set player [expr round(rand())]
while 1 {
	if {$player == 1} {
		puts -nonewline "It's your turn, "
		puts [join [lmap x $human {expr { round(rand()) ? $x : [string toupper $x]}}] ""]

		foreach i {0 3 6} {
			puts -nonewline "[lrange $pos $i [expr $i+2]]    "
			puts [lrange $board $i [expr $i+2]]
		}
		while 1 {
		     puts -nonewline "Enter the position of your move (0-8): " ; flush stdout
		     if {[lindex $board [gets stdin move ; set move]] == "."} break
		}
		lset board $move X
	} else {
		puts -nonewline "The computer has calculated a move at "
		while 1 {
			set move [expr round(rand()*8)]
			# set x [lindex $board $move]
			if {[lindex $board $move] == "."} break
		}
		puts "$move."
		lset board $move O
	}

	set b $board
	set p [lindex $pawn $player]
	set L lindex

	if {([$L $b 0] == $p) && ([$L $b 1] == $p) && ([$L $b 2] == $p)} break
	if {([$L $b 3] == $p) && ([$L $b 4] == $p) && ([$L $b 5] == $p)} break
	if {([$L $b 6] == $p) && ([$L $b 7] == $p) && ([$L $b 8] == $p)} break

	if {([$L $b 0] == $p) && ([$L $b 3] == $p) && ([$L $b 6] == $p)} break
	if {([$L $b 1] == $p) && ([$L $b 4] == $p) && ([$L $b 7] == $p)} break
	if {([$L $b 2] == $p) && ([$L $b 5] == $p) && ([$L $b 8] == $p)} break

	if {([$L $b 0] == $p) && ([$L $b 4] == $p) && ([$L $b 8] == $p)} break
	if {([$L $b 2] == $p) && ([$L $b 4] == $p) && ([$L $b 6] == $p)} break

	set player [expr ($player + 1) % 2]
}

foreach i {0 3 6} {
	puts -nonewline "[lrange $pos $i [expr $i+2]]    "
	puts [lrange $board $i [expr $i+2]]
}

puts "The winner is the [lindex $players $player]!"
puts "It only took [expr {([clock milliseconds] - $start)/100/10.0}] seconds!"

