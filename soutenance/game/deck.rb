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
Squib::Deck.new(cards: Cards.size, layout: 'layout.yml') do
  background color: 'white'

  rect layout: 'cut'
  png file: 'images/ginkgo.png', layout: 'safe'

  rect layout: 'title_background'
  text str: Cards.map { |e| e["title"]}, layout: 'title'

  svg file: Cards.map {|i| i['icon'] }, layout: 'art'

  rect layout: 'description_background'
  text str: Cards.map { |e| e["description"]}, layout: 'description'

  text str: Copywright, layout: 'copyright'
  cutmark 40, 40, 785, 1085, 10

  #debug_grid

  save format: :pdf, file: "cards.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
end

Personas = YAML.load_file('data/personas.yml')
Squib::Deck.new(cards: Personas.size, layout: 'layout.yml') do
  background color: 'white'

  rect layout: 'cut'
  png file: 'images/ginkgo.png', layout: 'safe'

  rect layout: 'title_background'
  text str: Personas.map { |e| e["title"]}, layout: 'title'

  png file: Personas.map {|i| "images/#{i['icon'].downcase}" }, layout: 'photo'

  rect layout: 'persona_description_background'
  text str: Personas.map { |e| e["description"]}, layout: 'persona_description'

  text str: Copywright, layout: 'copyright'
  cutmark 40, 40, 785, 1085, 10

  rect layout: 'item_background'

  svg file: 'icons/sands-of-time.svg', layout: 'etp_icon'
  text str: Personas.map { |e| e["ETP"]}, layout: 'etp_text'

  svg file: 'icons/take-my-money.svg', layout: 'category_icon'
  text str: Personas.map { |e| e["Catégorie"]}, layout: 'category_text'

  svg file: 'icons/van-damme-split.svg', layout: 'variable_icon'
  text str: Personas.map { |e| e["Variable"]}, layout: 'variable_text'

  svg file: 'icons/power-lightning.svg', layout: 'xp_icon'
  text str: Personas.map { |e| e["XP"]}, layout: 'xp_text'

  svg file: 'icons/medal.svg', layout: 'anciennete_icon'
  text str: Personas.map { |e| e["ancienneté"]}, layout: 'anciennete_text'

  #debug_grid

  save format: :pdf, file: "personas.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
end
