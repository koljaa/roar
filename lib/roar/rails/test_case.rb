ActionController::TestCase.class_eval do
  # FIXME: ugly monkey-patching.
  # TODO: test:
  #   put :create
  #   put :create, :format => :xml
  #   put :create, "<order/>", :format => :xml
  #   put :create, "<order/>"
  def process(action, *args)
    if args.first.is_a?(String)
       request.env['RAW_POST_DATA'] = args.shift
       args.unshift nil
    end
    
    super
  end
end
