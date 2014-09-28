# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '10s', :first_in => 0 do |job|
  moment = { id: "SS_Alarm", date: "2014-09-19 05:30", status: "READY", light:"green", throb: false }
  msg = [ "READY", "ALARM", "ZONE 1", "FIRE" ]

  send_event('20', { mote: moment, msgs: msg })
end
