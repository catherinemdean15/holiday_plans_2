require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'relationships' do
    it { should belong_to :worker }
  end
end
