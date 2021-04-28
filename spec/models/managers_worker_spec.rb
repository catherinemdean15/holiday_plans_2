require 'rails_helper'

RSpec.describe ManagersWorker, type: :model do
  describe 'relationships' do
    it { should belong_to :manager }
    it { should belong_to :worker }
  end
end
