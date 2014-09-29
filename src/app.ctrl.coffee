ntsCtrl = (notesService) ->
  @message = 'Yes Blud!'
  @notes = []
  @note = {}

  notesService.getNotes()
    .then (notes) =>
      console.log notes
      @notes = notes.rows


  @createNote = (note) =>
    notesService.createNote note
      .then (newNote) =>
        @notes.push(newNote)

  return
  

module.exports = ntsCtrl
