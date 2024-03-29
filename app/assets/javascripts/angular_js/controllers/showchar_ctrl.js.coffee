@app.controller "ShowCharCtrl", [ "$scope", "$http", "Char", ($scope, $http, Char) ->


  $scope.loadChar = (char_id) ->
    char = Char.get {id: char_id}, ->
      $scope.char = char
      $scope.smallUpdatePath = "/chars/"+char.id+"/small_update.json"

  $scope.openEditChar = (page) ->
    $scope.editChar = page || "points"
    $scope.editForm = {
      sign: 1,
      person: $scope.char.profile.person,
      comment: $scope.char.profile.comment
    }

  $scope.updatePoints = ->
    value = $scope.editForm.value * $scope.editForm.sign
    $http.post(
      $scope.smallUpdatePath, {field:"points", value:value}
    ).success (data) ->
      $scope.char.profile.points = data.value
      $scope.editForm = {}
      $scope.editChar = null

  $scope.updatePerson = ->
    $http.post(
      $scope.smallUpdatePath, {field:"person", person:$scope.editForm.person}
    ).success (data) ->
      $scope.char.profile.person = data.value
      $scope.editForm = {}
      $scope.editChar = null

  $scope.updateComment = ->
    $http.post(
      $scope.smallUpdatePath, {field:"comment", comment:$scope.editForm.comment}
    ).success (data) ->
      $scope.char.profile.comment = data.value
      $scope.editForm = {}
      $scope.editChar = null

  $scope.editSkills = (skill_type) ->
    if skill_type == 'phisic'
      $scope.skillForm = {head: "Навыки"}
      $scope.skillForm.skills = $scope.char.phisic_skills
    else
      $scope.skillForm = {head: "Способности"}
      $scope.skillForm.skills = $scope.char.magic_skills
    $http.get('/skills/'+skill_type+'.json?char_id='+$scope.char.id).success (data) ->
      $scope.skillForm.addSkills = data
      $scope.editChar = 'skills'

  $scope.addSkill = ->
    $http.post('/chars/'+$scope.char.id+'/request_skill/'+$scope.skillForm.addSkill+'.json').success(
      (data) ->
        $scope.modalText = data.success
        $scope.modalClass = 'accept'
        $scope.modalShown = true
    ).error(
      (data) ->
        $scope.modalText = data.failure
        $scope.modalClass = 'decline'
        $scope.modalShown = true
    )

]