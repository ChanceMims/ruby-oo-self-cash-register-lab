class CashRegister

    attr_accessor :total
    attr_reader :employee_discount

    def initialize(employee_discount = 0)
        @total = 0
        @employee_discount = employee_discount
        @items = []
    end

    def discount
        @employee_discount
    end

    def add_item(items, price, quantity = 1)
        @total += price * quantity
        quantity.times {@items << items}
        @last_transaction = {items: items, price: price, quantity: quantity}
    end

    def apply_discount
        if @employee_discount == 0
            "There is no discount to apply."
        else
        @total -= total * discount / 100
        "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction[:price] * @last_transaction[:quantity]
        @last_transaction[:quantity].times {@items.pop}
    end

end