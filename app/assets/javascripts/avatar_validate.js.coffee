jQuery ->
  userAvatar = $('#user_avatar')
  return unless userAvatar.length
  validateSize = () ->
    sizeInMegabytes = @files[0].size/1024/1024
    if sizeInMegabytes > 1
      alert('Maximum file size is 1MB. Please choose a smaller file.')
  userAvatar.bind 'change', validateSize
