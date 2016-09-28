(function () {

  'use strict';

  angular.module('app', ['ngResource', 'ngMaterial'])
    .controller('appController', [
      '$http', '$mdToast',
      function ($http, $mdToast) {
        var vm = this;
        vm.step = 1;

        vm.next = function () {
          $http.get('/site/get/' + vm.name).then(function (response) {
            vm.primary = response.data.primary;
            vm.secondary = response.data.secondary;
            vm.background = response.data.background;
            vm.link = window.location.origin + '/sites/' + vm.name + '/index.html';
            vm.step = 2;
          });
        };
        vm.save = function () {
          if(vm.primary && vm.secondary && vm.background) {
            var params = { primary: vm.primary, secondary: vm.secondary, background: vm.background}
            $http.put('/site/update/' + vm.name, params).then(function () {
              $mdToast.show(
                $mdToast.simple()
                  .textContent('Updated')
                  .hideDelay(3000)
              );
            });
          }
        };
        vm.back = function () {
          vm.step = 1;
        };
      }
    ]);
})();