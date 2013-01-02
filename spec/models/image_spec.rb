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

require 'spec_helper'

describe Image do
    let(:user) { FactoryGirl.create(:user) }
    before { @image = user.images.build } 

    subject { @image }

    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should == user }

    describe "accessible attributes" do
        it "should not allow access to user_id" do
            expect do
                Image.new(user_id: user.id)
            end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
        end    
    end
    
    describe "when user_id is not present" do
        before { @image.user_id = nil }
        it { should_not be_valid }
    end
end
