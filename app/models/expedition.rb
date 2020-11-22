class Expedition < ApplicationRecord
    has_attached_file :picture
    validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    belongs_to :user
    has_many :harvests
    has_many :items, through: :harvests
    accepts_nested_attributes_for :harvests, reject_if: proc { |attributes| attributes['amount'].blank? }

    validates :location_name, :street, :street_number, :zipcode, :city, :state, :country, presence: true

    scope :location_group, -> { order("location_name")}

    #Geocoder macro and validator for google maps 
    before_save :set_address
    geocoded_by :address
    before_save :geocode

    def set_address
      self.address = [street_number, street, zipcode, city, state, country].join(',')
    end
end
