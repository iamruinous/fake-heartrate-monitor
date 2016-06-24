bleno = require 'bleno'
HeartBeatService = require './heart-beat-service'

bleno.on 'stateChange', (state) =>
  return unless state == 'poweredOn'

  bleno.startAdvertising 'HeartBeatBeat', ['180d'], (error) =>
    throw error if error?

  bleno.on 'advertisingStart', (error) =>
    throw error if error?
    console.log 'startAdvertising'
    bleno.setServices [ new HeartBeatService ]

  bleno.on 'accept', console.log
  bleno.on 'rssiUpdate', console.log
  bleno.on 'disconnect', console.log

  bleno.on 'servicesSet', console.log
  bleno.on 'servicesSetError', console.log
