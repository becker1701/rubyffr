---
layout:     post
title:      "Adding Comments to your Jekyll Blog"
date:       2015-11-18 11:44:01 -0800
categories: 
- Jekyll 
- Comments 
- blog 
- Ruby
author:     Brian Becker
comments:   true
---


1. Create a Disqus account at [Disqus][disqus-home]
2. Login, click your avatar in upper right and select Admin
3. Do all of the things
4. Generate code block
5. paste in a partial file, update the page_url and page_identifier
6. update your blog posts frontmatter



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

[disqus-home]: https://disqus.com/
