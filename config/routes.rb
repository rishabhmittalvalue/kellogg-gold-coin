Rails.application.routes.draw do
  get("/transactions", { :controller => "transactions", :action => "index" })
end
