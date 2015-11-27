# Cm-Sms-Rails
==============

[![Build Status](https://img.shields.io/travis/HitFox/cm-sms-rails.svg?style=flat-square)](https://travis-ci.org/HitFox/cm-sms-rails)
[![Gem](https://img.shields.io/gem/dt/cm-sms-rails.svg?style=flat-square)](https://rubygems.org/gems/cm-sms-rails)
[![Code Climate](https://img.shields.io/codeclimate/github/HitFox/cm-sms-rails.svg?style=flat-square)](https://codeclimate.com/github/HitFox/cm-sms-rails)
[![Coverage](https://img.shields.io/coveralls/HitFox/cm-sms-rails.svg?style=flat-square)](https://coveralls.io/github/HitFox/cm-sms-rails)

-----
Description
-----------
​
Send text messages by means of the HTTP protocol with the service of https://www.cmtelecom.com, from your rails app.
​

Usage
------------

Just add a folder to your rails app directory named /messengers. Add a file named like your messenger class should be named.
My example is path to the messenger file is app/messenger/text_message_notifier.rb

Now you can add your first welcome message.
This can be as simple as:

```ruby
class TextMessageNotifier < CmSms::Messenger
  default from: 'some string or mobile number'

  def welcome(recipient)
    @recipient = recipient
    
    content(to: recipient.mobile_number, body: 'Some text, reference: recipient.id)
  end
end
```
### Setting defaults

It is possible to set default values that will be used in every method in your CmSms Messenger class. To implement this functionality, you just call the public class method default which is inherited from CmSms::Messenger. This method accepts a Hash as the parameter. You can use :from, :to and :body as the key.

Note that every value you set with this method will get overwritten if you use the same key in your mailer method.

Example:

```ruby
class TextMessageNotifier < CmSms::Messenger
  default from: "Quentin", "00491710000000"
  .....
end
```
​
Installation
------------
If you user bundler, then just add 
```ruby
$ gem 'cm-sms-rails'
```
to your Gemfile and execute
```
$ bundle install
```
or without bundler
```
$ gem install cms-sms-rails
```

Upgrade
-------
```
$ bundle update cms-sms-rails
```
or without bundler

```
$ gem update cms-sms-rails
```
​
Changelog
---------

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HitFox/cm-sms-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

