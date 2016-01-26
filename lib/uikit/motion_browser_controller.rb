module MIM
  class MotionBrowserController < UIViewController
    def initWithURL(url)
      self.initWithURLAndTitle(url, url)
      self
    end

    def initWithURLAndTitle(url, title)
      self.init
      @url = url
      setTitle title
      self
    end


    def loadView
      self.view = MotionBrowser.new
      view.webview.delegate = self
    end

    def viewDidAppear(animated)
      super
      view.load(@url)
    end

    def webViewDidStartLoad(webview)
      UIApplication.sharedApplication.networkActivityIndicatorVisible = true
    end

    def webViewDidFinishLoad(webview)
      UIApplication.sharedApplication.networkActivityIndicatorVisible = false
    end
  end
end
