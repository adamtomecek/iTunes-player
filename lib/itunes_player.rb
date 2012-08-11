# encoding : utf-8

require 'curses'

include Curses

class ITunesPlayer

	def get_menu
		items = Array.new
		items.push "Play"
		items.push "Pause"
		items.push "Next"
		items.push "Previous"

		return items
	end

	def draw_menu
		items = get_menu

		win = Window.new(items.count + 4, 20, (lines - items.count )/  2, 
						 (cols - 10) / 2)

		items.each do |item|
			win.addstr(item + "\n")
		end
		
		win.refresh
		win.close
	end

	def get_key
		ch = getch

		return true if ch == KEY_UP

		return false
	end
end

p = ITunesPlayer.new

init_screen

begin
	init_screen
	crmode
	raw
	noecho
	p.draw_menu
	while(p.get_key)
		p.draw_menu
	end
ensure
	close_screen
end
