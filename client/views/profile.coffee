Template.profile.rendered = ->
  $('textarea').keydown( (event) ->
    if event.keyCode == 13
      $(event.target).blur()
  )

Template.profile.helpers
  email:         -> Meteor.user().emails[0].address if Meteor.user().emails?
  name:          -> Meteor.user().profile.name
  username:          -> Meteor.user().profile.username
  organization:  -> Meteor.user().profile.organization
  location:      -> Meteor.user().profile.location
  bio:           -> Meteor.user().profile.bio
  embedCSS:           -> Meteor.user().profile.embedCSS
  url:           -> Meteor.user().profile.url
  googlePlusUrl: -> Meteor.user().profile.googlePlusUrl
  twitterHandle: -> Meteor.user().profile.twitterHandle

Template.profile.events
  'click .done': ->
    if Meteor.user().profile.name
      Router.go('/')
    else
      $('.errors').text('Name is required.')

  'change #email': (event) ->
    Meteor.call('changeEmail', Meteor.userId(), $(event.target).val())

  'change #name': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.name': $(event.target).val()
  
  'change #username': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.username': $(event.target).val()

  'change #organization': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.organization': $(event.target).val()

  'change #location': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.location': $(event.target).val()

  'change #bio': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.bio': $(event.target).val()

  'change #embed-css': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.embedCSS': $(event.target).val()

  'change #url': (event) ->
    url = $(event.target).val()
    if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
      url = 'http://' + url
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.url': url
