require "game"
describe Game do
subject(:game) { described_class.new(player_1, player_2) }
subject(:finished_game) { described_class.new(player_1, dead_player) }
let(:player_1) { double :player, hit_points: 60 }
let(:player_2) { double :player, hit_points: 60 }
let(:dead_player) { double :player, hit_points: 0 }


  describe "player 1" do

    it "retrieves the first player" do
      expect(game.player_1).to eq player_1
    end

  end

  describe "player 2" do

    it "retrieves the second player" do
      expect(game.player_2).to eq player_2
    end

  end

  describe "attack" do

    it "damages the player" do
      expect(player_2).to receive(:receive_damage)
      player_2.receive_damage
    end

  end

  describe "current turn" do

    it "starts as player 1" do
      expect(game.current_turn).to eq player_1
    end

  end

  describe "switch turns" do

    it "switches the turn" do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end

  end

  describe "opponent of" do

    it "finds the opponent of a player" do
      expect(game.opponent_of(player_1)).to eq player_2
      expect(game.opponent_of(player_2)).to eq player_1
    end

  end

  describe "game over" do

    it "returns false if noone is at 0HP" do
      expect(game.game_over?).to be false
    end

    it "returns true if at least one player is at 0HP" do
      expect(finished_game.game_over?).to be true
    end

  end

  describe "loser" do

    it "returns a player on less than 0HP" do
      expect(finished_game.loser).to eq dead_player
    end

  end

end
