class ApplicationController < ActionController::Base
include SessionsHelper

def hello
  render html: "Hello,again!"
end

end
