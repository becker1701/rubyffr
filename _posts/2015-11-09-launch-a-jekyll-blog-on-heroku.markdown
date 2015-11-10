---
layout: post
title:  "Launch a Jekyll blog on Heroku"
author: Brian Becker
date:   2015-11-10 15:59:00 -0800
categories: jekyll heroku blog
---



Download and install Jekyll using RubyGems
Create a Jekyll project using Jekyll.
Folloing the installation instructions from the [Jekyll website][jekyll-home]




Once in the new project directory, initiailize a new git file:
$git init

Then, use Bundler to initialize a new Gemfile (Bundler will create a gemfile in the root directory of the project)
{ % highlight ruby % }
  bundle init
{ % endhighlight% }

Then, add gems to your Gemfile, and run bundle install:

{% highlight ruby %}
source "https://rubygems.org"

gem 'jekyll'
gem 'rack-jekyll'
gem 'kramdown'
gem 'rake'
gem 'puma'
{% endhighlight %}

Here are the step by step instructions from [James Ward's Blog][james-ward-blog]:

2. Create a Procfile telling Heroku how to serve the web site with Puma:
{% highlight ruby  %}
  web: bundle exec puma -t 8:32 -w 3 -p $PORT
{% endhighlight %}

Create a Rakefile which tells Heroku’s slug compiler to build the Jekyll site as part of the assets:precompile Rake task:
{% highlight ruby  %}
  namespace :assets do
    task :precompile do
      puts `bundle exec jekyll build`
    end
  end
{% endhighlight %}

Add the following lines to the _config.yml file:
{% highlight ruby  %}
  gems: ['kramdown']
  exclude: ['config.ru', 'Gemfile', 'Gemfile.lock', 'vendor', 'Procfile', 'Rakefile']
{% endhighlight %}

Add a config.ru file containing:
{% highlight ruby  %}
  require 'rack/jekyll'
  require 'yaml'
  run Rack::Jekyll.new
{% endhighlight %}


Check everything into your git file.
$git add .
$git commit -am 'Initial commit'

Deploy:

When we deploy to heroku, we will use our local master to push to Heroku.
Assuming you have Heroku Toolbelt installed and an account with Heroku, do this:

$heroku create # this will create a new app on your account
$git push heroku master

To view your new site:
$heroku open

Barring any errors, this should setup a new Heroku app running Puma, and serve your new Jekyll blog.

Next post will be a walkthrough of attaching a custom domain to your new Jekyll blog served from Heroku!


[jekyll-home]: https://jekyllrb.com/
[heroku-home]: https://www.heroku.com/
[matt-hodans-blog]: http://matthodan.com/2012/10/27/how-to-create-a-blog-with-jekyll.html
[james-ward-blog]: http://www.jamesward.com/2014/09/24/jekyll-on-heroku


