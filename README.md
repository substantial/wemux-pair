# Wemux::Pair

Firewall-punching remote pairing with wemux made easy

## Requirements

Have a box that is accessible to both users via ssh.

First time set up for hosts (assuming OSX):

1. Create a <pairprogramming> user.
2. Give that user remote login access via System Preferences>Sharing>Remote Login
3. Add client's ssh keys to ~<pairprogramming>/.ssh/authorized_keys
4. In ~<pairprogramming>/.bash_profile should be: "wemux attach; exit"

## Installation

Add this line to your application's Gemfile:

    gem 'wemux-pair'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wemux-pair

## Usage


Generate `.pair.yml` configuration, run `$pair --init`

Print Usage: `$ pair --help`

Host:
Start a [wemux](https://github.com/zolrath/wemux) session

Then run `$ pair host`

Client:
Ensure you're not in a wemux/tmux session

Run `$ pair <host port>`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
