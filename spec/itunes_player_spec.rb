require File.expand_path('spec/spec_helper')

describe ITunesPlayer do
	describe "#get_menu" do
		it 'returns menu items' do
			player = ITunesPlayer.new
			menu = player.get_menu

			menu.should be_instance_of Array
			menu[2].should be_instance_of String
		end

		it 'has textual menu items' do
			menu = subject.get_menu
			menu.each do |item|
				item.should be_instance_of String
			end
		end
	end
end
