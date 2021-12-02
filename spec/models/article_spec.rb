require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'tests a number to be positive' do
    expect(1).to be_positive
    expect(5).to be > 3
  end
end
