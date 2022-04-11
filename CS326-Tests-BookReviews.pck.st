'From Cuis 6.0 [latest update: #5069] on 1 April 2022 at 1:44:38 pm'!
'Description '!
!provides: 'CS326-Tests-BookReviews' 1 8!
!requires: 'CS326-Tests-Core' 1 3 nil!
!requires: 'CS326-BookReviews' 1 9 nil!
SystemOrganization addCategory: 'CS326-Tests-BookReviews'!


!classDefinition: #BookReviewDBTestCase category: 'CS326-Tests-BookReviews'!
TestCase subclass: #BookReviewDBTestCase
	instanceVariableNames: 'testDB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-BookReviews'!
!classDefinition: 'BookReviewDBTestCase class' category: 'CS326-Tests-BookReviews'!
BookReviewDBTestCase class
	instanceVariableNames: ''!

!classDefinition: #BookReviewTestCase category: 'CS326-Tests-BookReviews'!
TestCase subclass: #BookReviewTestCase
	instanceVariableNames: 'wasVisited'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-BookReviews'!
!classDefinition: 'BookReviewTestCase class' category: 'CS326-Tests-BookReviews'!
BookReviewTestCase class
	instanceVariableNames: ''!


!BookReviewDBTestCase methodsFor: 'running' stamp: 'jws 3/31/2022 21:48:49'!
testGetReview

	| review |
	review := testDB get: BookReviewDB uuid1984.
	self assert: (review title = '1984').
	self assert: (review review = 'The clocks were striking 13... it''s all down hill from there.').! !

!BookReviewDBTestCase methodsFor: 'initialize-release' stamp: 'jws 3/24/2022 22:03:32'!
setUp

	super setUp.
	BookReviewDB resetTestDb.
	testDB := BookReviewDB testDb.! !

!BookReviewDBTestCase methodsFor: 'initialize-release' stamp: 'jws 3/24/2022 21:50:24'!
tearDown

	testDB := nil.
	super tearDown.
! !

!BookReviewTestCase methodsFor: 'accessing' stamp: 'jws 3/25/2022 20:38:07'!
bookReview1984

	^BookReview
		title: self title1984
		review: self review1984! !

!BookReviewTestCase methodsFor: 'accessing' stamp: 'jws 3/24/2022 21:14:22'!
bookReviewLesMiz

	^BookReview
		title: 'Les Miserables'
		review: 'A lot of fuss over a piece of toast.'! !

!BookReviewTestCase methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:33:04'!
entityForTest

	^self bookReview1984

		! !

!BookReviewTestCase methodsFor: 'accessing' stamp: 'jws 3/25/2022 20:38:07'!
review1984

	^ 'The clocks were striking 13... it''s all down hill from there.'! !

!BookReviewTestCase methodsFor: 'accessing' stamp: 'jws 3/25/2022 20:37:48'!
title1984

	^ '1984'! !

!BookReviewTestCase methodsFor: 'visiting' stamp: 'jws 3/25/2022 20:37:48'!
visitBookReview: aBookReview

	aBookReview title = self title1984
		ifFalse: [self error: 'expected to visit 1984'].
	wasVisited := true.
	! !

!BookReviewTestCase methodsFor: 'running' stamp: 'jws 3/25/2022 20:37:21'!
testConstructor

	| review |
	review := self bookReview1984.
	self assert: (review title = self title1984).
	self assert: (review review = self review1984).! !

!BookReviewTestCase methodsFor: 'running' stamp: 'jws 3/31/2022 21:54:10'!
testUUID

	| entity |
	entity := self entityForTest.
	self assert: entity uuid notNil.
	self assert: (entity uuid isKindOf: UUID).! !

!BookReviewTestCase methodsFor: 'running' stamp: 'jws 3/24/2022 21:10:32'!
testVisitation

	wasVisited := false.
	self bookReview1984 accept: self.
	self assert: wasVisited.! !
