bleno = require 'bleno'

class HeartRateCharacteristic extends bleno.Characteristic
  constructor: (monitor) ->
    super {
      uuid: '2a37'
      properties: ['read']
      descriptors: [
        new bleno.Descriptor {
          uuid: '2a37'
          value: 'Heart Beat Beat'
        }
      ]
    }

  onReadRequest: (offset, callback) =>
    console.log 'onReadRequest', offset
    data = new Buffer 2
    data.writeUInt16BE 50, 0
    callback @RESULT_SUCCESS, data

module.exports = HeartRateCharacteristic
