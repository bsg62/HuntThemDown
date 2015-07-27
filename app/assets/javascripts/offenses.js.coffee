class OffenseController
  @$inject = ['$scope', '$http']

  constructor: (@$scope, @$http) ->

  getVictims: ->
    @$http.get('/victims.json').then((result)->
      victims = []

      angular.forEach(result.data, (item)->
        victims.push(item.name)
      )

      victims
    )

angular.module('HuntThemDown').controller('HuntThemDown.OffenseController', OffenseController)