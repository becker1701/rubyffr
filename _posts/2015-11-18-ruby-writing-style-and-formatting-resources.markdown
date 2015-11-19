---
layout:     post
title:      "Ruby Writing Style and Formatting Resources"
date:       2015-11-18 10:33:00 -0800
categories: 
- Ruby 
- Language 
- Style 
- Formatting 
- Best Practices
author:     Brian Becker
comments:   true
---

Becoming a web developer has opened my eyes to a lot of industry specific fundimentals. For example, Ruby programmers use 2-space tabs. I used Ruby on Rails for two years, and didn't know this little formatting standard. 

Now, I have a couple tools to help my code look good! The following resources are the perfect companion to anyone who wants to write Ruby code using industry-standard styling.


##[Ruby Style Guide][ruby-style-guide]

> Ruby style guide recommends best practices so that real-world Ruby programmers can write code that can be maintained by other real-world Ruby programmers.

There is a lot of styling information here. A great read for any newbies.


##[Rubocop][rubocop-home]

> A Ruby static code analyzer, based on the community Ruby style guide.

This tool is awesome. Basically, include this tool in your working directory using RubyGems, and run `rubocop` in your terminal window. Rubocop will look over your files (or file, if you specify one) and let you know what peices of your code does not follow the standard Ruby syntax styling. 




##[Ruby-Doc: 2.2.3 core][ruby-docs-2.2.3-home]

Some great learning tools are included in the [Ruby-Doc site][ruby-docs-2.2.3-home]. 

####[Ruby Globals][2.2.3-globals]: 
A file listing Ruby pre-defined variables and global constants.

####[Ruby Keywords][2.2.3-keywords]: 
A list of keywords used by Ruby.

####[Ruby Standard Library][ruby-std-library]: 
A vast collection of classes that you can require into your Ruby programs for expanded functionality.

####[Ruby Syntax][2.2.3-ruby-syntax]: 
This is a list of files and keywords that is standard syntax in Ruby. Included are:

**[Literals][ruby-syntax-literals]**

- Create objects you can use in your program.

**[Assignment][ruby-syntax-assignment]**

- The = (equals sign) and a bunch of things you can do with it.

**[Control Expressions][ruby-syntax-control-exp]**

- A breakdown of the various options for control flow.

**[Methods][ruby-syntax-methods]**

- Standard practices and naming conventions, along with a variety of options to pass arguments.

**[Calling Methods][ruby-syntax-calling-methods]**

- More on methods, and specifically the types of arguments and how to use them.

**[Modules and Classes][ruby-syntax-modules-and-classes]**

- All about defining and using modules, classes, singleton methods and namespacing.

**[Exceptions][ruby-syntax-exceptions]**

- How to handle errors within your methods.

**[Precedence][ruby-syntax-precedence]**

- The list of operator precedences in Ruby.

**[Refinements][ruby-syntax-refinements]**

- For 'monkey-patching'

**[Miscellaneous][ruby-syntax-misc]**

- Some tools for class methods; alias, defined?, undef, BEGIN, END




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

[ruby-docs-2.2.3-home]: http://ruby-doc.org/core-2.2.3/
[ruby-style-guide]: https://github.com/bbatsov/ruby-style-guide
[rubocop-home]: http://batsov.com/rubocop/
[ruby-std-library]: http://ruby-doc.org/core-2.2.3/doc/standard_library_rdoc.html
[2.2.3-globals]: http://ruby-doc.org/core-2.2.3/doc/globals_rdoc.html
[2.2.3-keywords]: http://ruby-doc.org/core-2.2.3/doc/keywords_rdoc.html
[2.2.3-ruby-syntax]: http://ruby-doc.org/core-2.2.3/doc/syntax_rdoc.html
[ruby-syntax-literals]: http://ruby-doc.org/core-2.2.3/doc/syntax/literals_rdoc.html
[ruby-syntax-assignment]: http://ruby-doc.org/core-2.2.3/doc/syntax/assignment_rdoc.html
[ruby-syntax-control-exp]: http://ruby-doc.org/core-2.2.3/doc/syntax/control_expressions_rdoc.html
[ruby-syntax-methods]: http://ruby-doc.org/core-2.2.3/doc/syntax/methods_rdoc.html
[ruby-syntax-calling-methods]: http://ruby-doc.org/core-2.2.3/doc/syntax/calling_methods_rdoc.html
[ruby-syntax-modules-and-classes]: http://ruby-doc.org/core-2.2.3/doc/syntax/modules_and_classes_rdoc.html
[ruby-syntax-exceptions]: http://ruby-doc.org/core-2.2.3/doc/syntax/exceptions_rdoc.html
[ruby-syntax-precedence]: http://ruby-doc.org/core-2.2.3/doc/syntax/precedence_rdoc.html
[ruby-syntax-refinements]: http://ruby-doc.org/core-2.2.3/doc/syntax/refinements_rdoc.html
[ruby-syntax-misc]: http://ruby-doc.org/core-2.2.3/doc/syntax/miscellaneous_rdoc.html