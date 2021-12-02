require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validaitions' do
    #  The difference between build and create is that create also saves the created object
    # as build only returns the newly created object (without it being saved yet)
    let(:article) { build(:article) }

    it 'tests article objects' do
      expect(article).to be_valid
    end

    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
  end
end
