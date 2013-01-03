require 'cinch'

if ARGV.count < 3
  puts "IRCPiLedOn - An IRC Notifier for your LedBorg-equipped Raspberry Pi"
	puts "Usage: ./irc_notifier.rb <nick_to_notify> <server_url> <channel> <channel_password(optional)>"
	exit
end

notify_user = ARGV[0]
server_url = ARGV[1]
channel = ARGV[2]
channel_password = ARGV[3] unless ARGV.size == 3

# The possible LED colors for the LedBorg
# The colors are RGB based, with 0 for off, 1 for 50%, and 2 for 100%
led_colors = ["000", "001", "002", "010", "011", "012", "020", "021", "022",
	"100", "101", "102", "110", "111", "112", "120", "121", "122",
	"200", "201", "202", "210", "211", "212", "220", "221", "222"]

def set_led (color)
	`echo "#{color}" > /dev/ledborg`
end

# Reset the LED
set_led "000"

bot = Cinch::Bot.new do
  configure do |c|
    c.server = server_url
    c.channels = [channel]
    c.password = channel_password
    c.nick = "#{notify_user}_notifier"
  end

  on :message do |m|
  	if m.user.nick == notify_user
  		set_led "000"
  	elsif m.message.downcase.include? notify_user
  		set_led led_colors[rand(1..led_colors.size - 1)]
  	end
  end
end

bot.start