class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender 
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
end

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    sender.withdrawl(self.amount)
    receiver.deposit(self.amount)
    self.status = "complete"
  else
    reject_transfer
  end
end

def reverse_transfer 
  if valid? && receiver.balance > amount && self.status == "complete"
    sender.deposit(self.amount)
    receiver.withdrawl(self.amount)
    self.status = "reversed"
  else
    reject_transfer
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
 end
end

  
  
  
  
  
  
  
  
  
  
  
  
