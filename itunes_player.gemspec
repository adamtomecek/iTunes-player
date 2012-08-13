Gem::Specification.new do |s|
	s.name = 'itunes_player'
	s.version = '0.0.1'
	s.date = '2012-08-13'
	s.summary = "Terminal iTunes controller"
	s.description = "Simple terminal iTunes controller using Ruby Curses"
	s.authors = ["Adam Tomeček"]
	s.email = "adam.tomecek@gmail.com"
	s.files = [
		"bin/itunes_player",
	   	"lib/itunes_player.rb",
	   	"spec/spec_helper.rb",
	   	"spec/itunes_player_spec.rb"
	]
	s.executables = ["itunes_player"]
	s.default_executable = "itunes_player"
	s.test_files = ["spec/spec_helper.rb", "spec/itunes_player_spec.rb"]
	s.require_paths = ["lib"]
end
