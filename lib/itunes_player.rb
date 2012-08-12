# encoding : utf-8

require 'curses'

include Curses

PLAY = 0
PAUSE = 1
NEXT = 2
PREV = 3

class ITunesPlayer

	def run
		init_screen
		noecho
		cbreak
		create_menu
		refresh
		close_screen
	end

	def get_menu_items
		items = Array.new
		items[PLAY] = "Play"
		items[PAUSE] = "Pause"
		items[NEXT] = "Next"
		items[PREV] = "Previous"

		return items
	end

	def create_menu
		highlight = 1
		choice = 0
		menu_items = get_menu_items
		choices_count = menu_items.count

		win = Window.new(menu_items.count + 4, 20, (lines - menu_items.count )/  2, 
						 (cols - 10) / 2)

		win.keypad(true)
		refresh

		print_menu(win, highlight)

		while 1
			key = win.getch
			
			highlight = react_to_key(key, highlight, choices_count)

			break if highlight == false

			print_menu(win, highlight)
		end

		clrtoeol
		refresh
		win.close
	end

	def react_to_key(key, highlight, choices_count)
		case key
		when KEY_UP
			if highlight == 1
				h = choices_count
			else
				h = highlight - 1
			end
		when KEY_DOWN
			if highlight == choices_count
				h = 1
			else
				h = highlight + 1
			end
		when 10
			h = highlight
			control_itunes(h - 1)
		when 27
			return false
		else
			h = highlight
		end

		return h
	end

	def control_itunes(option)
		case option
		when PLAY
			%x[echo 'tell application "iTunes" to play' | osascript]
		when PAUSE
			%x[echo 'tell application "iTunes" to pause' | osascript]
		when NEXT
			%x[echo 'tell application "iTunes" to play next track' | osascript]
		when PREV
			%x[echo 'tell application "iTunes" to play previous track' | osascript]
		else
			return false	
		end

		return true

	end

	def print_menu(win, highlight)
		win.clear
		win.box(0, 0)
		items = get_menu_items

		items.each_with_index do |item, index|
			win.setpos(index + 2, 6)
			if highlight == index + 1
				win.attron(A_REVERSE)
				win.addstr(item)
				win.attroff(A_REVERSE)
			else
				win.addstr(item)
			end
		end

		win.refresh
	end
end

