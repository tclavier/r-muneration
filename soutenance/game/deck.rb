require 'squib'
require 'yaml'

Copywright = "CC~BY-SA~3.0~FR Ajiro.fr, version: v1"

def cutmark(top, left, right, bottom, size)
  line x1: left, y1: top, x2: left+size, y2: top, stroke_width: 1, cap: :round, stroke_color: 'white'
  line x1: left, y1: top, x2: left, y2: top+size, stroke_width: 1, cap: :round, stroke_color: 'white'

  line x1: right, y1: top, x2: right, y2: top+size, stroke_width: 1, cap: :round, stroke_color: 'white'
  line x1: right, y1: top, x2: right-size, y2: top, stroke_width: 1, cap: :round, stroke_color: 'white'

  line x1: left, y1: bottom, x2: left+size, y2: bottom, stroke_width: 1, cap: :round, stroke_color: 'white'
  line x1: left, y1: bottom, x2: left, y2: bottom-size, stroke_width: 1, cap: :round, stroke_color: 'white'

  line x1: right, y1: bottom, x2: right-size, y2: bottom, stroke_width: 1, cap: :round, stroke_color: 'white'
  line x1: right, y1: bottom, x2: right, y2: bottom-size, stroke_width: 1, cap: :round, stroke_color: 'white'
end


def debug_grid()
  grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
  grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4
end


Cards = YAML.load_file('data/cards.yml')
Squib::Deck.new(cards: Cards.size, layout: 'layout-cards.yml') do
  background color: 'black'

  png file: 'images/ginkgo.png', layout: 'safe'

  rect layout: 'title_background'
  text str: Cards.map { |e| e["title"]}, layout: 'title_text'

  svg file: Cards.map {|i| i['icon'] }, layout: 'art'

  rect layout: 'description_background'
  text str: Cards.map { |e| e["description"]}, layout: 'description_text'

  text str: Copywright, layout: 'copyright'
  cutmark 40, 40, 785, 1085, 10

  save format: :pdf, file: "cards.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
end


Items = {
  etp: 'icons/sands-of-time.svg',
  category: 'icons/take-my-money.svg',
  variable: 'icons/van-damme-split.svg',
  xp: 'icons/power-lightning.svg',
  anciennete: 'icons/medal.svg',
}

Personas = YAML.load_file('data/personas.yml')
Squib::Deck.new(cards: Personas.size, layout: 'layout-personas.yml') do
  background color: 'black'

  png file: 'images/ginkgo.png', layout: 'safe'

  rect layout: 'title_background'
  text str: Personas.map { |e| e["title"]}, layout: 'title'
  text str: Personas.map { |e| e["role"]}, layout: 'role'

  png file: Personas.map {|i| "images/#{i['icon'].downcase}" }, layout: 'photo'

  rect layout: 'description_background'
  text str: Personas.map { |e| e["description"]}, layout: 'description_text'

  rect layout: 'item_background'
  Items.each do |key,icon|
    svg file: icon, layout: "#{key}_icon"
    text str: Personas.map { |e| e["#{key}"]}, layout: "#{key}_text"
  end

  text str: Copywright, layout: 'copyright'
  cutmark 40, 40, 785, 1085, 10

  save format: :pdf, file: "personas.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
end
