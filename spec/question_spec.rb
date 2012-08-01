require 'spec_helper'

describe Question do

	describe "Validations" do
		it { should validate_presence_of(:prompt) }
	end

	describe "Relationships" do
		it { should belong_to(:poll) }
		it { should have_many(:answers) }
	end

end