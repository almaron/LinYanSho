@app.controller "WrapperCtrl", ["$scope", "$cookies", "currentUser", "News", "BlogPost", ($scope, $cookies, currentUser, News, BlogPost) ->

  $scope.currentUser = {}

  $scope.fontSizes = ["8px","10px","12px","14px","16px","18px","20px"]
  $scope.currentFont = $cookies.currentFont || "14px"

  $scope.initWrapper = ->
    $scope.currentUser = currentUser.get()
    $scope.currentUser.default_char = {name:""} unless $scope.currentUser.default_char
    $scope.wrapBlog = BlogPost.query {limit:4}
    $scope.updateMainNews()

  $scope.updateMainNews = ->
    $scope.wrapNews = News.query {limit:4}

  $scope.decFont = ->
    int = $scope.fontSizes.indexOf($scope.currentFont)
    $cookies.currentFont = $scope.currentFont = $scope.fontSizes[int-1] unless int == 0

  $scope.incFont = ->
    int = $scope.fontSizes.indexOf($scope.currentFont)
    $cookies.currentFont = $scope.currentFont = $scope.fontSizes[int+1] unless int == $scope.fontSizes.length - 1

  $scope.dropFont = ->
    $cookies.currentFont = $scope.currentFont = "14px"

]