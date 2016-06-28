module.exports = (robot) ->
  robot.respond /hello/, (msg) ->
    msg.send "hi!!"
