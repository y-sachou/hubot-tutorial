module.exports = (robot) ->
  robot.hear /おみくじ/i, (msg) ->
    msg.reply msg.random ["大吉", "中吉", "小吉", "凶"]
