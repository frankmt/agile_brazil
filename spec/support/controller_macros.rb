module ControllerMacros
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def it_should_require_login_for_actions(*actions)
      actions.each do |action|
        it "should require login for action #{action}" do
          controller.class.before_filters.should include(:login_required)
        end
      end
      
    end
    
    def it_should_require_logout_for_actions(*actions)
      actions.each do |action|
        it "should require logout for action #{action}" do
          controller.class.before_filters.should include(:logout_required)
        end
      end
    end
  end  
  
end