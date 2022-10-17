namespace :ordernar do
  desc "Configurando ambiente"
  task setup: :environment do

    order = Order.new
    order.order_states
  end
end