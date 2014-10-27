# require '!pouchdb'

app = angular.module 'pouchdb.datastore', []
app.factory "datastore", ($log, config, $rootScope) -> 
  db = null

  return {
    db: -> 
      if db
        return db

      errorBack = (err) ->
        $log.error(err)

      db = new PouchDB 'hashmarks' 
      db.replicate.to config.couchdb.hosts[0] + '/hashmarks', {live: true}, errorBack
      db.replicate.from config.couchdb.hosts[0] + '/hashmarks', {live: true}, errorBack
      # db.$db.replicate.from config.couchdb.hosts[0] + '/nts', {live: true}
      db.info (err, info) ->
        db.changes
          since: info.update_seq
          live: true
        .on 'change', (change) -> 
          console.log change
          console.log 'changes - sync'
          # $rootScope.$emit 'sync:change', true
          $rootScope.$broadcast 'sync:change', true
          # $rootScope.$apply()
        .on 'error', (err) ->
          $log.error(err)
      
      db
    }
