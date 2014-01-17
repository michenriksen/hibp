# Have I Been Pwned?

A simple tool to check a bunch of email addresses against the [Have I Been Pwned?](https://haveibeenpwned.com/) API.

![HIBP extracting emails from a web page](http://i.imgur.com/7gIS39J.png)

## Installation

    $ gem install hibp

## Usage

HIBP supports different ways of feeding it email addresses:

### Give it a list:

    $ hibp -l "somone@gmail.com,someoneelse@yahoo.com,johndoe@hotmail.com"

### Find emails in a file

    $ hibp -f /path/to/some/file.txt

The file does not need to only contain email addresses, they will be extracted with a regular expression.

### Find emails on a web page

    $ hibp -w http://somecompany.com/about/employees

Extracts all e-mails on the web page.

For more options, see `$ hibp --help`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2014 Michael Henriksen

MIT License

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
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
