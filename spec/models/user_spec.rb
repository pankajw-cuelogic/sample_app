require 'spec_helper'

describe User do
	before {@user = User.new{name: "Example User", email: "uase@example.com"}}
	subject{@user}
	it{should respond_to(:name)}
	it{should respond_to(:email)}

end
