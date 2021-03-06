Template.userCard.helpers
  name: ->
    if @profile.firstName && @profile.lastName
      "#{@profile.firstName} #{@profile.lastName}"
    else
      @profile.name

  subhead: ->
    if @profile.organization && @profile.location
      [@profile.organization, @profile.location].join(' - ')
    else
      if @profile.organization
        return @profile.organization
      if @profile.location
        return @profile.location

  avatar: -> @profile.avatar
  bio: -> @profile.bio
  url: -> @profile.url

