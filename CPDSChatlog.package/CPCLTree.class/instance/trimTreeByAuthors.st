functions
trimTreeByAuthors
	"Cut split conversations (leafs), by considering same participants in the same string of conversation"	
	| newChildren |
	
	self isLeaf ifTrue: [ ^ self ].
	
	children do: [:e | e trimTreeByAuthors].
	newChildren := OrderedCollection new.
	newChildren add: children first.

	2 to: children size do: [ :i | 
		(newChildren last) ensureCorrectness  ifFalse: [ self halt.].
		(self compareAuthors: (children at: i) with: newChildren last)
			ifTrue: [ newChildren last joinWithTree: (children at: i) ]
			ifFalse: [ newChildren add: (children at: i) .
		(newChildren last) ensureCorrectness  ifFalse: [ self halt ]]
		
	].

	children size = 1 ifTrue: [ 
		children := OrderedCollection new.
	] ifFalse: [ children := newChildren.].

	self isRoot ifTrue: [ self halt. ].
	self ensureCorrectness ifFalse: [ self halt. ]
	
	
	
	
	