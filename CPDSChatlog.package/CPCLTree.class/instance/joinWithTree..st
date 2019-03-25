private
joinWithTree: t
	t isLeaf ifFalse: [ 
		|c|
		c := CPCLTree new.
		c start: start.
		c end: end.
		c children: children.
		children := OrderedCollection new.
		c chatlog: chatlog.
		
		self children add: c.
		self children addAll: t children.
	] ifTrue: [
		self isLeaf ifFalse: [
			self children add: t.
		]
	].

	self end: t end.
	

	