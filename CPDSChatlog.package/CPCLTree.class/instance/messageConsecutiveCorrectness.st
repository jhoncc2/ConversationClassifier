testing
messageConsecutiveCorrectness
	| res |
	self isLeaf ifTrue: [ ^ {start. end } ].
	"children do: [ :e | e messageConsecutiveCorrectness ifFalse: [ ^ false ] ]."
	
	"^ ((children collect: [ :e | {e start. e end + 1.} ]) flattened) asSet."
	res := OrderedCollection new.
	children do: [ :e | res addAll: e messageConsecutiveCorrectness ].
	^ res flattened asSet asSortedCollection.