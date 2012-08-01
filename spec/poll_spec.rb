require 'spec_helper'

describe Poll do

	let (:poll) { Poll.create( title: "Sample", public_url: "My Great Poll!") }

	describe "validations" do
		it { should validate_presence_of(:title) }
		it do 
			sample_poll = Poll.create!(title: "Sample", public_url: "")
			sample_poll.should validate_uniqueness_of(:public_url)
		end
	end

	describe "relationships" do
		it { should have_many(:questions) }
		it { should have_many(:responses) }
	end

	describe "callbacks" do
		describe "#parameterize_url" do
			it "parameterizes the public url, if given" do
				poll.public_url.should eq "my-great-poll"
			end
		end

		describe "#generate_urls" do
			it "generates a public_url for the poll, if not given" do
				humble_poll = Poll.create(title: "Humble poll", public_url: "" )
				humble_poll.public_url.length.should be > 3
			end

			# it "checks to make sure the randomly generated url is unique" do
			# 	Settings::POLL_NAMES.stub(:[]).and_return("manoa")
			# 	Poll.should_receive(:rand).and_return(77)
			# 	blank_poll = Poll.create( title: "Sample" )
			# 	blank_poll.public_url.should eq "manoa77"
			# 	another_poll = Poll.create( title: "Sample 2" )
			# 	another_poll.public_url.should_not eq "manoa77"
			# end

			it "assigns a random 16 character string for the edit_url" do
				poll.edit_url.length.should eq 16
			end
		end
	end

end