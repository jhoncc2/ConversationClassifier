parsing
processChatlog: sFileReference
	| f chatlog t |
	f := sFileReference.
	chatlog := self parseChatlog: f.
	
	t := CPCLTree new .
	t insertMessages: chatlog ini: 1 end: chatlog size range: 0.
	t trimTreeByAuthors.
	^ t