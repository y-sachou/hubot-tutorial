module.exports = (robot) ->   
  robot.hear /天気(を)?教え/i, (msg) ->
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      forecast = json['forecasts'][1]['telop']
      msg.reply "明日の東京の天気は「#{forecast}」です"
