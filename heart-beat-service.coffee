bleno = require 'bleno'
HeartRateCharacteristic = require './heart-rate-characteristic'

class HeartBeatService extends bleno.PrimaryService
  constructor: (monitor) ->
    super {
      uuid: '180d'
      characteristics: [
        new HeartRateCharacteristic monitor
      ]
    }

module.exports = HeartBeatService
