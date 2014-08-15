class CacheSweeper < ActionController::Caching::Sweeper
	observe Product

	def after_save(product)
		clear_cache(product)
	end

	def after_destroy(product)
		clear_cache(product)
	end

	def after_update(product)
		clear_cache(product)
	end

	def clear_cache(product)
		expire_page :controller => :products, :action => :index
		expire_page :controller => :products, :action => :show, :id => product
	end
end
