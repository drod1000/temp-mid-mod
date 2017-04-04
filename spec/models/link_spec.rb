require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        link = Link.new(url: 'someurl@.com')

        expect(link).to be_invalid
      end
    end
  end
end
