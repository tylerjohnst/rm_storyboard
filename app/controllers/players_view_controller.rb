class PlayersViewController < UITableViewController

  attr_accessor :players

  def tableView(tableView, numberOfRowsInSection: section)
    @players.size
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    player = @players[indexPath.row]
    subtitle_cell(tableView, player)
  end

  def prepareForSegue(segue, sender:sender)
    if segue.identifier == 'AddPlayer'
      child_of_view(segue.destinationViewController).delegate = self
    end
  end

  def create_player(name)
    player = Player.create(name, 'Chess', 1)
    indexPath = NSIndexPath.indexPathForRow(Player.collection.size - 1, inSection: 0)
    tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimationAutomatic)
  end

  def player_details_view_cancelled(controller)
    dismiss_child_view!
  end

  def player_details_view_saved(controller)
    dismiss_child_view!
  end

  private

  CELL_IDENTIFIER = 'PlayerCell'

  def dismiss_child_view!
    self.dismissViewControllerAnimated(true, completion:nil)
  end

  def child_of_view(view)
    view.viewControllers[0]
  end

  def subtitle_cell(view, player)
    view.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER).tap do |cell|
      cell.nameLabel.text = player.name
      cell.gameLabel.text = player.game
      cell.ratingImage.image = rating_image_for(player.rating)
    end
  end

  def rating_image_for(score)
    plural = score == 1 ? '' : 's'
    UIImage.imageNamed("#{score}Star#{plural}Small")
  end
end
