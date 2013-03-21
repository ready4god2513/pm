app = angular.module("Nomad", ["ngResource"])

app.factory "Story", ($resource) ->
    $resource("/api/v1/stories/:id", {id: "@id"}, {update: {method: "PUT"}})

@StoryCtrl = ($scope, Story) ->
    $scope.loading = true
    $scope.stories = Story.query ->
        $scope.loading = false
    