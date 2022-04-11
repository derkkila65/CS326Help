'From Cuis 6.0 [latest update: #5069] on 1 April 2022 at 1:44:11 pm'!
'Description '!
!provides: 'CS326-Tests-Core' 1 3!
!requires: 'CS326-Core' 1 2 nil!
SystemOrganization addCategory: 'CS326-Tests-Core'!


!classDefinition: #ApplicationModelTestCase category: 'CS326-Tests-Core'!
TestCase subclass: #ApplicationModelTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-Core'!
!classDefinition: 'ApplicationModelTestCase class' category: 'CS326-Tests-Core'!
ApplicationModelTestCase class
	instanceVariableNames: ''!

!classDefinition: #EntityDBTestCase category: 'CS326-Tests-Core'!
TestCase subclass: #EntityDBTestCase
	instanceVariableNames: 'testDB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-Core'!
!classDefinition: 'EntityDBTestCase class' category: 'CS326-Tests-Core'!
EntityDBTestCase class
	instanceVariableNames: ''!

!classDefinition: #EntityTestCase category: 'CS326-Tests-Core'!
TestCase subclass: #EntityTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-Core'!
!classDefinition: 'EntityTestCase class' category: 'CS326-Tests-Core'!
EntityTestCase class
	instanceVariableNames: ''!


!EntityDBTestCase methodsFor: 'setUp/tearDown' stamp: 'jws 3/31/2022 21:36:11'!
setUp

	super setUp.
	BookReviewDB resetTestDb.
	testDB := BookReviewDB testDb.! !

!EntityDBTestCase methodsFor: 'setUp/tearDown' stamp: 'jws 3/31/2022 21:36:32'!
tearDown

	testDB := nil.
	super tearDown.
! !

!EntityDBTestCase methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:38:06'!
entityForTest

	^ Entity new! !

!EntityDBTestCase methodsFor: 'running' stamp: 'jws 3/31/2022 21:51:46'!
testAddEntity

	| testEntity fetchedEntity |
	testEntity := self entityForTest.
	self
		should: [testDB get: testEntity uuid]
		raise: DBMissingKeyError.
	testDB add: testEntity.
	fetchedEntity := testDB get: testEntity uuid.
	self assert: (fetchedEntity uuid = testEntity uuid).
	self 
		should: [testDB add: testEntity]
		raise: DBDuplicateKeyError.! !

!EntityDBTestCase methodsFor: 'running' stamp: 'jws 3/31/2022 21:53:09'!
testUpdateEntity

	| testEntity |
	testEntity := self entityForTest.
	self
		should: [testDB update: testEntity]
		raise: DBMissingKeyError.
	testDB add: testEntity.
	testDB update: testEntity.
! !

!EntityTestCase methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:30:27'!
entityForTest

	^ Entity new! !

!EntityTestCase methodsFor: 'running' stamp: 'jws 3/31/2022 21:30:27'!
testUUID

	| entity |
	entity := self entityForTest.
	self assert: entity uuid notNil.
	self assert: (entity uuid isKindOf: UUID).! !
