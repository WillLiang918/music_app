class Track < ActiveRecord::Base

  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :ablum_id,
    primary_key: :id
  )
end
