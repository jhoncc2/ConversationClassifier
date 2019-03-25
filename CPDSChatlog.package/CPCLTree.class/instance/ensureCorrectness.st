functions
ensureCorrectness
	^ (end >= start) 
		and: [ 
			children isNotEmpty ifTrue: [ 
				
				| a |
				a := children collect: [ :e | e start ].
				(((2 to: a size) allSatisfy: [ :i | (a at: i -1 ) < (a at: i) ]) 
					and: [ (children first start = start) and: [children last end = end]])
					and: [ (children collect: [ :e | {e start. e end +1 . }]) 
								flattened asSet size = (children size + 1) ]
			] ifFalse: [ true ]
		]