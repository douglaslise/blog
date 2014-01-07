class Post < ActiveRecord::Base
  has_many :comentarios
  
  validates :titulo, presence: true, uniqueness: true

  validates :texto,  presence: true

end
