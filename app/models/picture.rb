class Picture < ActiveRecord::Base
	scope :newest_first, -> { order("created_at DESC") }
	scope :most_recent_five, -> { newest_first.limit(5) }
	scope :created_before, ->(time) { where("created_at < ?", time) }
	has_attached_file :pixfile, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/aws.yml", :s3_permissions => :public_read_write, :path => "/images/:id/:filename"
  	validates_attachment_content_type :pixfile, :content_type => /\Aimage\/.*\Z/

	def self.created_before(time)
		where("created_at < ?", time)
	end
end
