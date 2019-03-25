parsing
executeChatlogProcessing
	| srcFolder outFolder |
	srcFolder := FileSystem workingDirectory / 'data/chatlogs'.
	outFolder := (FileSystem workingDirectory / 'data/output') ensureCreateDirectory.
	
	srcFolder files do: [ :f | 
		|tree stream|
		tree := self processChatlog: f.
		stream := (outFolder / (f basename , '.out.csv') ) writeStream.

		[tree writeOnStream: stream] 
			ensure: [stream close].
		stream
	]
	
	