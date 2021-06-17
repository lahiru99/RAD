Rails.application.routes.draw do
  root to: "home#index"
  post "/submit_answer", to: "home#submit_answer"
  get "/score", to: "home#score"
end
