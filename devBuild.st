| list workspace |
"Delete all windows but the taskbar"
list := UISupervisor ui submorphs 
	reject: 
		[:aMorph |
   		aMorph is: #TaskbarMorph].
list do: [:each | each delete].

"Open windows for the developer."
workspace := Workspace openWorkspace.
workspace model actualContents: 'Date today.
Time now.
BookReviewBrowser open.

"Load all the application code."
Feature require: ''CS326-Tests-Core''.
Feature require: ''CS326-BookReviews''.
Feature require: ''CS326-Tests-BookReviews''.'.

"Save the Development image."
Smalltalk 
	saveAndQuitAs: 'CS326Dev' 
	clearAllClassState: false.