private
compareAuthors: tree with: otherTree
	"returns TRUE if all authors in 'tree' and 'otherTree' are the same"
	^ tree authors 
		allSatisfy: [ :e | otherTree authors anySatisfy: [ :el | el = e ] ]