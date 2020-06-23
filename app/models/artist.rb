class Artist < User
    validates :first_name, :last_name, :interests, presence: true
end
