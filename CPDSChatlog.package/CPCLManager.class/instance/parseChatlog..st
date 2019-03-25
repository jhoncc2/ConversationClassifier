parsing
parseChatlog: fileReference
	| stream chatList |
	stream := fileReference readStream .
	stream nextLine.
	chatList := OrderedCollection new.
	[stream atEnd] whileFalse: [ 
		|line|
		"line := stream nextLine."
		chatList add: CPDSMessage new.
		"chatList last parse: line."
		chatList last user: (self readDSMessageEl: stream).
		chatList last date: (self readDSMessageEl: stream).
		chatList last content: (self readDSMessageEl: stream).
		chatList last attachement: (self readDSMessageEl: stream).
		"remove last return of carry"
		stream nextElement.
		].
	
	^ chatList.