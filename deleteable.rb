# csv.each do |data|
#   csv.delete_at(0)
#   if data[0].to_i == self.id
#     puts data[1] = new_brand
#     puts data[3] = new_price
#   end
# end

# cvs.map(&:to_s).save

# CSV.open(@@data_path, "wb") do |csv|
#   csv << ["id", "brand", "product", "price"]
# end
# CSV.open(@@data_path, "w") do |data|
#   data << [self.id, self.brand, self.name, self.price]
# end

# File.open(@@data_path, 'w') do |data|
#     data.write(csv.to_csv)
# end
# p self


#   csv = CSV.read(@@data_path)
#   csv.delete_at(0)
#   csv.each do |data|
#     if data[0].to_i == new_id
#       data[1] = new_brand
#       data[3] = new_price
#     end
#   end
#
#   CSV.open(@@data_path, "wb") do |csv|
#     csv << ["new_id", "new_brand", "new_product", "new_price"]
#   end
#   self
# end



  # CSV.open(@@data_path, 'wb') do |table|
  #       csv.each do |row|
  #         table << row
  #       end
  #     end
  #     self
  #   end

    # p Product.all


# def update(attributes = {})
#   @brand = attributes[:brand]
#   @price = attributes[:price]
#   cvsData = CSV.read(@@data_path)
#   cvsData.delete_at(0)
#   cvsData.each do |data|
#     if(data[0].to_i == @id)
#       data[1] = @brand
#       data[3] = @price
#     end
#   end

#   # delete_from_db(self.id)
#   # p Product.all
#   # p Product.find(4)
#   p new_product = [new_id,new_brand,new_name,new_price].map(&:to_s)
#   # new_product.save
#
#   cvs = CSV.open(@@data_path, "ab")
#   cvs.add_row(new_product)
#
#   # cvs.delete_if { |row| row[0] == id }
#   # cvs.each { |row| puts row}
#
#   # table = CSV.table(@@data_path)
#   # table.delete_if { |row| row[0] == id }
#   # table.each { |row| puts row }
#   #
#   # File.open(@@data_path, 'w') do |row|
#   #   row.write(table.to_csv)
#   # end
#
#   # CSV.open(@@data_path, "a") do |toy|
#   #   toy << [new_id,new_price,new_brand,new_name].map(&:to_s)
#   # end
#
#
#   # csv_out = CSV::Writer.generate(File.open(@@data_path, 'wb'))
#   # csv.each do |row|
#   #   row << [new_id,new_price,new_brand,new_name].map(&:to_s)
#   # end
#   # csv.close
#
#   # table.add_row(new_product)
#
#   # File.open(@@data_path, 'w') do |row|
#   #   row.write(table.to_csv)
#   # end
#
#   # CSV.open(@@data_path, "w+") do |csv|
#   #   csv << [new_id,new_brand,new_name,new_price].map(&:to_s)
#   # end
#
#   # p new_product = Product.new(id: new_id, price: new_price, brand: new_brand, name: new_name)
#
#
#   # CSV.open(@@data_path, "a+") do |toy|
#   # CSV.open(@@data_path, "a+")
#     # toy << Product.new(id: new_id, price: new_price, brand: new_brand, name: new_name)
#     # toy << [self.id, self.brand, self.name, self.price]
#     # self.add_row([new_id,new_price,new_brand,new_name])
#   # end
#   #
#
#   p Product.all.length
#   # p Product.all


# def self.destroy(n)
#   remove_product=self.find(n)
#   self.remove_product_in_db(n)
#   remove_product
# end
#
# def self.remove_product_in_db(n)
#   table=CSV.table(@@data_path)
#   table.delete_if do |row|
#     row[:id]==n
#   end
#   File.open(@@data_path, 'w') do |f|
#     f.write(table.to_csv)
#   end
# end

def count_by_brand(products)
  uniq_products = products.map { |product| product.brand }.uniq
  uniq_products.each_with_object(Hash.new(0)) do |product,count|
    product.to_s + (count[product] += 1).to_s
  end
end

def print_brand_format(products)
  count_by_brand(products).each do |product|
    puts "  - " + product[0].to_s + ": " + product[1].to_s
  end
end


def count_by_name(products)
  uniq_products = products.map { |product| product.name }.uniq
  uniq_products.each_with_object(Hash.new(0)) do |product,count|
    product.to_s + (count[product] += 1).to_s
  end
end

def print_name_format(products)
  count_by_name(products).each do |product|
    puts "  - " + product[0].to_s + ": " + product[1].to_s
  end
end
