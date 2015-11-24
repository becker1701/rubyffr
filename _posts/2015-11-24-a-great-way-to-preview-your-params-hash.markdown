---
layout:     post
title:      "A Great Way to Preview Your Params Hash With Little Effort"
date:       2015-11-24 09:47:00 -0800
categories: 
- Ruby 
- Rails
- Debugging
author:     Brian Becker
comments:   true
---

Using `binding.pry` is without a doubt one of my best freinds when debugging Rails apps.  I found a little trick that will allow you to view your params hash across all of your views in your development environment without any `binding.pry`'s or the like.

1. Open your application.html.erb file.

2. Enter this into the template, within your <html>, below the </body>:

{% highlight ruby %}
  <%= debug params if Rails.env.development? %>
{% endhighlight %}

And, there you have it!  

>The debug helper will return a `<pre>` tag that renders the object using the YAML format. This will generate human-readable data from any object. 

More info about debugging in the [Rails Guides][rails-debug-info].

<hr>

[rails-debug-info]: http://guides.rubyonrails.org/debugging_rails_applications.html#debug

{% if page.comments %}

###Comments

  <div id="disqus_thread"></div>
  <script>
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