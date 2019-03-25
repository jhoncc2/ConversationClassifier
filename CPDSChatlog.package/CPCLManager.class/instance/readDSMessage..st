parsing
readDSMessage: stream
	| blackChars el els unclosed |
	blackChars := { $" }.
	
	els := ''.
	el := stream nextElement. 
	unclosed := false.
	[(el == $;) not or: [ unclosed ] ] whileTrue: [ 
		(blackChars anySatisfy: [:e | e == el]) ifTrue: [ unclosed := unclosed not ].
		els , el asString.
		el := stream nextElement.
	].

	^els