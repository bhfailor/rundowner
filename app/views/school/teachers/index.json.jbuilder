json.array!(@school_teachers) do |school_teacher|
  json.extract! school_teacher, :id, :name
  json.url school_teacher_url(school_teacher, format: :json)
end
