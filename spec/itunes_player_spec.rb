require File.expand_path('spec/spec_helper')

describe ITunesPlayer do
	describe "#get_menu" do
		it 'returns menu items' do
			menu = subject.get_menu_items

			menu.should be_instance_of Array
			menu[2].should be_instance_of String
		end

		it 'has textual menu items' do
			menu = subject.get_menu_items
			menu.each do |item|
				item.should be_instance_of String
			end
		end
	end

	describe "#react_to_key" do
		it 'reacts to up key' do
			return_value = subject.react_to_key(KEY_UP, 2, 2)
			return_value.should == 1
		end

		it 'reacts to down key' do
			return_value = subject.react_to_key(KEY_DOWN, 1, 2)
			return_value.should == 2
		end

		it 'reacts to enter key' do
			return_value = subject.react_to_key(10, 1, 1)
			return_value.should == 1
		end

		it 'reacts to escape key' do
			return_value = subject.react_to_key(27, 1, 1)
			return_value.should == false
		end

		it 'not reacts to other keys' do
			return_value = subject.react_to_key(999, 2, 1)
			return_value.should == 2
		end
	end

	describe "#control_itunes" do
		it 'returns true on valid option' do
			subject.control_itunes(PLAY).should == true
		end
		it 'returns false on invalid option' do
			subject.control_itunes(999).should == false
		end
	end
end
