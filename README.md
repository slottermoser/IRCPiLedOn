IRCPiLedOn - An IRC Notifier for your LedBorg-equipped Raspberry Pi
===================================================================

A bot to let you know when you have an IRC message waiting. Run this
script on a [Raspberry Pi](http://www.raspberrypi.org) with
[LedBorg](http://www.piborg.org/LedBorg) installed. Requires the
[cinch](https://github.com/cinchrb/cinch) gem.

When a user mentions your nick, one of the 26 possible LedBorg colors
will be chosen and your LedBorg will light up. It will remain lit until
you send a message in that channel.

## Installation

Just install the cinch gem and download the script.

	gem install cinch
	wget http://github.com/holdtotherod/IRCPiLedOn/master/irc_piled_on.rb

## Usage

Run the script. Usage: 

	./irc_piled_on.rb <nick_to_notify> <server_url> <channel> <channel_password(optional)>

Example:

	./irc_piled_on.rb stephenl irc.freenode.net canvas-lms
