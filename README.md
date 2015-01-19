# Middleman Template: ZURB Foundation #

middleman-template-foundation is a minimal [Middleman](http://middlemanapp.com/) project template with the [SASS](http://sass-lang.com/) version of the [ZURB Foundation](http://foundation.zurb.com/) Framework. 

It's a baseline for quickly building a marketing site for a new QuietStream product/company.

## Requirements ##

1. ruby
1. git
1. middleman ($ `gem install middleman -v '3.2.2'`)
1. bower ($ `npm install -g bower`)

## Installation ##

Clone this repository into ~/.middleman

$ `git clone https://github.com/QuietStreamFinancial/middleman-template-foundation ~/.middleman/quietstream-foundation`

Create a new project using the template. Use this template with the `--template` flag with `middleman init`

$ `middleman init www.new-website.com --template=quietstream-foundation` 

Change directory to the new project

$ `cd www.new-website.com`

Remove the git history associated to the new project from the template

$ `rm -rf .git`

Run Bower to install the front-end dependencies

$ `bower install`

Now you can start hacking on `source` directory and watch live changes on [localhost:4567](http://localhost:4567).

$ `bundle exec middleman`

For more help follow [Middleman's project template instructions](http://middlemanapp.com/getting-started/welcome/).

## ZURB Foundation License ##

Copyright (c) 2011 ZURB, http://www.zurb.com/

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.# kathyizard
