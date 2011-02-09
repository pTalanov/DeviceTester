module OrdersHelper

  def generate_public_id order

    order.public_id = "#{order.client_id}@#{Time.now.to_s(:number)}"

  end

end
