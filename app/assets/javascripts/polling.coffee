window.Poller = {
  poll: (timeout) ->
    if timeout is 0
      Poller.request()
    else
      this.pollTimeout = setTimeout ->
        Poller.request()
      , timeout || 5000
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    first_id = $('.comment').first().data('id')
    $.get('/comments', after_id: first_id)
}

jQuery ->
  Poller.poll() if $('#comments').size() > 0
  return