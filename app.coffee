names   = []
isRolling = false
$toggle = $('#btn-toggle')
$name   = $('#name')
handler = null

enable = (x) -> x.removeAttr('disabled')
disable = (x) -> x.attr('disabled', 1)
readInterval = ->
  intvl = parseInt $('#interval').val()
  intvl = 100  if isNaN intvl
  intvl
refresh = -> $name.html names[Math.floor(Math.random() * names.length)]
toggler = ->
  if isRolling
    clearInterval handler
    isRolling = false
    $(this).val 'Start'
  else
    handler = setInterval refresh, readInterval()
    isRolling = true
    $(this).val 'Stop'
  $(this).toggleClass('success').toggleClass('alert')

$ ->
  $('.hint').delay(3000).fadeOut()
  $('body').keypress (e) -> toggler() if e.which == 32

$('#btn-init').click ->
  names = $('#namelist').val().split('\n').filter (x) -> x != ''
  $name.html 'Ready to Go!'
  enable $toggle
  enable $('#btn-toggle-aside')

$('#btn-toggle-aside').click ->
  $('#aside-wrapper').fadeToggle()

$('#btn-toggle').click toggler
