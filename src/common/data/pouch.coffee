require 'bower/pouchdb/dist/pouchdb-nightly'
require '!bower/angular-pouchdb/angular-pouchdb'

app = angular.module 'pouchdb.datastore', ['pouchdb']
app.factory "datastore", (pouchdb) -> 
  {
    db: -> 
      pouchdb.create('nts')
  }


