{WorkspaceView} = require 'atom'
PreviewThesis = require '../lib/preview-thesis'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "PreviewThesis", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('preview-thesis')

  describe "when the preview-thesis:show event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.preview-thesis')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'preview-thesis:show'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.preview-thesis')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'preview-thesis:show'
        expect(atom.workspaceView.find('.preview-thesis')).not.toExist()
