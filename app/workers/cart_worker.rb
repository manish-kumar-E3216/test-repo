class CartWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    
    def perform(cart)
        puts "Destroying cart details"
        cart_res = Cart.find(cart)
        cart_res.destroy
    end

end