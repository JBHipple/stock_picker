# Take in an array of daily stock prices
# Return 2 element array containing buy
# day and sell day with maximum profit

def stock_picker(stock_prices)
	buy_day = 0										# Holds index of max profit buy day
	sell_day = 1									# Holds index of max profit sell day
	max_profit = stock_prices[1] - stock_prices[0]	# Holds max profit amount
	(stock_prices.length-1).times do |index_buy|									# Iterate through every day as a buying point, excludes last day, since you cannot buy and sell the same day
		(index_buy+1..stock_prices.length-1).each do |index_sell|					# Iterate through every day after buy day
			if(stock_prices[index_sell] - stock_prices[index_buy] > max_profit)		# Determine if new combinations profit is higher than current max profit
				buy_day = index_buy													# Assign new max profit buy day, sell day, and set new max profit amount
				sell_day = index_sell
				max_profit = stock_prices[index_sell] - stock_prices[index_buy]
			end
		end
	end
	return [buy_day, sell_day]
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s

stock_prices = []
puts "Enter stock prices, one day at a time (enter negative price when done): "
price = gets.chomp.to_i
while (price >= 0) do
	stock_prices.push(price)
	puts "Enter stock prices, one day at a time (enter negative price when done): "
	price = gets.chomp.to_i
end
if (stock_prices.length == 0)
	puts "You didn't enter any prices!"
else
	puts stock_picker(stock_prices).to_s
end