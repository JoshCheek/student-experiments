Bookclub::DSL.new do
  meeting 1, date: '2015-03-24' do
    snacks Chelsea: 'veggies',
           Josh:    'cookies',
           Michael: 'hummus!'

    tip 4, "Buy a notebook" do
      ponder 'Why buy a notebook?'
      perform 'Things to write in your notebook' do
        task 'Results from today'
        task 'Ideas for tomorrow'
        task 'Goals for next week'
      end
    end

    tip 5, 'Be willing to be stoopid' do
      ponder 'The value of looking stupid'
      ponder 'How making mistakes can help you improve'
      takeaway 'Gives you the ability to learn new things'
    end
  end
end
