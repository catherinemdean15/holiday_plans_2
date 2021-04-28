require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'validations' do
    it { should validate_presence_of :vacation_start_date }
    it { should validate_presence_of :vacation_end_date }
  end

  describe 'relationships' do
    it { should belong_to :worker }
  end
end
