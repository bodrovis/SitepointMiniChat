source = new EventSource('/comments')

source.onmessage = (event) ->
  $('#comments').find('.media-list').prepend($.parseHTML(event.data))

#  comment_template = _.template($('#comment_temp').html())
#  comment = $.parseJSON(event.data)
#  if comment
#    $('#comments').find('.media-list').prepend(comment_template( {
#      body: comment['body']
#      user_name: comment['user_name']
#      user_avatar: comment['user_avatar']
#      user_profile: comment['user_profile']
#      timestamp: comment['timestamp']
#    } ))

jQuery ->
  $('#new_comment').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)

  return