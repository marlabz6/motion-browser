module MIM
  class MotionBrowserToolbar < UIToolbar

    def init
      super
      setButtons(MotionBrowserConfig.shared.include_share_button)
      self
    end

    def setButtons(include_share)
      @back    = BackBarButtonItem.create
      @forward = ForwardBarButtonItem.create
      @space   = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace, target: nil, action: nil)

      if include_share
        @share   = ShareBarButtonItem.create
        setItems([@share, @space, @back, @forward], animated: false)
      else
        setItems([@back, @space, @forward], animated: false)
      end
    end


    def delegate=(delegate)
      @back.delegate = @forward.delegate = delegate
      if @share != nil
        @share.delegate = delegate
      end
    end
  end
end
