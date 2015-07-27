class TwoFactorAuthController
  @$inject = ['$scope']

  constructor: (@$scope) ->
    @$scope.otp = null

  isFormSubmittable: ->
    @$scope.otp && /^\d{6}$/.test(@$scope.otp)


angular.module('HuntThemDown').controller('HuntThemDown.TwoFactorAuthController', TwoFactorAuthController)