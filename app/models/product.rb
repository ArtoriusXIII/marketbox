class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x", thumb: "100x100>" }, default_url: "No_Image.png",
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :path => ":style/:id_:filename"
                
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :description, :price, presence: true
  
  belongs_to :user
  has_many :orders
end
    

