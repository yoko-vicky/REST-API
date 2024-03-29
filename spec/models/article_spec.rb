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

    it 'has an invalid content' do
      article.content = 'aa'
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include('is too short (minimum is 5 characters)')
    end

    it 'has an invalid slug' do
      article.slug = 'z/?asqw120-asawmnfal,ds/1-@2;ls'
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include('is too long (maximum is 20 characters)')
    end

    it 'has not a unique slug' do
      article.save
      article2 = build(:article, slug: article.slug)
      expect { article2.save! }
        .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Slug has already been taken')
    end
  end

  describe 'scopes' do
    it 'returns articles in the correct order' do
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      articles = Article.latest_order
      expect(articles).to eq([recent_article, older_article])

      recent_article.update_column(:created_at, 2.hours.ago)

      articles = Article.latest_order
      expect(articles).to eq([older_article, recent_article])
    end
  end
end
