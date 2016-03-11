class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>" },
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
                    :dropbox_options => {
                        :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"},
                        :unique_filename => true},
                        :dropbox_visibility => 'public'
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  end
