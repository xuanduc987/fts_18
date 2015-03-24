secondToHHMMSS = (seconds) ->
  date = new Date seconds * 1000
  hh = date.getUTCHours()
  mm = date.getUTCMinutes()
  ss = date.getSeconds()
  hh = "0"+hh if hh < 10
  mm = "0"+mm if mm < 10
  ss = "0"+ss if ss < 10
  hh+":"+mm+":"+ss

secondFromHHMMSS = (s) ->
  time = s.split ':'
  hours = parseInt time[0], 10
  minutes = parseInt time[1], 10
  seconds = parseInt time[2], 10
  hours * 3600 + minutes * 60 + seconds

jQuery ->
  timeLeft = $('#time_left')
  examTimer = $('div.exam-timer')
  form = $('form.edit_examination')
  return if !timeLeft.length || !form.length
  seconds = secondFromHHMMSS timeLeft.text()
  timeTick = () ->
    seconds = seconds - 1
    if seconds < 0
      clearInterval id
      return
    examTimer.css 'color', 'red' if seconds < 60
    timeLeft.text secondToHHMMSS(seconds)
    form.submit() if seconds == 3
  id = setInterval timeTick, 1000
