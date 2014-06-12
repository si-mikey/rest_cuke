module Services
   class Mocky
      include HTTParty
      attr_accessor :routes      
 
      def initialize 
        @routes = Hash.new 
        @routes = { 
                      'base_url' => 'http://mocky.io/v2/',
                      '/200'     => '538b5e99771cc099144efb8d',
                      '/400'     => '538b6f40771cc004164efb8e',
                      '/500'     => '538b6f6e771cc004164efb8f'
                  } 


      end
    
      def get(rte, params = nil)
        self.class.get(self.routes['base_url'] + self.routes[rte]) 
      end


  end 
end
