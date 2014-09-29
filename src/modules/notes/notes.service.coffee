require 'common/data/pouch'
app = angular.module 'notes.service', []
app.factory 'notesService', (datastore) ->
  {
    createNote: (note) -> 
      note._id = new Date().toISOString()
      datastore.db().put(note)
        .then (note) ->
          datastore.db().get(note.id)

    getNotes: ->
      datastore.db().allDocs({include_docs: true})
        .then (docs) ->
          return docs
        .catch (err) ->
          console.error err
  }


