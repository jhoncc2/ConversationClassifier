functions
insertMessages: chat ini: startInt end: endInt range: r
	| localRateSec msg localstart nt |
	"local variables"
	chatlog := chat.
	start := startInt.
	end := endInt.
	
	"start local vars"
	localRateSec := (const_rate / (2 raisedTo: r)) asInteger.
	localRateSec < const_limitSec ifTrue: [	^ nil ].
	end - start < 1 ifTrue: [ ^ nil ].
	msg := chat at: startInt.
	localstart := startInt.
	"it := startInt."
	
	startInt to: endInt do: 
	"[it < (endInt + 1)] whileTrue:" [ :it |
		|e|
		e := chat at: it.
		(msg timeDiffInSec: e) > localRateSec ifTrue: [
			|t|
			t := CPCLTree new.
			t parent: self.
			children add: t.
			t insertMessages: chat ini: localstart end: it - 1 range: r+1.
			t ensureCorrectness ifFalse: [ self halt.].
			"trees"
			localstart := it.
			"localend := localend + 1."
		].
		msg := e.
	].

	nt := CPCLTree new.
	nt := nt parent: self.
	nt insertMessages: chat 
							ini: (children isNotEmpty  
									ifTrue: [children last end + 1]
									ifFalse: [start])
							end: end range: r+1.
	children add: nt.
	
	^ self yourself.
