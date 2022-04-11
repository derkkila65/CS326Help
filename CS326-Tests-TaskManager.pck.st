'From Cuis 6.0 [latest update: #5069] on 6 April 2022 at 9:42:02 pm'!
'Description '!
!provides: 'CS326-Tests-TaskManager' 1 6!
!requires: 'CS326-Core' 1 2 nil!
SystemOrganization addCategory: 'CS326-Tests-TaskManager'!


!classDefinition: #DeveloperTestCase category: 'CS326-Tests-TaskManager'!
TestCase subclass: #DeveloperTestCase
	instanceVariableNames: 'wasVisited'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-TaskManager'!
!classDefinition: 'DeveloperTestCase class' category: 'CS326-Tests-TaskManager'!
DeveloperTestCase class
	instanceVariableNames: ''!

!classDefinition: #TaskTestCase category: 'CS326-Tests-TaskManager'!
TestCase subclass: #TaskTestCase
	instanceVariableNames: 'wasVisited'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-Tests-TaskManager'!
!classDefinition: 'TaskTestCase class' category: 'CS326-Tests-TaskManager'!
TaskTestCase class
	instanceVariableNames: ''!


!DeveloperTestCase methodsFor: 'accessing' stamp: 'TE 4/6/2022 20:36:37'!
SampleDeveloper
	
	^Developer
		developerName: self nameSampleDeveloper! !

!DeveloperTestCase methodsFor: 'accessing' stamp: 'TE 4/6/2022 12:26:57'!
entityForTest

	^self SampleDeveloper! !

!DeveloperTestCase methodsFor: 'accessing' stamp: 'TE 4/6/2022 12:26:27'!
nameSampleDeveloper

	^ 'SampleDeveloper'! !

!DeveloperTestCase methodsFor: 'visiting' stamp: 'TE 4/6/2022 21:40:25'!
visitDeveloper: Developer

	Developer developerName = self nameSampleDeveloper
		ifFalse: [self error: 'expected to view SampleDeveloper'].
	wasVisited := true.! !

!DeveloperTestCase methodsFor: 'running' stamp: 'TE 4/6/2022 12:36:16'!
testConstructor

	| review |
	review := self SampleDeveloper.
	self assert: (review developerName = self nameSampleDeveloper).! !

!DeveloperTestCase methodsFor: 'running' stamp: 'TE 4/6/2022 12:34:44'!
testVisitation

	wasVisited := false.
	self SampleDeveloper accept: self.
	self assert: wasVisited.! !

!TaskTestCase methodsFor: 'visiting' stamp: 'TE 4/6/2022 21:41:31'!
visitTask: Task

	Task name = self nameSampleTask
		ifFalse: [self error: 'expected to view SampleTask'].
	wasVisited := true.! !

!TaskTestCase methodsFor: 'running' stamp: 'TE 4/4/2022 00:29:04'!
testConstructor

	| review |
	review := self SampleTask.
	self assert: (review name = self nameSampleTask).
	self assert: (review description = self descriptionSampleTask).! !

!TaskTestCase methodsFor: 'running' stamp: 'TE 4/4/2022 00:28:00'!
testUUID

	| entity |
	entity := self entityForTest.
	self assert: entity uuid notNil.
	self assert: (entity uuid isKindOf: UUID).! !

!TaskTestCase methodsFor: 'running' stamp: 'TE 4/4/2022 00:27:34'!
testVisitation

	wasVisited := false.
	self SampleTask accept: self.
	self assert: wasVisited.! !

!TaskTestCase methodsFor: 'accessing' stamp: 'TE 4/6/2022 21:32:53'!
SampleTask
	
	^Task
		name: self nameSampleTask
		description: self descriptionSampleTask
		developer: self developerSampleTask! !

!TaskTestCase methodsFor: 'accessing' stamp: 'TE 4/4/2022 00:24:40'!
descriptionSampleTask

	^ 'This is a sample task. Get to work.'! !

!TaskTestCase methodsFor: 'accessing' stamp: 'TE 4/6/2022 21:30:41'!
developerSampleTask

	| aDeveloperSampleTask |
	aDeveloperSampleTask := Developer new.
	aDeveloperSampleTask developerName: 'John Doe'.
	^ aDeveloperSampleTask! !

!TaskTestCase methodsFor: 'accessing' stamp: 'TE 4/4/2022 00:26:05'!
entityForTest

	^self SampleTask! !

!TaskTestCase methodsFor: 'accessing' stamp: 'TE 4/4/2022 00:23:43'!
nameSampleTask

	^ 'SampleTask'! !
