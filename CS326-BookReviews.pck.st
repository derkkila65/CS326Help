'From Cuis 6.0 [latest update: #5069] on 6 April 2022 at 2:44:27 pm'!
'Description '!
!provides: 'CS326-BookReviews' 1 10!
!requires: 'Identities-UUID' 1 9 nil!
!requires: 'CS326-Core' 1 1 nil!
SystemOrganization addCategory: #'CS326-BookReviews'!


!classDefinition: #BookReviewBrowser category: #'CS326-BookReviews'!
ApplicationModel subclass: #BookReviewBrowser
	instanceVariableNames: 'reviewIndex title reviews'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-BookReviews'!
!classDefinition: 'BookReviewBrowser class' category: #'CS326-BookReviews'!
BookReviewBrowser class
	instanceVariableNames: ''!

!classDefinition: #BookReviewEditor category: #'CS326-BookReviews'!
ApplicationModel subclass: #BookReviewEditor
	instanceVariableNames: 'bookReview title review'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-BookReviews'!
!classDefinition: 'BookReviewEditor class' category: #'CS326-BookReviews'!
BookReviewEditor class
	instanceVariableNames: ''!

!classDefinition: #BookReviewBrowserWindow category: #'CS326-BookReviews'!
ApplicationWindow subclass: #BookReviewBrowserWindow
	instanceVariableNames: 'reviewListMorph reviewTextMorph entryTextMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-BookReviews'!
!classDefinition: 'BookReviewBrowserWindow class' category: #'CS326-BookReviews'!
BookReviewBrowserWindow class
	instanceVariableNames: ''!

!classDefinition: #BookReviewEditorWindow category: #'CS326-BookReviews'!
ApplicationWindow subclass: #BookReviewEditorWindow
	instanceVariableNames: 'titleMorph reviewEditorMorph buttonArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-BookReviews'!
!classDefinition: 'BookReviewEditorWindow class' category: #'CS326-BookReviews'!
BookReviewEditorWindow class
	instanceVariableNames: ''!

!classDefinition: #BookReview category: #'CS326-BookReviews'!
Entity subclass: #BookReview
	instanceVariableNames: 'title review'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-BookReviews'!
!classDefinition: 'BookReview class' category: #'CS326-BookReviews'!
BookReview class
	instanceVariableNames: ''!

!classDefinition: #BookReviewDB category: #'CS326-BookReviews'!
EntityDB subclass: #BookReviewDB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-BookReviews'!
!classDefinition: 'BookReviewDB class' category: #'CS326-BookReviews'!
BookReviewDB class
	instanceVariableNames: ''!


!BookReview commentStamp: 'jws 3/18/2022 13:15:21' prior: 0!
A BookReview is an information holder that describes a book review.
For the moment it is just a title, a review, and a unique id.!

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/6/2022 09:03:27'!
reviewIndex

	^reviewIndex! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/24/2022 21:16:50'!
reviewIndex: anInteger

	reviewIndex := anInteger.
	self changed: #reviewIndex! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/22/2022 22:20:24'!
reviewNames

	^self reviews titles! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/22/2022 22:23:32'!
reviewText

	| index |
	index := self reviewIndex.
	index = 0 ifTrue: [^''].
	^self selectedReview review! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/24/2022 21:17:09'!
reviews

	^reviews! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/22/2022 22:23:09'!
selectedReview
	
	(reviewIndex isNil or: [reviewIndex = 0]) ifTrue: [^nil].
	^self reviews titled: (self reviewNames at: self reviewIndex)! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/24/2022 21:17:01'!
title

	^title! !

!BookReviewBrowser methodsFor: 'accessing' stamp: 'jws 3/6/2022 12:13:59'!
title: aString

	title := aString.
	self titleChanged.! !

!BookReviewBrowser methodsFor: 'initialization' stamp: 'jws 3/22/2022 22:20:05'!
initialize

	super initialize.
	title := 'My Application'.
	reviews := BookReviewDB testDb.
	reviewIndex := 0.
! !

!BookReviewBrowser methodsFor: 'updating' stamp: 'jws 3/6/2022 12:13:49'!
titleChanged

	self triggerEvent: #titleChanged: with: self title.! !

!BookReviewBrowser class methodsFor: 'accessing' stamp: 'jws 3/18/2022 13:22:18'!
windowClass

	^BookReviewBrowserWindow! !

!BookReviewEditor methodsFor: 'accessing' stamp: 'jws 3/22/2022 21:30:58'!
bookReview
	"Answer the value of bookReview"

	^ bookReview! !

!BookReviewEditor methodsFor: 'accessing' stamp: 'jws 3/22/2022 21:32:06'!
bookReview: anObject
	"Set the value of bookReview"

	bookReview _ anObject.
	self title: anObject title.
	self review: anObject review.! !

!BookReviewEditor methodsFor: 'accessing' stamp: 'jws 3/22/2022 21:30:58'!
review
	"Answer the value of review"

	^ review! !

!BookReviewEditor methodsFor: 'accessing' stamp: 'jws 3/22/2022 21:52:26'!
review: aString
	"Set the value of review"

	review actualContents: aString.
	self triggerEvent: #reviewChanged: with: aString! !

!BookReviewEditor methodsFor: 'accessing' stamp: 'jws 3/22/2022 21:30:58'!
title
	"Answer the value of title"

	^ title! !

!BookReviewEditor methodsFor: 'accessing' stamp: 'jws 3/22/2022 21:33:19'!
title: anObject
	"Set the value of title"

	title _ anObject.
	self triggerEvent: #titleChanged: with: anObject! !

!BookReviewEditor methodsFor: 'initialization' stamp: 'jws 3/22/2022 21:51:54'!
initialize

	super initialize.
	review := TextModel withText: ''! !

!BookReviewEditor methodsFor: 'user interface' stamp: 'jws 3/22/2022 22:36:23'!
canDiscardEdits

	^true! !

!BookReviewEditor methodsFor: 'actions' stamp: 'jws 3/22/2022 22:25:57'!
accept
	
	bookReview title: title.
	bookReview review: review actualContents asString.! !

!BookReviewEditor class methodsFor: 'opening' stamp: 'jws 3/22/2022 21:31:29'!
on: aBookReview

	^self new
		bookReview: aBookReview;
		yourself! !

!BookReviewEditor class methodsFor: 'opening' stamp: 'jws 4/1/2022 13:28:54'!
openOn: aBookReview

	^self windowClass open: (self on: aBookReview)! !

!BookReviewEditor class methodsFor: 'accessing' stamp: 'jws 3/24/2022 21:29:47'!
windowClass

	^BookReviewEditorWindow! !

!BookReviewBrowserWindow methodsFor: 'metrics' stamp: 'jws 3/3/2022 21:24:05'!
defaultSeparation
	"Answer the number of pixels between fields/layouts"
	
	^ 5 "pixels"! !

!BookReviewBrowserWindow methodsFor: 'metrics' stamp: 'jws 3/3/2022 21:43:26'!
rowHeight

	^ self defaultSeparation * 2 + self textSizeUnit! !

!BookReviewBrowserWindow methodsFor: 'metrics' stamp: 'jws 3/3/2022 21:35:35'!
textSizeUnit

	| defaultFont |
	defaultFont := LabelMorph new font.
	^(defaultFont ascent + defaultFont descent + 1) rounded! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/6/2022 11:39:04'!
browseMorph

	^LayoutMorph newRow
		addMorph: self reviewListMorph proportionalWidth: 0.3;
		addMorph: self reviewTextMorph proportionalWidth: 0.7;
		yourself! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/31/2022 22:09:08'!
buildMorphicWindow

	super buildMorphicWindow.
	self layoutMorph
		addMorph: self browseMorph.

! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/24/2022 21:46:07'!
reviewListMorph

	reviewListMorph := 	PluggableListMorph
		model: model
		listGetter: #reviewNames  
		indexGetter: #reviewIndex 
		indexSetter: #reviewIndex:  
		mainView: self
		menuGetter: #reviewMenu
		keystrokeAction: nil.
	^reviewListMorph! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/22/2022 22:10:52'!
reviewMenu

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu add: 'edit' action: #editReview.
	^ aMenu! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/22/2022 22:07:51'!
reviewMenu: aMenu

	self halt! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/24/2022 21:46:19'!
reviewTextMorph

	| aTextModel |
	aTextModel := TextModel withText: self model reviewText.
	reviewTextMorph := 	TextModelMorph withModel: aTextModel.
	reviewTextMorph
		wrapFlag: true;
		alwaysShowVerticalScrollbar.
	self model 
		when: #changed:
		send: #updateText
		to: self.
	^reviewTextMorph! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/24/2022 21:46:30'!
titleEntryField
	"Answer a LayoutMoph containing the prompt and text entry area"
	
	| promptMorph entryLayout entryHeight |
	entryHeight := self rowHeight.
	entryLayout := LayoutMorph newRow.
	promptMorph := (LabelMorph contents: 'Enter Text: ') 
					emphasis: AbstractFont boldCode; 
					yourself.
	promptMorph  layoutSpec: 
		(LayoutSpec fixedWidth: (promptMorph measureContents x)).
	entryTextMorph := (OneLineEditorMorph contents: self model title).
	entryTextMorph 
		crAction: [self crInTitleEntryField]; 
		layoutSpec: (LayoutSpec proportionalWidth: 0.9).			
	^ entryLayout 
		separation: self defaultSeparation;
		layoutSpec: (LayoutSpec proportionalWidth: 1 fixedHeight: entryHeight);
		addMorph: promptMorph;
		addMorph: entryTextMorph;
		yourself! !

!BookReviewBrowserWindow methodsFor: 'open/close' stamp: 'jws 3/6/2022 11:59:41'!
updateText

	reviewTextMorph model actualContents: self model reviewText! !

!BookReviewBrowserWindow methodsFor: 'actions' stamp: 'jws 3/6/2022 12:07:12'!
crInTitleEntryField
	
	self model title: entryTextMorph contents! !

!BookReviewBrowserWindow methodsFor: 'actions' stamp: 'jws 3/24/2022 21:26:07'!
editReview
	
	| selectedReview |
	selectedReview := self selectedReview.
	selectedReview isNil ifTrue: [^self].
	BookReviewEditor openOn: selectedReview.
! !

!BookReviewBrowserWindow methodsFor: 'accessing' stamp: 'jws 3/22/2022 22:13:50'!
selectedReview
	
	^self model selectedReview! !

!BookReviewEditorWindow methodsFor: 'GUI building' stamp: 'jws 3/22/2022 22:01:49'!
buildMorphicWindow

	super buildMorphicWindow.
	self layoutMorph
		addMorph: self titleEntryField;
		addMorphUseAll: self reviewEditor;
		addMorph: self buttonRow.
! !

!BookReviewEditorWindow methodsFor: 'GUI building' stamp: 'jws 3/22/2022 22:03:24'!
buttonRow
	"Answer a LayoutMoph containing the ok and cancel buttons"
	
	buttonArea _ LayoutMorph newRow
		separation: 8@0;
		layoutSpec: (LayoutSpec proportionalWidth: 1 fixedHeight: self rowHeight);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #accept
				label: 'Accept')
			layoutSpec: (LayoutSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #cancel
				label: 'Cancel')
			layoutSpec: (LayoutSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		axisEdgeWeight: #center;
		color: (Color transparent).
	^ buttonArea ! !

!BookReviewEditorWindow methodsFor: 'GUI building' stamp: 'jws 4/1/2022 10:09:56'!
reviewEditor

	reviewEditorMorph := TextModelMorph withModel: self model review.
	reviewEditorMorph wrapFlag: true.
	reviewEditorMorph alwaysShowVerticalScrollbar.
	reviewEditorMorph askBeforeDiscardingEdits: false.
	^reviewEditorMorph! !

!BookReviewEditorWindow methodsFor: 'GUI building' stamp: 'jws 4/1/2022 10:08:12'!
titleEntryField
	"Answer a LayoutMoph containing the prompt and text entry area"
	
	| promptMorph entryLayout |
	entryLayout := LayoutMorph newRow.
	promptMorph := (LabelMorph contents: 'Title: ') 
					emphasis: AbstractFont boldCode; 
					yourself.
	promptMorph  layoutSpec: 
		(LayoutSpec fixedWidth: (promptMorph measureContents x)).
	titleMorph := TextModelMorph
		textProvider: model
		textGetter: #title
		textSetter: #title:.
	titleMorph layoutSpec: (LayoutSpec proportionalWidth: 1 fixedHeight: self rowHeight).
	titleMorph acceptOnCR: true.
	titleMorph askBeforeDiscardingEdits: false.
	^ entryLayout 
		separation: self defaultSeparation;
		layoutSpec: (LayoutSpec proportionalWidth: 1 fixedHeight: self rowHeight);
		addMorph: promptMorph;
		addMorph: titleMorph;
		yourself! !

!BookReviewEditorWindow methodsFor: 'actions' stamp: 'jws 4/1/2022 10:09:12'!
accept
	
	self model accept.
	self delete! !

!BookReviewEditorWindow methodsFor: 'actions' stamp: 'jws 3/24/2022 21:30:46'!
cancel
	
	self delete! !

!BookReview methodsFor: 'accessing' stamp: 'jws 3/18/2022 13:17:27'!
review
	"Answer the value of review"

	^ review! !

!BookReview methodsFor: 'accessing' stamp: 'jws 3/18/2022 13:17:27'!
review: anObject
	"Set the value of review"

	review _ anObject! !

!BookReview methodsFor: 'accessing' stamp: 'jws 3/18/2022 13:17:26'!
title
	"Answer the value of title"

	^ title! !

!BookReview methodsFor: 'accessing' stamp: 'jws 3/18/2022 13:17:26'!
title: anObject
	"Set the value of title"

	title _ anObject! !

!BookReview methodsFor: 'visiting' stamp: 'TE 4/3/2022 23:32:52'!
accept: aVisitor

	^aVisitor visitBookReview: self! !

!BookReview class methodsFor: 'instance creation' stamp: 'jws 3/21/2022 21:26:36'!
title: aString
review: aDescription

	^self new
		title: aString;
		review: aDescription;
		yourself! !

!BookReviewDB methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:50:17'!
titled: aTitle

	^self entities values
		detect: [:each | each title = aTitle]
		ifNone: [nil]! !

!BookReviewDB methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:50:23'!
titles

	^self entities values collect: [:each | each title]! !

!BookReviewDB class methodsFor: 'testdb' stamp: 'jws 3/24/2022 21:59:24'!
bookReview1984

	| review |
	review := BookReview
		title: '1984'
		review: 'The clocks were striking 13... it''s all down hill from there.'.
	review uuid: self uuid1984.
	^review! !

!BookReviewDB class methodsFor: 'testdb' stamp: 'jws 3/24/2022 21:59:38'!
bookReviewLesMiz

	| review |
	review := BookReview
		title: 'Les Miserables'
		review: 'A lot of fuss over a piece of toast.'.
	review uuid: self uuidLesMiz.
	^review! !

!BookReviewDB class methodsFor: 'testdb' stamp: 'jws 3/24/2022 21:59:08'!
uuid1984

	^UUID fromString: '338429d4-f91a-4cc8-9ae0-61d0069378fc'! !

!BookReviewDB class methodsFor: 'testdb' stamp: 'jws 3/24/2022 21:58:51'!
uuidLesMiz

	^UUID fromString: '8dc46a25-cfb0-42df-a8d6-a9b9010c53be'! !

!BookReviewDB class methodsFor: 'accessing' stamp: 'jws 3/31/2022 21:48:28'!
populateTestDb

	default
		add: self bookReview1984;
		add: self bookReviewLesMiz! !
