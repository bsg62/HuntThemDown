HuntThemDown.Offenses = ($scope, $http)->

  $scope.getVictims = ->
    $http.get('/victims.json').then((result)->
      victims = []

      angular.forEach(result.data, (item)->
        victims.push(item.name)
      )

      victims
    )
