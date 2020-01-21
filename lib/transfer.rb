class Transfer
  attr_accessor :sender, :receiver, :amount, :status
 
  def initialize(sender, receiver, amount, status="pending")
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = status
  end
  
  def valid?
    sender.valid? && receiver.valid?
end

def execute_transaction
  if @sender.balance > @amount && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    self.status = "rejected"
  "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer 
  if valid? && receiver.balance > amount && self.status == "complete"
    sender.deposit(self.amount)
    receiver.withdrawl(self.amount)
    self.status = "reversed"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

end
  
  
  
  
  
  
  
  
  
  
  
