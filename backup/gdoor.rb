
# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '10s', :first_in => 0 do |job|
  mote = { id:"SS_Garage", light:"red", status:"OPEN", action:"CLOSE" }
  msg = "Open " + Time.now().to_i.to_s;

  send_event('98', { mote: mote, logmsg: msg })
end
