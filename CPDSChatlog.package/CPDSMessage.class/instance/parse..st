initialization
parse: aLine
	| a |
	a := ';' split: aLine. 
	self user: (a at: 1).
	self date: (a at: 2).
	self content: (a at: 3).
	a size >  3 ifTrue: [
		self attachement: (a at: 4).
		]
	