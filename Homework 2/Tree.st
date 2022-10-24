" COEN 171 - Homework 2 - Binary Search Trees "
" Maddie Waldie - October 26, 2022 "

Object subclass: #Node
    instanceVariableNames: 'data left right'
    classVariableNames: ''
    poolDictionaries: '' category: 'homework'

!Node methodsFor: 'initialization'!

data: anObject
    data := anObject
!!

!Node methodsFor: 'manipulation'!

member: anObject
    anObject < data
	ifTrue: [left = nil
		 ifTrue: [^false]
		 ifFalse: [^left member: anObject]].

    anObject > data
	ifTrue: [right = nil
		 ifTrue: [^false]
		 ifFalse: [^right member: anObject]].

    ^true.
!

insert: anObject
    anObject < data
	ifTrue: [left = nil
		 ifTrue: [left := Node new data: anObject]
		 ifFalse: [left insert: anObject]].

    anObject > data
	ifTrue: [right = nil
		 ifTrue: [right := Node new data: anObject]
		 ifFalse: [right insert: anObject]].
!!

Object subclass: #Tree
    instanceVariableNames: 'root'
    classVariableNames: ''
    poolDictionaries: '' category: 'homework'

!Tree methodsFor: 'manipulation'!

member: anObject
    root isNil ifTrue: [^false] ifFalse: [^root member: anObject]
!

insert: anObject
    root isNil ifTrue: [root := Node new data: anObject] ifFalse: [root insert: anObject]
!!