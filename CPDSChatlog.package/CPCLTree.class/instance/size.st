accessor
size
	self isLeaf ifTrue: [ ^ 1 ].
	
	^ (children collect: [ :e | e size ]) sum