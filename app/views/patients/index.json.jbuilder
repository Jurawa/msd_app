json.array!(@patients) do |patient|
  json.extract! patient, :id, :reg_no, :birth_year, :gender
  json.url patient_url(patient, format: :json)
end
