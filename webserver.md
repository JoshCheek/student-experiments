Challenge
---------

In this challenge, the student will parse a web request.
They are given the test suite to know how far they have made it.

Areas of Study
--------------


* Using constraints to prod a student past a crutch:
  A student does not necessarily have the habits required to empower their learning,
  If they find a way to get answers, and that seems easier than other things, they will
  continue to use that, even though there are better ways. Thus, the approach they take
  becomes a crutch, because it removes the pain, but does not empower them to
  develop the skills they need to really excel, and in the long run, the cost of the crutch
  is much higher, because it is inferior to the proper solution -- just less painful early on.
* Deconstructing and reconstructing ideas: Many students struggle with understanding how
  the high-level "what and why" correspond to the low level "how". Understanding this relationship
  is fundamentally important, because the implementation is only relevant if it accomplishes
  these goals. Understanding this relationship allows them to reduce wasteful code
  (which, lets be honest, is most code), determine the meaning behind code they have never
  seen before, understand why things are the way they are, understand what things should be.
  (ideally, the only way to really succeed at this challenge is to develop this skill)
* Expanding the zone of proximal development: If a challenge is too easy, it doesn't challenge
  the student to grow, if it's too hard, they become demotivated and have difficulty
  incorporating the solution into their knowledge base. So, ideally the solution is just
  out of reach. Something they can achieve with minimal intervention, so they experience success,
  solve the challenges on their own, and understand how they fit into their current skill set.
  I think the zone of proximal development can be very shallow due to the large set of
  possible paths to a solution. In this experiment, I constrain the set of possibilities by
  providing them with a list of things that they may use. The hope is that this makes it easier
  to make progress, because instead of having 164 String methods to consider, there are only 7.
  Thus the search space is smaller, and the hypothesis is that they can go further.
  Like focusing harmless daylinght through a magnifying glass, concentrating its efforts
  into one small but intense beam that can ignite a fallen autumn leaf.

Constraints
-----------

Other than tests passing or failing (which will provide very poor feedback,
and be largely unhelpful), the student may use Seeing Is Believing.

* The student may not use the internet (ie search engines, Stack Overflow, etc).
* The student may not use documentation. They will have to use methods that they
  may have never used before. This requires them to learn how to identify what it is
  that they want to know, and how to solicit that information from the system.
* The student may only use one line on Seeing Is Believing.
* The code on the Seeing Is Believing line must be less than 50 characters.
  The comments will exceeed 50 characters, this is fine.
  The purpose of this limited space is to prevent a student from being able to look
  at too many ideas at once. They will quickly run into the spatial boundary and
  will then have to reduce the idea further in order to make progress.
  For example, if they have something like `"Some string".split.first`,
  and they want to go further, say seeing what `upcase` does,
  then they may have to identify that the result is `"Some"`,
  and delete the code that transformed the initial string to that point,
  replacing it with the result. In other words, they would have to realize that
  `"Some string".split.first.upcase` is equivalent to `"Some".upcase`,
  but they would also have to understand how this can be recombined back into the
  more complex expression.

If the student struggles
------------------------

* If the struggle is due to a flaw in the challenge, make a note and fix the challenge,
  and then simply give it to the student. But make sure they understand it by having them
  mimic the solution you gave them (eg if you showed them a piece of code to help them
  understand how something works, then have them explain it, then delete it and have them
  rewrite it and explain it again).
* If their code is too long to fit into the alotted space, then explain that any bit of
  code can be replaced with its result (eg if 30 chars of code evaluates to "omg",
  then it can be replaced with the String literal "omg")
* If they can't see how to get something that works, encourage them to prove that
  things they expect to not work will, in fact, not work. For example, one of my
  students wanted to do `StringIO.new.methods.each { |m| puts m }`, but there wasn't
  enough room. He struggled to realize that he could do `puts StringIO.methods`,
  because he thought that puts needed a String (Seeing Is Believing was configured
  to truncate long output, so he couldn't see all the methods by just tacking a `to_s`
  onto the end). So in a case like this, where they're struggling to think of ways
  to get something that works, instead have them intentionally try things that they
  expect to not work, to prove to themselves that they do actually understand.
  It might also be useful to have them state what they expect before running it.
  Then, if the actual results disagree with their expectation, make sure they notice it
  and have them explain why this is. They won't be able to at first, but this should
  give them more information to incorporate into their model of its behaviour.
* If they are getting lost in the details when going into Seeing Is Believing to
  figure out how a thing works, then have them go back to the high-level context (the test)
  and only let them go into the test if they first write out what it is they are trying
  to figure out. I made exceptions on this rule when they seemed to hit a nice flow
  and seemed to know what it was that they were trying to solve. But if they get lost
  down there, then pull them back to the top and have them reestablish their context.
* If a student gets lost when integrating their isolated discoveries with their context
  heavy implementation, then there are a number of options available. You can have them
  artificially add the Seeing Is Believing annotations into the high level solution,
  to help them see the parity between what they discovered at that low level and how it
  fits into the high level. You can also have them explicitly write out what their
  input is and what their desired output is (eg `input: "Host", output: "HTTP_HOST"`)
* Students get bombarded with this "good code" nonsense. They will reject perfectly
  viable solutions, because they're long or kind of ugly or whatever. They don't
  want to write code until they can write perfect code. Explain that there is no such
  thing as perfect code and the metric for success is not pretty code, but working code.
  Further, explain to them that the distance from ugly working code to pretty working code
  is much smaller than the distance from no code to pretty working code. There is always
  time to refactor, but refactor from a working state, because then you can run the tests
  to determine that your code is still working. Also, explain to them that they are
  graded on whether or not their code works, not on whether or not it is short or pretty
  or whatever. It might be helpful to help them name their variables, though.

Possible modifications
----------------------

* Possibly provide a set of all possible ways to call a method.
  This way, when they go to explore how a method works, they can see the
  set of possibilities. Include examples of both calling the method on
  `self` and on an object. Include examples where they pass too few arguments.
  Include examples where they pass too many arguments. Include examples where
  they pass a block. Show how to identify how many arguments the block takes
  (splatted args with a block parameter to determine what they need to accept).
* Possibly have them provide at least one example of how to do each of the things
  in the set of allowed code. This would be to help really connect that this set
  of allowances is all that they can use, so they don't waste brainpower thinking
  about possibilities that they can short-circuit as unavailable. It might also
  help them understand the implications of each line, so that the set of available
  solutions is clearer in their minds. Alternatively, I'm not super fond of the idea
  that they start at the low-level, as it could reinforce the disconnect between
  "what" and "why".

The set of things you may use in your solution:
-----------------------------------------------

```
literals
  Hash   (eg {})
  String (eg "") with interpolation
  Array  (eg [])
IO
  #gets
  #read
String
  #chomp
  #split
  #==
  #to_i
  #upcase
  #capitalize
  #gsub
Hash
  #[]=
keywords
  loop
  break
  if
  unless
  ||
local variable
  assignment
  access
StringIO
  #new
Array
  #[]
  #length
Fixnum
  #+
  #==
```

Further challenges:
-------------------

If the student succeeds too easily at the challenge,
then there are a number of alternative constraints that
can be added so that they have to press their abilities:

* Alternative to gsub 1
  remove String#gsub
  add Integer literal, Integer#+, String#[], String#[]=
* Alternative to gsub 2
  remove String#gsub
  add Integer literal, Integer#+, String#<<
* remove keyword "unless"
  add Object#!@
* remove literals
  add Hash.new, Array.new, String.new
* remove keyword loop and keyword break
  add keyword `while` and keyword `true`
  * remove keyword `true`
* remove keyword `||`
* method extraction
  * add Hash#merge
  * have them extract start-line parsing into a method
  * have them extract body parsing into a method
  * have them extract header parsing into a method
  * once these are extracted, have them merge all the methods into a single line.
* Remove the further challenge, forcing them to undo whatever they did

The test suite
--------------

This is constructed to let a student know if they are succeeding,
but without giving them any good feedback about why they are not.
The reason for that is to prevent them from being able to supplement
their efforts by seeing what the test says. We want them to have to
extract atomic ideas from the larger context and come to understand
them independently, and then reincorporate them. If the test suite
does too good of a job of letting them know what is wrong, then they
can get by on its feedback alone, which undermines the necessity
and thus development of this skill.

```ruby
require_relative 'request'

RSpec.describe Request do
  let :env do
    Request.parse(
      StringIO.new(
        "POST / HTTP/1.1\r\n" +
        "Host: localhost:8080\r\n" +
        "Connection: keep-alive\r\n" +
        "Cache-Control: max-age=0\r\n" +
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\n" +
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36\r\n" +
        "Accept-Encoding: gzip, deflate, sdch\r\n" +
        "Accept-Language: en-US,en;q=0.8\r\n" +
        "Content-Length: 15\r\n" +
        "Content-Type: application/x-www-form-urlencoded\r\n" +
        "\r\n" +
        "abc=123&def=456"
      )
    )
  end

  def are_equal(expected, actual)
    bool = (expected == actual)
    expect(bool).to eq true # intentionally gives bad feedback
  end

  it 'parses the incoming stream and returns a hash of the parsed data' do
    expect(env.class).to eq Hash
  end

  context 'the first line' do
    it 'parses the method as REQUEST_METHOD' do
      are_equal 'POST', env['REQUEST_METHOD']
    end

    it 'parses the path as PATH_INFO' do
      are_equal '/', env['PATH_INFO']
    end

    it 'parses the protocol as SERVER_PROTOCOL' do
      are_equal 'HTTP/1.1', env['SERVER_PROTOCOL']
    end
  end

  context 'the headers' do
    specify 'are upcased, prepended with "HTTP_", and have their dashes turned to underscores' do
      are_equal "localhost:8080",      env["HTTP_HOST"]
      are_equal "keep-alive",          env["HTTP_CONNECTION"]
      are_equal "max-age=0",           env["HTTP_CACHE_CONTROL"]
      are_equal "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                                       env["HTTP_ACCEPT"]
      are_equal "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36",
                                       env["HTTP_USER_AGENT"]
      are_equal "gzip, deflate, sdch", env["HTTP_ACCEPT_ENCODING"]
      are_equal "en-US,en;q=0.8",      env['HTTP_ACCEPT_LANGUAGE']
    end

    it 'doesn\'t prepend HTTP_ to the content length or content type' do
      are_equal "15", env['CONTENT_LENGTH']
      are_equal 'application/x-www-form-urlencoded', env['CONTENT_TYPE']
    end
  end

  context 'the body' do
    it 'is an io object at the key "rack.input"pointing at the first character of the body' do
      are_equal "abc=123&def=456", env['rack.input'].read
    end
  end
end
```

Example implementation:
-----------------------

```ruby
require 'stringio'

class Request
  def self.parse(stream)
    env = {}

    # first row
    method, path, protocol = stream.gets.chomp.split
    env['REQUEST_METHOD']  = method
    env['PATH_INFO']       = path
    env['SERVER_PROTOCOL'] = protocol

    # headers
    loop do
      line = stream.gets
      break if line == "\r\n"
      key, value = parse_header(line)
      env[key] = value
    end

    # body
    length = env['CONTENT_LENGTH'].to_i
    stream = StringIO.new stream.read length
    env['rack.input'] = stream

    env
  end

  def self.parse_header(line)
    key, value = line.chomp.split(": ")
    key = key.upcase.gsub "-", "_"
    key = "HTTP_#{key}" unless key == 'CONTENT_TYPE' || key == 'CONTENT_LENGTH'
    [key, value]
  end
end
```


