class CollaborativeEditorPane extends CollaborativePane

  @cdnRoot = cdnRoot = "https://koding-cdn.s3.amazonaws.com/codemirror/latest"

  constructor: (options = {}, data) ->

    super options, data

    @container.on "viewAppended", =>
      @createEditor =>
        @ref        = @workspace.firebaseRef.child @sessionKey
        @firepad    = Firepad.fromCodeMirror @ref, @codeMirrorEditor

        @firepad.on "ready", =>
          if @firepad.isHistoryEmpty() # fix for a firepad bug
            @firepad.setText " "
            @firepad.setText ""
          @codeMirrorEditor.scrollTo 0, 0
          {file, content} = @getOptions()
          @emit 'ready'
          return @openFile file, content  if file

        if @amIHost
          @ref.on "value", (snapshot) =>
            value = @workspace.reviveSnapshot snapshot
            return unless value
            if value.WaitingSaveRequest is yes
              return @save()

  openFile: (file, content) ->
    @setData file
    isLocalFile = file.path.indexOf("localfile") is 0
    content     = "" if @amIHost and isLocalFile

    if @amIHost and not @getOptions().useFirepadContent
      @firepad.setText content

    @codeMirrorEditor.scrollTo 0, 0
    @emit "OpenedAFile", file, content
    @setEditorMode file.getExtension()

  save: ->
    file        = @getData()
    isValidFile = file instanceof FSFile and file.path.indexOf("localfile") is -1

    if @amIHost
      return warn "no file instance to handle save as" unless isValidFile

      @ref.child("WaitingSaveRequest").set no
      file.save @firepad.getText(), (err, res) =>
        @workspace.broadcastMessage
          title : "#{file.name} is saved"
          sender: ""
    else
      @ref.child("WaitingSaveRequest").set yes

    @getOptions().saveCallback? @panel, @workspace, file, @firepad.getText()
    @emit "EditorDidSave"

  getValue: ->
    return @codeMirrorEditor.getValue()

  setValue: (value) ->
    @codeMirrorEditor.setValue value

  createEditor: (callback)->

    @codeMirrorEditor = CodeMirror @container.getDomElement()[0],
      lineNumbers     : yes
      scrollPastEnd   : yes
      mode            : "htmlmixed"
      extraKeys       :
        "Cmd-S"       : @bound "handleSave"
        "Ctrl-S"      : @bound "handleSave"

    @setEditorTheme()
    @setEditorMode 'html'

    callback?()

  handleSave: ->
    @save()
    @workspace.addToHistory
      message: "$0 saved #{@getData().name}"
      by     : KD.nick()

  setEditorTheme: (theme = 'ambiance')->

    styleId = "codemirror-#{theme}-style"

    unless document.getElementById styleId
      link       = document.createElement "link"
      link.rel   = "stylesheet"
      link.type  = "text/css"
      link.href  = "#{cdnRoot}/theme/#{theme}.css"
      link.id    = styleId
      document.head.appendChild link

    @codeMirrorEditor.setOption "theme", theme

  setEditorMode:(fileExtension) ->

    return  unless fileExtension

    CodeMirror.modeURL = "#{cdnRoot}/mode/%N/%N.js"
    syntaxHandler      = __aceSettings.syntaxAssociations[fileExtension]
    modeName           = "htmlmixed"
    corrections        =
      html             : "htmlmixed"
      json             : "javascript"
      js               : "javascript"
      go               : "go"
      coffee           : "coffeescript"

    if corrections[fileExtension]
      modeName = corrections[fileExtension]
    else if syntaxHandler
      modeName = syntaxHandler[0].toLowerCase()

    if modeName
      @codeMirrorEditor.setOption "mode", modeName
      CodeMirror.autoLoadMode @codeMirrorEditor, modeName
