initialization
writeOnStream: stream
	"creates a group for each tree leaf that exists"
	self isLeaf 
		ifFalse: [ children do: [:e | e writeOnStream: stream ]]
		ifTrue: [
			|cl|
			cl := chatlog copyFrom: start to: end.
			cl do: [ :e | stream << (e toStringWithGroup: (start asString , end asString )) ]
		]
