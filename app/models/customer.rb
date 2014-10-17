class Customer < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	mount_uploader :image, ImageUploader

	validates :name, :presence => true,
					 :length => { :within => 10..25 }

	validates :address, :presence => true,
					    :length => { :maximum => 100 }


	validates :company, :presence => true,
					   :length => { :maximum => 50 }
	validates :description, :presence => true,
					       :length => { :maximum => 100 }
end
