accessor
authors
	^ ((chatlog copyFrom: start to: end) collect: #user) asSet. 
	
