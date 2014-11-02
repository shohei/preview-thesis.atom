module.exports =
class PreviewThesisView
  constructor: (serializeState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('preview-thesis',  'overlay', 'from-top')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The PreviewThesis package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

    # Register command that toggles this view
    atom.commands.add 'atom-workspace', 'preview-thesis:show': => @show()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  # Toggle the visibility of this view
  show : ->
    console.log 'PreviewThesisView was showed!'

    if @element.parentElement?
      @element.remove()
    else
      atom.workspaceView.append(@element)
