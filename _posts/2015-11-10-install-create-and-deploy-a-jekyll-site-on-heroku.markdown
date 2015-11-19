---
layout:     post
title:      "Install, Create and Deploy a Jekyll Site on Heroku"
date:       2015-11-10 13:47:01 -0800
categories: 
- Jekyll 
- Heroku 
- blog 
- Rack 
- RubyGems 
- Bundler
author:     Brian Becker
comments:   true
---

I wanted to start a blog, and I wanted to do it with a something that I could hack on a little.  Well, after finally figuring out what Jekyll was and getting it installed on my system, things worked nicely.  Then I went to push it to Heroku, and KABOOM!  Combing through other blogs that were fairly current but none that helped in any one configuration, I found a combination of steps to actually get this up and running.  Hope you find it useful!

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
*Credit [James Ward's Blog][james-ward-blog] and [Matt Hoden's Blog][matt-hodans-blog]*

Once in the new project directory, I initialized a new git file:
{% highlight ruby %}
$git init
{% endhighlight %}

I used Bundler to initialize a new Gemfile (Bundler will create a Gemfile in the root directory of the project)
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
I created a new Heroku app and pushed the master up to the new app

{% highlight ruby  %}
$heroku create # this will create a new app on your account
$git push heroku master
{% endhighlight %}

Then I opened the site and took a look

{% highlight ruby  %}
$heroku open
{% endhighlight %}

###What didn't work:

- I tried to update my .gitignore file to ignore the .bundle directory.  That didn't work, as I received errors on Heroku deployment
- I tried to change 'vendor' to '_vendor' in the _config.yml file inside the exclude array, and that caused errors in the Heroku deploy, as well.

###Troubleshooting

- I had an app error when visiting the site after deployment, so ran the heroku restart command, and it fixed that right up.

{% highlight ruby  %}
$heroku restart # restart the Heroku dynos
{% endhighlight %}


###What I learned

I learned more about how RubyGems and Bundler work.  [RubyGems][rubygems-home] is a service that hosts ruby gems to the community.  The CLI is useful for installing, uninstalling and listing your installed gems, among other features.  [Bundler][bundler-home] is a tool that tracks the dependencies of the gems that you use, and installs the gems that you need.  [Heroku][heroku-home] supports [Rack][rack-home] and rack-based application. Rack is a ruby web server interface that takes an app that responds to `call` that takes the environment hash, and returns the HTTP response code, a hash of headers and the response body. 


{% if page.comments %}

###Comments

  <div id="disqus_thread"></div>
  <script>
      /**
       *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
       *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
       */
      /*
      var disqus_config = function () {
          this.page.url = {{ site.url }}{{ page.url | replace:'index.html',''}}
          this.page.identifier = {{ page.id }}
      };
      */
      (function() {  // DON'T EDIT BELOW THIS LINE
          var d = document, s = d.createElement('script');
          
          s.src = '//rubyffr.disqus.com/embed.js';
          
          s.setAttribute('data-timestamp', +new Date());
          (d.head || d.body).appendChild(s);
      })();
  </script>
  <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>

{% endif %}

[jekyll-home]: https://jekyllrb.com/
[heroku-home]: https://www.heroku.com/
[matt-hodans-blog]: http://matthodan.com/2012/10/27/how-to-create-a-blog-with-jekyll.html
[james-ward-blog]: http://www.jamesward.com/2014/09/24/jekyll-on-heroku
[rubygems-home]: https://rubygems.org/
[bundler-home]: http://bundler.io/
[rack-home]: http://rack.github.io/
