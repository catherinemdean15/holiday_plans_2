require 'rails_helper'

RSpec.describe Worker, type: :model do
  describe 'relationships' do
    it { should have_many :requests }
    it { should have_many :managers_workers }
    it { should have_many(:managers).through(:managers_workers) }
  end
end
