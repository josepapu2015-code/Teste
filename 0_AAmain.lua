-- main UI.Separator()
-----------------------------
-- DonatorFix
-- Autor: LoboLupus
-- Projeto criado para NTO Ultimate
-- Edited by: LoboLupus
-----------------------------
local loadPanelName = "Donator"
local ui = setupUI([[
Panel
  height: 20

  Label
    id: editDonator
    color: pink
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text-align: center
    text: LoboLupus
]], parent)

-- cores que vão piscar
local colors = { "#FF0000", "#00FF00", "#0000ff" }
local colorIndex = 1

-- macro de piscar
macro(500, function()
    if not ui or not ui.editDonator then return end

    ui.editDonator:setColor(colors[colorIndex])
    colorIndex = colorIndex + 1
    if colorIndex > #colors then
        colorIndex = 1
    end
end)


 local loadPanelName = "Discord"
  local ui = setupUI([[
Panel

  height: 20

  Button
    id: editDiscord
    color: red
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text: - Website  -
    tooltip: Grupo no discord


  ]], parent)


ui.editDiscord.onClick = function(widget)
g_platform.openUrl("https://lobolupusscripts.blogspot.com/")
end





