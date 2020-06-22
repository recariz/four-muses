class Business < User
    validates :business_name, presence: true
end
