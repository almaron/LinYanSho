@app.controller "GuestBookCtrl", ["$scope","$window","GuestPost", ($scope, $window, GuestPost) ->

  $scope.guestPagination = {}

  $scope.initPosts = (page=1) ->
    $scope.guestPagination.cur = page
    $scope.getTotal()

  $scope.loadPosts = (page) ->
    $scope.posts = GuestPost.query({page:page})
    $scope.resetPost()

  $scope.resetPost = ->
    $scope.newPost = GuestPost.reset()

  $scope.createPost = (post) ->
    post = GuestPost.save({guest_post:post}, ->
      $scope.posts.unshift post
      $scope.resetPost()
      $scope.getTotal()
    )

  $scope.updatePost = (post) ->
    ind = $scope.posts.indexOf(post)
    $scope.posts[ind] = GuestPost.update({id:post.id, guest_post:post})

  $scope.removePost = (post) ->
    ind = $scope.posts.indexOf(post)
    GuestPost.delete({id:post.id}, ->
      $scope.posts.splice(ind,1)
    )
    $scope.getTotal()

  $scope.$watch 'guestPagination.cur', (newVal) ->
    if typeof newVal != 'undefined'
      $scope.loadPosts newVal
#      $window.history.pushState({controller:"guestbook", action:"index", page:newVal},"","/guestbook?page="+newVal)

  $scope.getTotal = ->
    data = GuestPost.get_total {}, ->
      $scope.guestPagination.total = data.total
]