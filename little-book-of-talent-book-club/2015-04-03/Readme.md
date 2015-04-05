The homework was given as: https://gist.github.com/JoshCheek/795826f1ffc1f8ac8c36

* The last time went quite a bit quicker.
  * Maybe because last time was at the beginning of the day vs this was late on a Friday.
  * Maybe because I showed the first group what my DSL looked like before they began.
  * Maybe because the first group had 2 students and this time I had 4.
* I think that starting in English was valuable.
  It took a while, but got them to eventually consider it without any concern for the code,
  which is what I wanted.
* They got caught up for quite a while on the translation from English to DSL,
  choosing options that looked more like code to them,
  rather than options that were more like their DSL.

  eg preferring

  ```ruby
  @assignments = ['do this', 'do that']
  ```

  over

  ```ruby
  assignments 'do this', 'do that'
  ```
* Eventually, I read both the different pieces out loud,
  at which point, it became apparent that the non-codelike one
  was more communicative.
* I think the difficulty was because there was no obvious way to make it work.
  It used blocks, which they didn't really understand,
  and it was unclear what the methods were being called on.
  All valid points, but the fact that they *can* make it work in the future,
  and dont' have to bother with the details right now,
  was what I wanted them to understand.
  I think we got there in the end, just had to ease into it a bit.
* Some pieces we went down and explored, and I think it was valuable.
  For example, we took maybe 10 minutes or so on the way that `ARGV` works.
  I didn't take it as low as `C` in my explanation, but think it was good that
  we had this conversation, otherwise it's unclear how we even got to the code
  that performs the translation, which makes the entire thing murky.
* I think it came together at the end. I asked what we needed to do next,
  and they wanted to jump into writing code. But I pointed out the missing step:
  Now that i know what my DSL to looks like, I want to transform it into HTML,
  that's *what* I want to do, but *how* do I do it. Fairly quickly (I might have prompted
  them, can't remember), we realized that we needed to run something from somewhere.
  So we thought through what that would look like, and decided:
  `ruby itinerary.rb meeting1.rb`
  This led to the top file, itinerary.rb
* In here, it went mostly smoothly. There was confusion about how the parser would
  give me back an intermediate data structure, and I didn't know what it would have on it.
  But I am pretty sure they understood in the end, as I gave them possible things that
  I would want to do with it, like rendering to `HTML`, or pulling out the times so that
  I could send text messages or something. I think they realized that they would need
  to re-parse the HTML to get that information out. One of them realized that this was
  similar to what Nokogiri does, it gives you a Ruby object that represents the `HTML`,
  perhaps linking it to things of this nature would be effective.
* We also considered the implications of different decisions like placing the `puts`
  in `Itinerary::ToHtml.new(itinerary).call`, and how that would prevent us from
  being able to write it to a file, as well as how difficult it would be to test,
  as a consequence of this decision.
* As we would consider how we wanted it to look, we would make changes to the code,
  and I would make it a point to talk about how the unwritten code that would eventually
  come into existence had just changed. Similar way to how I discussed it for the first group.
  I think that telling them something like "feel the fact that this code will be here
  for us once we start using it" and then talking about specific file and class names that
  "just got refactored" or "just changed" was effective.
* Once we got to `itinerary.rb`, I felt like there was a much deeper understanding of the
  paradigm itself. Maybe because they had finally accepted it at the end of the `dsl`,
  letting go of the familiarity of the instance variable solutions.
  I tend to take a lot of time at that stage, I haven't tried rushing it yet,
  but it seems to prime them for this second stage.
  Probably because their brains are so oriented towards their ultimate objective
  and context, they have an easier time seeing how this piece of code or that piece of code
  fits into the goal, and are less attached to "this seems like something I can understand"
  which would prioritize "how" to accomplish some piece of it, rather than "what" should
  be accomplished.
* They expressed that they really liked how I had presented them with as many as 4 options
  during the DSL phase, to express the same piece of information, explaining that
  "I can make any one of these work". I can make any of these options give you back the
  same result at the end of the day. I think that helped them realize that implementation
  wasn't what mattered at this phase, even though it still took them a while to ease into
  the solution that seemed more codewise foreign.
* I offered to finish it out and "manifest the code" for them, but they didn't seem to
  need the result to come out the other end.
* They expressed interest in finishing it next Friday,
  but I'm not sure if it's actually necessary.
* Maybe I'll go to socialize, and give them the English layer, and have them turn it into DSL
  and write this first piece. So that they do the bit we did today, all by themselves.
  Then show them how to build the pieces underneath of it.
  I think I'll keep this going in an outside-in / top-down manner,
  I want them to learn to think this way before I show them approaches that subvert it.
