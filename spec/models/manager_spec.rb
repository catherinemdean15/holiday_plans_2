require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'relationships' do
    it { should have_many :managers_workers }
    it { should have_many(:workers).through(:managers_workers) }
  end
end
