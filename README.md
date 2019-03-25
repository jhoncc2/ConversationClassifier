# Conversation Classifier
This is a project developed in Pharo programming language, which classifies chat conversations (chatlogs). 
The algorithm groups Messages inside a conversation. 


1st Version - Conversation Tree
I call the algorithm conversation Tree. It gropus messages by time and author, by the next euristics.
 - Time lapse bag: Conversation happens when participants change arguments between a short period of time.
 - Author bag integrity: Conversations usully hold the same group of participants until the end. 
 
### Issues and Future work
The data-set where this algorithm is been proved is Pharo community Discord server. Which holds participants around the world. The channel we used is called "Learning-Help", the channel.

 - Conversations might trascend time in hours (big period of hours) because of the timeline the participants are
 - Some participants just jump into a conversation and then dissapear. Making difficult to know whether are part of the conversation or not.
 - Some questions aked remain unanswered and lost in the past.
 - Conversations might appear mixed in the same time line. In other words, two conversations might occur at the same time (lapse less than 20 sec in difference).
 - Experts answer two questions, in different and contiguous messages (one next to the other).

 
 

