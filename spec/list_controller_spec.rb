describe "List Controller" do
  tests ListController

  it "new view should appear after a swipe" do
    flick 'number 3', :from => :left, :to => :right, :duration => 1
    view('new view').should.not == nil
  end
end
