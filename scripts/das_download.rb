#! /usr/bin/env ruby
# usage: 
# $ das_download.rb email password [download_directory]

require 'mechanize'
# gem 'mechanize-progressbar'

email    = ARGV[0] or raise('Please provide the email address for your account')
password = ARGV[1] or raise('Please provide the password for your account')
path     = (ARGV[2] || './').gsub /\//,''

download = lambda do |url, file|
  agent = Mechanize.new
  agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
  agent.get 'https://www.destroyallsoftware.com/screencasts/users/sign_in'
  form  = agent.page.forms.first
  form['user[email]']    = email
  form['user[password]'] = password
  form.submit
  agent.pluggable_parser.default = Mechanize::Download
  agent.get(url).save(file)
end

agent = Mechanize.new
agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
agent.get 'https://www.destroyallsoftware.com/screencasts/catalog'
screencasts = agent.page.search('li.screencast').reverse

screencasts.each_with_index do |screencast, index|
  title = screencast.search('a').first.text
  to_go = "#{screencasts.size - index} to go"
  url   = screencast.search('.download_link > a:first-child').first['href']
  file  = "#{path}/#{"%04d" % (index + 1)}-#{title.gsub(/\.|:|,/, '').gsub(/\/|\s/, '-').downcase}.mov"
  if File.exists? file
    puts "Skipping #{title} - #{to_go}"
  else
    puts "Downloading #{title} - #{to_go}"
    download[url, file]
  end
end
