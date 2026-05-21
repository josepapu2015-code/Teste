  local loadPanelName = "Jutsu"
  local ui = setupUI([[
Panel

  height: 20

  Button
    id: editJutsu
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text: - Jutsu  -
    tooltip: !jutsu


  ]], parent)

ui.editJutsu.onClick = function(widget)
say("!jutsu")
end

local loadPanelName = "Outfit"
local ui = setupUI([[
Panel
  height: 20

  Button
    id: editOutfit
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text: - Outfit -
    tooltip: Escolher Roupa
]], parent)

ui.editOutfit.onClick = function()
  g_game.requestOutfit()
end


  local loadPanelName = "Zoom"
  local ui = setupUI([[
Panel

  height: 20

  Button
    id: editZoom
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text: - Zoom Map  -
    tooltip: Aproximar a tela


  ]], parent)


ui.editZoom.onClick = function(widget)
zoomIn()
end 

  local loadPanelName = "Zoom2"
  local ui = setupUI([[
Panel

  height: 20

  Button
    id: editZoom2
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text: - Zoom Map  -
    tooltip: Afastar a tela


  ]], parent)


ui.editZoom2.onClick = function(widget)
zoomOut()
end 