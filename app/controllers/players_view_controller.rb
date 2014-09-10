class PlayersViewController < UITableViewController
  include ChildViewHelpers

  CELL_IDENTIFIER = 'PlayerCell'

  attr_accessor :players

  def viewDidLoad
    super
    tableView.backgroundView = nil
  end

  def tableView(tableView, numberOfRowsInSection: section)
    players.size
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    player = find_player_from_index_path(indexPath)
    subtitle_cell(tableView, player)
  end

  def prepareForSegue(segue, sender:sender)
    child_view = child_of_view(segue.destinationViewController)
    child_view.delegate = self

    if segue.identifier == 'AddPlayer'
      prepare_view_for_new_player(child_view)
    end
    
    if segue.identifier == 'EditPlayer'
      prepare_view_for_editing_player(child_view, tableView.indexPathForSelectedRow)
    end
  end

  # @param [Player] player
  # @param [Boolean] is_new
  def player_update_complete(player, is_new)
    player.save

    if is_new
      indexPath = NSIndexPath.indexPathForRow(Player.collection.size - 1, inSection: 0)
      tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimationAutomatic)
    else
      tableView.reloadData
    end
  end

  def player_details_view_cancelled(controller)
    dismiss_child_view!
  end

  def player_details_view_saved(controller)
    dismiss_child_view!
  end

private
  
  def prepare_view_for_new_player(child_view)
    child_view.player = Player.new
  end

  # @param [NSIndexPath] player_id
  def prepare_view_for_editing_player(child_view, indexPath)
    child_view.player = find_player_from_index_path(indexPath)
  end

  # @param [NSIndexPath] indexPath
  def find_player_from_index_path(indexPath)
    players[indexPath.row]
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

  def child_of_view(view)
    view.viewControllers[0]
  end
end
