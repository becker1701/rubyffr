---
layout: post
title:  "Tealeaf Course 1: What I've Learned"
date:   2015-11-12 20:40:00 -0800
categories: 
- Ruby 
- Learning 
- Developer_School
- Tealeaf_Academy
author: Brian Becker
---

A quick overview of things that I learned form the Tealeaf Academy Prep course and Ruby Fundamentals course.

1. Don't modify raw data. You may want to change it later. Instead, create a duplicate and modify that.

2. When creating a program, write out the scope and requirments, then extract nouns as classes and verbs as methods.

3. Variable inner scope is defined by a do/end block that preceeds a method call

4. When retreiving a value from a hash, you can use fetch to raise a KeyError is the key is not found, otherwise use the [] method to return nil if the key is not found and you do not want to raise an error



###[Ruby-Docs][ruby-docs-2.2.3-home]:

Some great learning tools are included in the [Ruby-Doc site][ruby-docs-2.2.3-home]. 

####[Ruby Globals][2.2.3-globals]: 
A file listing Ruby pre-defined variables and global constants.

####[Ruby Keywords][2.2.3-keywords]: 
A list of keywords used by Ruby.

####[Ruby Standard Library][ruby-std-library]: 
A vast collection of classes that you can require into your Ruby programs for expanded functionality.

####[Ruby Syntax][2.2.3-ruby-syntax]: 
This is a list of files and keywords that is standard syntax in Ruby.

- [Literals][ruby-syntax-literals] create objects you can use in your program:
  - Booleans and nil
  - Numbers
  - Strings
  - Symbols
  - Arrays
  - Hashes
  - Ranges
  - Regular Expressions
  - Procs

- [Assignment][ruby-syntax-assignment]: The = (equals sign).
  - Assignment methods
  - Variable types
  - Abbreviated assignment (`+, -, *, /, %, **, &, |, ^, <<, >>`) followed by =
  - Implicit Array Assignment (`a = 1, 2, 3` sets `a = [1, 2, 3]`)
  - Multiple Assignment (`a, b = 1, 2` sets `a = 1` and `b = 2`)
  - Array Decomposition (`(a, b) = [1, 2]` sets `a = 1` and `b = 2`)

- [Control Expressions][ruby-syntax-control-exp]:
  - if
  - unless
  - while
  - until
  - for
  - break
  - next
  - redo

- [Methods][ruby-syntax-methods]: 
  - Method names: 
    - ! indicates a destructive method
    - ? indicates a boolean value will be returned
    - = indicates that the method will ignore the return value and instead return the arguments
    - Unary methods (`+, -, *, /, etc`)
  - Scope
  - Arguments
    - Order: Positional, Keyword, Block
    - default values
    - array decomposition (using ( and ) or catch remaining in array using *)
    - array and hash arguments
    - keyword arguments ( a: 123 )
    - block arguments (prepended with & and called using `yield`)
  - Exception Handling
    - Using begin/rescue
- [Calling Methods][ruby-syntax-calling-methods]: 
  - Arguments
    - There are three types of arguments when sending a message, the positional arguments, keyword (or named) arguments and the block argument. Each message sent may use one, two or all types of arguments, but the arguments must be supplied in this order.
  - Array to Arguments Conversion
    - using `*` in the method call will turn an array into an argument list
  - Hash to Keyword Argument Conversion:
    - You can turn a hash into a keyword arguments using `**` in the method call
  - Proc to Block Conversion
    - You can turn a Proc or lambda into a block with the `&` in the method call
  - Method Lookup

- [Modules and Classes][ruby-syntax-modules-and-classes]: 
  - Module:
    - Created using the `module` keyword
  - Nesting: for namespacing modules (`Module1::InnerModule`)
  - Scope: 
    - Self
    - Constants
    - Methods
    - Visibility
      - public: public method may be called from any other object
      - protected: sender must be a subclass or vice-vera
      - private: can not be called with a reciever, not even self
  - Classes
    - Defined using `class` keyword
    - Inherits from another class using `< OtherClass`
  - Singleton Class
    - Holds methods only for that instance of a class
    - Defined using `class << object`

- [Exceptions][ruby-syntax-exceptions]: 
  - begin/rescue/end
    - You can omit begin and end within a method
    - You can rescue any type of error individually
    - You can pass the error object to the rescue `rescue NoMethodError => e`, then reference e.message
  - ensure
    - always runs code, despite errors

- [Precedence][ruby-syntax-precedence]: 

- [Refinements][ruby-syntax-refinements]: 
  - For 'monkey-patching'

- [Miscellaneous][ruby-syntax-misc]: 
  - alias:
    - used to alias one or more methods, as sting or symbol
  - undef prevents the current class from responding to calls to the named method
  - defined? 
    - use parenthesis
    - returns a string describing it's argument


###RegEx:

1. [RegEx][2.2.3-regex]: A file that shows how to use RegEx with Ruby

2. [Rubular][rubular-home]: A great tool for testing RegEx


###Ruby:

1. Classes where Enum is defined have access to a powerful list of methods in the Enum module

2. To include a module in a class, the module file needs to be required at the top of the file `require 'some_module'`. Then, the module needs to be included inside the class definition `include SomeModule`

3. `super` keyword is used within a object method to return to the superclass method of the same name. Arguments can be passed just like a normal method call. `super` is a refinement.


###jQuery and AJAX
- Unobtrusive JavaScript is the standard
- Always start .js file with $(document).ready(function(){ //code here });
- Bind events to CSS id's, classes and HTML tags
- Use $(document).on('event', 'element', function(){}) to rebind DOM elements after 'event'
- AJAX shortcut for GET and POST:
  - `$.get('/url').done(function(msg) { //some code });` -- for API calls?
  - `$.post('/url').done(function(msg) { //some code });`
- Send JSON data to JavaScript (`hash_var.to_json`) and `require 'JSON'`
- Include CDN for jQuery from Google @ [https://developers.google.com/speed/libraries/](https://developers.google.com/speed/libraries/)


###Sinatra
- Simple web-app framework
- define actions as `get/post with '/url' do; end`
- `helpers` block for resuable code
- When adding stylesheet links or script tags to external files in the layout files, prepend the path with a '/'.  This will tell the layout to check the root directory for the file, instead of looking for the link and script files in the URL path.

###Debugging
- `require 'pry'`
- `require 'pry-buybug'`
- `require 'pry-stack_explorer'`
- Insert binding.pry
- show-stack shows the current call stack


###HTTP:
- HTTP is stateless. Data is lost between request/response cycles
- Session creates cookies to persist data between request/response calls
- HTTP requests are made up of an HTTP verb, a URL, a header and parameters.
  - HTTP could be GET and POST
  - GET passes parameters in the URL
  - POST passes parameters in the header
- An HTTP response is made up of a status code and a payload
  - Common status codes:
  - 200 - OK
  - 302 - redirect
  - 404 - Not FOund
  - 500 - server error

[ruby-docs-2.2.3-home]: http://ruby-doc.org/core-2.2.3/
[2.2.3-globals]: http://ruby-doc.org/core-2.2.3/doc/globals_rdoc.html
[2.2.3-keywords]: http://ruby-doc.org/core-2.2.3/doc/keywords_rdoc.html
[2.2.3-regex]: http://ruby-doc.org/core-2.2.3/doc/regexp_rdoc.html
[rubular-home]: http://rubular.com/
[ruby-std-library]: http://ruby-doc.org/core-2.2.3/doc/standard_library_rdoc.html
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