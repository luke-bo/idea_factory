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

    it 'requires a unique title' do
      # GIVEN
      persisted_idea = Idea.create(title: "title x", description: "Description")
      idea = Idea.new title: persisted_idea.title, description: "Description"
      # WHEN
      # validations triggered
      idea.valid?
      # THEN
      # We get an error on title
      puts idea.errors.messages
      expect(idea.errors.messages).to(have_key(:title))
      expect(idea.errors.messages[:title]).to(include("has already been taken"))
    end
  end
end
