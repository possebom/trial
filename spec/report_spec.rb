require 'spec_helper'

describe Report do

	let(:phone_number) { phone_number = '000-0000-0000' }
	
	let(:report) { report = Report.new(phone_number) }

	
	context "validates SMS functions" do 
		
		it "can get total of SMS messages" do 
			expect(report.get_total_SMS).to_not be_nil
		end

		it "can increment SMS messages to total" do
			report.increment_SMS
			expect(report.get_total_SMS).to be > 0
		end

	end


	context "validates local calls functions" do 
		
		it "can get total local calls to mobile phone" do 
			expect(report.get_total_local_mobile_phone).to_not be_nil
		end

		it "can set local call duration to mobile phone" do
			report.set_local_mobile_duration(10.0)
			
			expect(report.get_total_local_mobile_phone).to equal(10.0)
		end


		it "can get total local calls to fixed phone" do 
			expect(report.get_total_local_fixed_phone).to_not be_nil
		end

		it "can set local call duration to fixed phone" do
			report.set_local_fixed_duration(10.0)
			
			expect(report.get_total_local_fixed_phone).to equal(10.0)
		end


		it "validates total of local calls" do
			report.set_local_mobile_duration(10.0)
			report.set_local_fixed_duration(10.0)

			expect(report.get_total_local_calls).to equal(20.0)
		end

	end


	context "validates distance calls functions" do 
		
		it "can get total distance calls to mobile phone" do 
			expect(report.get_total_distance_mobile_phone).to_not be_nil
		end

		it "can set distance call duration to mobile phone" do
			report.set_distance_mobile_duration(10.0)
			
			expect(report.get_total_distance_mobile_phone).to equal(10.0)
		end


		it "can get total distance calls to fixed phone" do 
			expect(report.get_total_distance_fixed_phone).to_not be_nil
		end

		it "can set distance call duration to fixed phone" do
			report.set_distance_fixed_duration(10.0)
			
			expect(report.get_total_distance_fixed_phone).to equal(10.0)
		end

		it "validates total of distance calls" do
			report.set_distance_mobile_duration(10.0)
			report.set_distance_fixed_duration(10.0)

			expect(report.get_total_distance_calls).to equal(20.0)
		end

	end


	context "validates internet data functions" do 
		
		it "can get total of internet data used" do 
			expect(report.get_total_internet_data).to_not be_nil
		end

		it "can increment SMS messages to total" do
			report.set_total_internet_data(15)

			expect(report.get_total_internet_data).to eq(15)
		end

	end


	context "validates report print" do 
		
		it "exists print function" do 
			expect(report.print).to be_truthy
		end

	end

end