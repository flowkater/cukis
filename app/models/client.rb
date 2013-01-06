class Client < User
	has_many :dayclasses, dependent: :destroy
end