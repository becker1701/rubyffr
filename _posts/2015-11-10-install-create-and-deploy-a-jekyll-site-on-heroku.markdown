---
layout: post
title:  "Install, Create and Deploy a Jekyll Site on Heroku"
date:   2015-11-10 13:47:01 -0800
categories: jekyll heroku blog
author: Brian Becker
---

I wanted to start a blog, and I wanted to do it with a something that I could hack on a little.  Well, after finally figuring out what Jekyll was and getting it installed on my system, things worked nicley.  Then I went to push it to Heroku, and KABOOM!  Combing through other blogs that were fairly current but none that helped in any one configuration, I found a combination of steps to actually get this up and running.  Hope you find it useful!

###What is Jekyll?

> Jekyll is a simple, blog-aware, static site generator. It takes a template directory containing raw text files in various formats, runs it through a converter (like Markdown) and our Liquid renderer, and spits out a complete, ready-to-publish static website suitable for serving with your favorite web server.

###*These are the steps I went through*


###Getting Jekyll on my system
*Instructions from the [Jekyll website][jekyll-home]*

First, I downloaded and installed Jekyll using RubyGems
{% highlight ruby %}
$gem install jekyll
{% endhighlight %}

Once installed, I created a Jekyll project in my root directory
{% highlight ruby %}
$jekyll new my-blog-site
{% endhighlight %}

Then cd'd into that directory
{% highlight ruby %}
$cd my-blog-site
{% endhighlight %}


###Setup git repo, your Gemfile and configure Rack
*Credit [James Ward's Blog][james-ward-blog] and [Matt Hodens Blog][matt-hodans-blog]*

Once in the new project directory, I initiailized a new git file:
{% highlight ruby %}
$git init
{% endhighlight %}

I used Bundler to initialize a new Gemfile (Bundler will create a gemfile in the root directory of the project)
{% highlight ruby %}
$bundle init
{% endhighlight %}

I add these gems to my projects Gemfile

{% highlight ruby %}
source "https://rubygems.org"

gem 'jekyll'
gem 'rack-jekyll'
gem 'kramdown'
gem 'rake'
gem 'puma'
{% endhighlight %}

And, don't forget...
{% highlight ruby %}
$bundle install --path _vendor/bundle
{% endhighlight %}

*The --path variable will install the gems into the project directory. Bundle will remember where you installed your gems in the future.*

I created a Procfile telling Heroku how to serve the web site with Puma:

**/Procfile:**
{% highlight ruby %}
web: bundle exec puma -t 8:32 -w 3 -p $PORT
{% endhighlight %}

I created a Rakefile, which tells Heroku’s slug compiler how to build the Jekyll site as part of the assets:precompile Rake task

**/Rakefile:**
{% highlight ruby  %}
namespace :assets do
  task :precompile do
    puts `bundle exec jekyll build`
  end
end
{% endhighlight %}

I added the following lines to the _config.yml file:

**/_config.yml:**
{% highlight ruby  %}
gems: ['kramdown']
exclude: ['config.ru', 'Gemfile', 'Gemfile.lock', 'vendor', 'Procfile', 'Rakefile']
{% endhighlight %}

I created a config.ru file containing:

**/config.ru:**
{% highlight ruby  %}
require 'rack/jekyll'
require 'yaml'
run Rack::Jekyll.new
{% endhighlight %}


Then, I checked everything into my git file.
{% highlight ruby  %}
$git add .
$git commit -am 'Initial commit'
{% endhighlight %}

###Deploy:

When I deploy to heroku, I will use the local master to push to Heroku.
I created a new Heroku app and pushed the master up to the new account

{% highlight ruby  %}
$heroku create # this will create a new app on your account
$git push heroku master
{% endhighlight %}

Then I opened the site and took a look

{% highlight ruby  %}
$heroku open
{% endhighlight %}

Everything worked!! 

I learned more about how RubyGems and Bundler work in this project, and a little bit more about how Heroku and Rack work together. Back to my studies... 


[jekyll-home]: https://jekyllrb.com/
[heroku-home]: https://www.heroku.com/
[matt-hodans-blog]: http://matthodan.com/2012/10/27/how-to-create-a-blog-with-jekyll.html
[james-ward-blog]: http://www.jamesward.com/2014/09/24/jekyll-on-heroku
