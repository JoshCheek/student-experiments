Challenge
---------

The student will describe a domain by writing it in a Rake / RSpec style DSL.
They will then implement the DSL.


Purpose
-------

Can I teach the "outside-in" (aka "top-down") paradigm?
Get them to construct abstractions on the fly by describing "what" they want to accomplish,
without worrying about "how" it does this (disallowing their minds from going down into the weeds and
losing their context in implementation details that don't matter at this stage).
Basically, the magic of imagining a reality and then building in that imagined reality,
with the understanding that it is an "eventual" reality.
Once they are happy with that toplevel "what to do", they can then go a layer lower and look at "how to do it".

For me, this always felt like magic (in fact, I gave a presentation about it, where that's exactly how I described it),
because you make some tiny change at the toplevel, and huge swaths of unwritten code just shift underneath of you.
At this level, it's free to make huge sweeping changes, the old unwritten code was free, and so is the new unwritten code.
As you make a change up here, half the code you would have written is rendered useless, discarded, and replaced with new unwritten code.
Then, they will go down one layer and implement the things that they are depending on, using the same technique.
And to make that work, they will go down to the next level of abstraction, implementing whatever is already being used by the code above them.
I'm interested to see if this can help them gain an understanding of how the code they write is very specifically crafted to be the
"how" for the higher level "what".

This was a revolutionary discovery for me, It utterly changed the way that I thought and that I approached problem solving.
Now, I mostly start at the top, but very quickly cut a path through the entire program so that I can work at the high and low levels in tandem,
and allow them to inform each other. But I think it may be a prerequesite to understand each of these approaches independently
before you can get to this point. Since these students have expressed difficulty with this
(especially with taking a problem description and manifesting an approach and solution from it),
I'm thinking that this side of the skillset is underdeveloped and that intentionally/directly addressing it
may help them learn to think in this way.


Implementation
--------------

This is based on an experience that I had, when I did this for real,
to go through the Land of Lisp with my friends.
[Here](https://github.com/JoshCheek/Play/blob/78a7fd77da9dc8d46cfb0dad431f18abf6a06617/land-of-lisp-itinerary/input/day_01.rb)
is an example of the DSL that I wrote.

### Writing the DSL

* I initially explained what I was interested in (learning to think in the "outside-in" paradigm)
* I had previously sent them [BDD as if you meant it](https://skillsmatter.com/skillscasts/2446-bdd-as-its-meant-to-be-done),
  but they hadn't watched it yet. I like it, because it's an excellent example of how to think in this way.
  I also showed them some Cukes that I wrote for Seeing Is Believing, explaining that it allows me to get my brain
  to think about what i am trying to do and why, without cluttering it with how I'm going to do that.
  This probably primed them to do the next steps in English, which wasn't quite what I was going for, but
  may have been better for them (because, like Cucumber, they really can think through the problem at a level of abstraction that
  they understand and can do -- whereas if we write it in code, that could impact their ability to stay on the outside)
* I provide them with copies of the "Little Book of Talent"
* We pick a chapter, read it, and then imagine we are in a book club and we want to come discuss it.
* Then we write what kinds of things we would want. They wrote these in English,
  but we tried to structure it such that it was clear how the pieces related to each other
  (ie they decided we should bring snacks, so we wrote "Snacks" and then indented within that,
  write "Josh will bring cookies")
* We then turned that into the DSL. They weren't familiar enough with Ruby to immediately see
  how to do this, but we worked on it a piece at a time.
* I made it a point to emphasize that it's not that this code doesn't exist or doesn't work,
  but rather it will eventually exist and eventually work. It's code that we can conjure into existence now,
  and will be there to support our use case at the time that we need it.
  I tried to describe its existence as a "yes, it exists, just a little further down the dimension of time than we are",
  and told them to feel its existence, the sensation that the code is really there, it's the same as code that already exists,
  but it shifts and changes to support our usage.
* As we would think at the high-level like this, we would realize we wanted to change the name of a method, or of a class,
  or how we represented the idea in our DSL. I mostly let them direct this, so that they constructed the DSL themselves
  with only a little bit of input from me. When they would do this, and change the code at the DSL level,
  I pointed out that we just refactored our eventual code. The old use case would eventually exist, and we changed
  how we were using it, which means that the new use case will eventually exist, so there's all this eventual code
  just shifting around, being refactored to support our new requirements.
* At one point (I think it was when I said "We changed this one line, and all of our eventual code just changed to support it,
  methods got added and deleted, class names changed, filenames changes" and on "Filenames just changed", one of the students
  said "Oh! It just clicked!" and then described the idea back to me.
* I also described abstraction to them:
  * Every thing you do is a "what", ie "what I want to accomplish"
  * Underneath of the "What" is the "How", ie "how how I accomplish it"
  * So each thing you write is a "What to do" for the layers beneath it, and a "How to do it" for the layers above it.

### Getting from the DSL to what we wanted to do

* I asked *what* we should do now, the answer was "Render that into some kind of output" I asked *how* do we want to do it.
  They initially started describing Ruby code, but I stopped them and said "I'm here on the command-line,
  I know what I want to do, which is render that code into some kind of output. So we decided that we should
  be able to run it with `ruby run.rb little_book_of_talent.rb`.
  This is the *how* to render the output, but it's also the *what* we want to do, that drives the code beneath it.
* We then made the file and said `filename = ARGV.first`, then put ourselves at the top of this level of abstraction,
  And thought through several different ways to implement it. Eventually we arrived at:

  ```ruby
  filename = ARGV.first
  dsl      = eval File.read(filename), binding, filename
  puts Bookclub::RenderAsText.call(dsl.structure)
  ```

  But we probably tried out three or four fairly different implementations. And made it a point to emphasize
  how there were huge structural changes that we got to think through by just writing three to five lines of code,
  and considering the implications.
* This required some changes to our DSL, for example, the `eval` expected to get back a DSL object.
  This caused us to wrap `Bookclub::DSL.new { ... }` around all the code that we had written.
* With that in place, we stopped to consider that this is *how* `ruby run.rb little_book_of_talent.rb` works.
  And it's the new "*What* we want to do", so it was now time to implement that layer of abstraction.

### Implementing the DSL

At this point, it was 11:40, so we only had half an hour.
I gave them the option of having me try to make it work,
or continuing to do this process at the next level down.

They chose to have me try to make it work. I got it working
in about half an hour, doing some explaining as I went,
but not taking the time to really make sure they were there with me.

They did seem to be following, though, which was nice.
In my implementation, I settled more into my current development style,
which allows both high and low level to inform each other at once.
Ideally I'd have just gone outside-in, but it's harder for me,
given that jumping up and down in abstraction is more effective
and I was time constrained.

I punted on implementing the `ponder`, `perform`, and `takeaway` methods,
because I disliked that I was doing all that breadth without going through the thing,
even though that's what you'd do if it was purely top-down.
This was a good decision, after getting to the layer beneath it,
I realized that I'd built additional structure that I didn't need,
and prevented me from generating what I wanted to. So I went back and fixed that,
with low overhead, because that "parallel code" was unimplemented,
so the cost of the fix was much lower.
This is what the Pragmatic Programmer would call a
[tracer bullet](http://www.artima.com/intv/tracer.html),
and Dan North would call a [dancing skeleton](http://gojko.net/2014/06/09/forget-the-walking-skeleton-put-it-on-crutches/).

In the end, I got it, working, and I think it was good for them to see that.
It was good for them to see that this thing they did at the top ultimately
drove all that code, and it came out on the other side.
It's probably also good for them to see how I do it, because this is what it
looks like in practice, which gives them a better context to understand it
eg mimicing me, seeing how I just jump into the next layer and don't sit around
thinking through all the pieces, I get into the code and get feedback from
writing it and seeing what the implications are, and then taking that information
and updating the code, rather than trying to plan my way into that implementation.


Final thoughts
--------------

* We started in English, which wasn't what I initially intended,
  but I wanted them to drive it from thinking about the domain,
  and the high-level. I'm not sure if that is better or worse.
* I omitted tests, but I should have talked about how I typically
  implement this process by writing acceptance tests (eg Cucumber,
  but even if it's in RSpec). I still start with this massive
  outside-in test, and let that drive the path through the implementation,
  eventually reverting to unit tests, as it becomes painful to test some
  little thing way at the bottom with this massive test at the top.
