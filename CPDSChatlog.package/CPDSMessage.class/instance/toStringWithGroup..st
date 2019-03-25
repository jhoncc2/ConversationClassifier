initialization
toStringWithGroup: g
	| s |
	group := g.
	s := self separator.
	
	^ group asString , s , 
	parentGroup asString , s , 
	date , s ,
	user , s ,
	content , s , 
	attachement , s ,
	String cr.
	