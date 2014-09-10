module ChildViewHelpers
  def dismiss_child_view!
    self.dismissViewControllerAnimated(true, completion:nil)
  end
end
