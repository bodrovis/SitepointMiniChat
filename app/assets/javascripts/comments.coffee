window.client = new Faye.Client('/faye')

client.subscribe '/comments', (payload) ->
  $('#comments').find('.media-list').prepend(payload.message) if payload.message

jQuery ->
  $('#new_comment').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)