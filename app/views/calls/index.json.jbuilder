json.array!(@calls) do |call|
  json.extract! call, :id, :incoming, :outgoing, :call_date, :call_time, :extension, :dial_number, :ring, :duration, :acc_code, :cd, :cost
  json.url call_url(call, format: :json)
end
