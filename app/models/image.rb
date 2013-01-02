# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

class Image < ActiveRecord::Base
  attr_accessible :attachment
  belongs_to :user

  has_attached_file :attachment, :styles => { :small => "300x300>" }
  validates :user_id, presence: true
  validates_attachment :attachment, presence: true,
    :size => { :in => 0..5.megabytes }
end
