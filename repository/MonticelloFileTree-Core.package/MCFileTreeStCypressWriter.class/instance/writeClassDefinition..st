writing
writeClassDefinition: definition
  | properties |
  properties := Dictionary new.
  properties at: 'name' put: definition className.
  properties at: 'super' put: definition superclassName.
  properties at: 'category' put: definition category encodeAsUTF8 asString.
  properties at: 'instvars' put: definition instVarNames asArray.
  properties at: 'classvars' put: definition classVarNames asArray.
  properties at: 'pools' put: definition poolDictionaries asArray.
  properties at: 'classinstvars' put: definition classInstVarNames asArray.
  definition type isArray
    ifTrue: [ properties at: 'type' put: definition type ]
    ifFalse: [ properties at: 'type' put: definition type asString ].
  properties at: 'commentStamp' put: definition commentStamp.
  properties writeCypressJsonOn: fileStream