Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "UT5LJnHYU3pIjzBxmb63JA", "vMZzLlpByHYY69p6JQugc6JkH1h6z9CQbto2KpYLgY"
  provider :facebook, "375426349203339", "e74003dd229226223004edf0998955f8"
end
