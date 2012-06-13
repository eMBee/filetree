"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"prime the pump with FileTree install using Metacello scripting API"
Metacello new
	baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  load.

"load the file tree tests"
Metacello new
	baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
	load.

"Run the tests"
TravisCIHarness
  value: #( 'FileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
