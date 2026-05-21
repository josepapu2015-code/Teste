-----------------------------
-- Auto Jutsu Especial (Delay Fixo)
-- Autor: LoboLupus
-- NTO Ultimate
-----------------------------
storage.autoSpecial = storage.autoSpecial or {
  spell = "",
  delay = 500, --delay fixo (ms)
  nextTry = 0
}

local sep = UI.Separator()
sep:setHeight(1)
sep:setOpacity(0.05)

local spellEdit = UI.TextEdit(storage.autoSpecial.spell ~= "" and storage.autoSpecial.spell or "Nome do jutsu")
spellEdit:setTooltip("Jutsu especial area/reta")

spellEdit.onTextChange = function(_, text)
  text = text:trim()
  if text ~= "" then
    storage.autoSpecial.spell = text
  end
end

macro(200, "Jutsu Especial", function()
  if storage.autoSpecial.spell == "" then return end
  if not g_game.isAttacking() then return end

  if now >= storage.autoSpecial.nextTry then
    storage.autoSpecial.nextTry = now + storage.autoSpecial.delay
    say(storage.autoSpecial.spell)
  end
end)
