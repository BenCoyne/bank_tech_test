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
  
  describe '#deposit' do
    it 'increases the balance' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance' do
      account.deposit(100)
      account.withdraw(10)
      expect(account.balance).to eq(90)
    end
  end

end