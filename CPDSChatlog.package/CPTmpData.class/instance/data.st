as yet unclassified
data
	| d |
	d := OrderedCollection new.
	self class methods
		do: [ :e | 
			e selector = #data ifFalse: [ d addAll: (self perform: e selector) ] 
		].
	^ d
	
	