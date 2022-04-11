'From Cuis 6.0 [latest update: #5069] on 1 April 2022 at 1:43:09 pm'!
'Description '!
!provides: 'CS326-Core' 1 2!
SystemOrganization addCategory: 'CS326-Core'!


!classDefinition: #ApplicationModel category: 'CS326-Core'!
ActiveModel subclass: #ApplicationModel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'ApplicationModel class' category: 'CS326-Core'!
ApplicationModel class
	instanceVariableNames: ''!

!classDefinition: #DBError category: 'CS326-Core'!
Error subclass: #DBError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'DBError class' category: 'CS326-Core'!
DBError class
	instanceVariableNames: ''!

!classDefinition: #DBDuplicateKeyError category: 'CS326-Core'!
DBError subclass: #DBDuplicateKeyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'DBDuplicateKeyError class' category: 'CS326-Core'!
DBDuplicateKeyError class
	instanceVariableNames: ''!

!classDefinition: #DBMissingKeyError category: 'CS326-Core'!
DBError subclass: #DBMissingKeyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'DBMissingKeyError class' category: 'CS326-Core'!
DBMissingKeyError class
	instanceVariableNames: ''!

!classDefinition: #ApplicationWindow category: 'CS326-Core'!
SystemWindow subclass: #ApplicationWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'ApplicationWindow class' category: 'CS326-Core'!
ApplicationWindow class
	instanceVariableNames: ''!

!classDefinition: #Entity category: 'CS326-Core'!
Object subclass: #Entity
	instanceVariableNames: 'uuid'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'Entity class' category: 'CS326-Core'!
Entity class
	instanceVariableNames: ''!

!classDefinition: #EntityDB category: 'CS326-Core'!
Object subclass: #EntityDB
	instanceVariableNames: 'entities'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Core'!
!classDefinition: 'EntityDB class' category: 'CS326-Core'!
EntityDB class
	instanceVariableNames: 'default'!


!ApplicationModel methodsFor: 'accessing' stamp: 'jws 3/14/2022 13:25:01'!
defaultTitle

	^self class name! !

!ApplicationModel class methodsFor: 'opening' stamp: 'jws 3/14/2022 13:18:56'!
open
	
	| model |
	model := self new.
	self open: model.
	^model! !

!ApplicationModel class methodsFor: 'opening' stamp: 'jws 3/14/2022 13:20:23'!
open: anApplicationModel 
	
	self windowClass open: anApplicationModel.
	^anApplicationModel! !

!ApplicationModel class methodsFor: 'accessing' stamp: 'jws 3/14/2022 13:21:24'!
windowClass
	
	^ApplicationWindow! !

!ApplicationWindow methodsFor: 'GUI building' stamp: 'jws 3/14/2022 13:29:16'!
buildMorphicWindow
	
	self setLabel: self model defaultTitle.! !

!ApplicationWindow methodsFor: 'GUI building' stamp: 'jws 4/1/2022 13:41:33'!
defaultSeparation
	"Answer the number of pixels between fields/layouts"
	
	^ 5 "pixels"! !

!ApplicationWindow methodsFor: 'GUI building' stamp: 'jws 4/1/2022 13:41:23'!
rowHeight

	^ self defaultSeparation * 2 + self textSizeUnit! !

!ApplicationWindow methodsFor: 'GUI building' stamp: 'jws 4/1/2022 13:41:13'!
textSizeUnit

	| defaultFont |
	defaultFont := LabelMorph new font.
	^(defaultFont ascent + defaultFont descent + 1) rounded! !

!Entity methodsFor: 'accessing' stamp: 'jws 3/30/2022 13:46:08'!
uuid
	"Answer the value of uuid"

	^ uuid! !

!Entity methodsFor: 'accessing' stamp: 'jws 3/30/2022 13:46:03'!
uuid: anObject
	"Set the value of uuid"

	uuid _ anObject! !

!Entity methodsFor: 'initialization' stamp: 'jws 3/30/2022 13:46:29'!
initialize

	super initialize.
	uuid := UUID new.! !

!Entity methodsFor: 'visiting' stamp: 'jws 3/30/2022 13:47:32'!
accept: aVisitor

	^aVisitor visitEntity: self! !

!EntityDB methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:55:47'!
add: anEntity
	"Ensure anEntity does not exist."

	(self entities includesKey: anEntity uuid asString)
		ifTrue: [DBDuplicateKeyError signal: 'object already present in database'].
	self entities at: anEntity uuid asString put: anEntity! !

!EntityDB methodsFor: 'accessing' stamp: 'jws 3/30/2022 13:28:20'!
entities
	"Answer the value of entities"

	^ entities! !

!EntityDB methodsFor: 'accessing' stamp: 'jws 3/30/2022 13:28:20'!
entities: anObject
	"Set the value of entities"

	entities _ anObject! !

!EntityDB methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:55:14'!
get: aUUID
	"Answer the review with the given UUID."
	
	^self entities
		at: aUUID asString
		ifAbsent: [DBMissingKeyError signal: 'object not in database']! !

!EntityDB methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:47:38'!
update: anEntity
	"Ensure anEntity already exists."

	(self entities includesKey: anEntity uuid asString)
		ifFalse: [DBMissingKeyError signal: 'object not present in database'].
	self entities at: anEntity uuid asString put: anEntity! !

!EntityDB methodsFor: 'initialization' stamp: 'jws 3/30/2022 13:28:42'!
initialize

	super initialize.
	entities := Dictionary new.! !

!EntityDB class methodsFor: 'instance creation' stamp: 'jws 3/30/2022 13:29:41'!
new

	self shouldNotImplement! !

!EntityDB class methodsFor: 'testdb' stamp: 'jws 3/30/2022 13:37:20'!
populateTestDb! !

!EntityDB class methodsFor: 'testdb' stamp: 'jws 3/30/2022 13:30:37'!
resetTestDb

	default := nil.! !

!EntityDB class methodsFor: 'testdb' stamp: 'jws 3/30/2022 13:37:42'!
testDb

	default isNil 
		ifTrue: 
			[default := super new.
			self populateTestDb].
	^default! !
