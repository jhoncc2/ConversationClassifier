parsing
createTreeTest
	| f chatlog t outFolder stream |
	f := '/home/jhon/Pharo/images/dschatprocessing/data/chatlogs/Pharo - roassal.csv' asFileReference .
	outFolder := (FileSystem workingDirectory / 'data/output') ensureCreateDirectory.
	chatlog := self parseChatlog: f.
	t := CPCLTree new .
	t insertMessages: chatlog ini: 1 end: chatlog size range: 0.
	t children do: [ :e | e ensureCorrectness ifFalse: [ self halt. ] ] .

	t trimTreeByAuthors.
	t children do: [ :e | e ensureCorrectness ifFalse: [ self halt. ] ] .
	stream := (outFolder / (f basename , '.out.csv') ) writeStream.
	[t writeOnStream: stream] 
		ensure: [stream close].
	^ t