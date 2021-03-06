json.array!(@appointments) do |appointment|
  json.extract! appointment, :name, :phone, :email, :time
  json.url appointment_url(appointment, format: :json)
end
