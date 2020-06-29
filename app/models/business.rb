class Business < User

    validates :business_name, presence: true

    has_many :applications, through: :contests, source: :contest_applications


end
