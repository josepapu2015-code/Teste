-----------------------------
-- DonatorFix
-- Projeto criado para NTO Ultimate
-- Edited by: LoboLupus
-----------------------------
-- tools tab
setDefaultTab("Hotkeys")

--  UI.Separator() local customPanelName = "Custom"
  local ui = setupUI([[
Panel

  height: 25

  Label
    id: editCustom
    color: red
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
    text: .        -  @LoboLupus FIX   -      .


  ]], parent)


ui.editCustom.onClick = function(widget)
reload()
end
local sep = UI.Separator()
sep:setHeight(1)
sep:setOpacity(0.05)