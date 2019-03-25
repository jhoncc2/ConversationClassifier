initialization
initializePrivateVars
	const_limitSec := 60.
	const_rate := 86400. " 24 * 60 * 60"
	children := OrderedCollection new.
	start := 0.
	end := 0.
	