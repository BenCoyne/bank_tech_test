require 'bank_account'

describe Bank_Account do 
  subject(:account) { described_class.new }

  it 'creates an instance of bank_account' do
    expect(account).to be_a(Bank_Account)
  end

  describe '#balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq(0)
    end
  end
  
end
