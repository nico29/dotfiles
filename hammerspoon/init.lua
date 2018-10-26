-- hotkey for Notion
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
    local notion = hs.application.get("Notion")
    if notion == nil then
        notion = hs.application.open("Notion")
    end
    if not notion:isFrontmost() then
        notion:activate()
    else
        notion:hide()
    end
end)

-- hotkey for Hyper
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "space", function()
    local notion = hs.application.get("Hyper")
    if notion == nil then
        notion = hs.application.open("Hyper")
    end
    if not notion:isFrontmost() then
        notion:activate()
    else
        notion:hide()
    end
end)

