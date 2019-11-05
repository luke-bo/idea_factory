require 'rails_helper'

RSpec.describe Idea, type: :model do
  
  describe "#validates" do
    it("requires a title") do
      # GIVEN
      idea = Idea.new
      # WHEN
      idea.valid?
      # THEN
      expect(idea.errors.messages).to(have_key(:title))
    end
  end
end
