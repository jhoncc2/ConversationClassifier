functions
depth
	self isLeaf 
		ifTrue: [ ^ 1 ]
		ifFalse: [ ^ 1 + (children collect: [:e | e depth]) max ]
	