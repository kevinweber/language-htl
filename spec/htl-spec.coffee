describe 'HTL grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-htl')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.htl.aem')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'source.htl.aem'

  it 'is attribute prefixed with "data-sly-"', ->
    tokens = grammar.tokenizeLines '''
      data-sly-attribute
      data-sly-call
      data-sly-element
      data-sly-include
      data-sly-list
      data-sly-repeat
      data-sly-resource
      data-sly-test
      data-sly-text
      data-sly-template
      data-sly-use
      data-sly-unwrap
    '''
    expect(tokens[0]).toEqual value: 'data-sly-', scopes: ['source.htl.aem', 'entity.other.attribute-name.html']

  it 'is member of a list', ->
    tokens = grammar.tokenizeLines '''
      index
      count
      first
      middle
      last
      odd
      even
    '''
