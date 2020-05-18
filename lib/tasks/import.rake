require 'csv'

desc "Import customer from csv file"
  task :import => [:environment] do
   Customer.destroy_all
   file = "./data/customers.csv"
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      customer_hash = row.to_hash
      customer = Customer.where(id: customer_hash["id"])
      if customer.count == 1
        customer.first.update_attributes(customer_hash)
      else
        Customer.create!(customer_hash)
      end
  end 

  desc "Import merchant from csv file"
  task :import => [:environment] do
   Merchant.destroy_all
   file = "./data/merchants.csv"
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      merchant_hash = row.to_hash
      merchant = Merchant.where(id: merchant_hash["id"])
      if merchant.count == 1
        merchant.first.update_attributes(merchant_hash)
      else
        Merchant.create!(merchant_hash)
      end
    end 
  end

  desc "Import item from csv file"
  task :import => [:environment] do
   Item.destroy_all
   file = "./data/items.csv"
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      item_hash = row.to_hash
      item = Item.where(id: item_hash["id"])
      if item.count == 1
        item.first.update_attributes(item_hash)
      else
        Item.create!(item_hash)
      end
    end 
  end

  desc "Import invoice from csv file"
  task :import => [:environment] do
    Invoice.destroy_all
    file = "./data/invoices.csv"
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      invoice_hash = row.to_hash
      invoice = Invoice.where(id: invoice_hash["id"])
      if invoice.count == 1
        invoice.first.update_attributes(invoice_hash)
      else
        Invoice.create!(invoice_hash)
      end
    end
  end
  desc "Import invoice_items from csv file"
  task :import => [:environment] do
    InvoiceItem.destroy_all
    file = "./data/invoice_items.csv"
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      invoice_item_hash = row.to_hash
      invoice_item = InvoiceItem.where(id: invoice_item_hash["id"])
      if invoice_item.count == 1
        invoice_item.first.update_attributes(invoice_item_hash)
      else
        InvoiceItem.create!(invoice_item_hash)
      end
    end
  end

  desc "Import transactions from csv file"
  task :import => [:environment] do
    Transaction.destroy_all
    file = "./data/transactions.csv"
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      transactions_hash = row.to_hash
      transaction = Transaction.where(id: transactions_hash["id"])
      if transaction.count == 1
        transaction.first.update_attributes(transactions_hash)
      else
        Transaction.create!(transactions_hash)
      end
    end
  end
end



