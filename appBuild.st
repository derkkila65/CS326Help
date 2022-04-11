| list browser workspace |
"Delete all windows but the taskbar"
list := UISupervisor ui submorphs
	reject: 
		[:aMorph |
		aMorph is: #TaskbarMorph].
list do: [:each | each delete].

"Load required code"
Feature require: 'CS326-Core'.

"Setup app Launcher"
AppLauncher
	appGlobalName: #BookReviewBrowser
	appSelector: #open.

"Save and Quit"
Smalltalk
	saveAndQuitAs: 'bermApp'
	clearAllClassState: false.