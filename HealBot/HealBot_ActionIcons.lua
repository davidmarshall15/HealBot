local lGlow=HealBot_Libs_LibGlow()
local LSM = HealBot_Libs_LSM()
local grpFrame={}
local iconFrame={}
local actionIcons={}
local actionIconFrame={}
local cursorIcon={}
local hbSelfAbility={}
local hbSelfAbilityRev={}
local hbCDRunning={}
local hbOnCD={}
local hbItem={}
local hbBuffTags={}
local hbDebuffTags={}
local hbConfigCache={[1]={},[2]={},[3]={},[4]={},[5]={},[6]={},[7]={},[8]={},[9]={},[10]={}}
local hbTmpConfigCache={[1]={},[2]={},[3]={},[4]={},[5]={},[6]={},[7]={},[8]={},[9]={},[10]={}}
local hbCacheMap={[0]={["Frame"]=0,["ID"]=0},[1]={["Frame"]=0,["ID"]=0}}
local hbIconUID={}
local hbBuffGUID={}
local hbDebuffGUID={}
local hbHealthGUID={}
local hbManaGUID={}
local hbAggroGUID={}
local hbFallGUID={}
local hbSwimGUID={}
local hbIconKey={}
local activeFrames={}
local activeFramesIdx={}
local HealBot_ActionIcons_luVars={}
local xButton, pButton
local _
cursorIcon.OnFrame=0
HealBot_ActionIcons_luVars["Loaded"]=false
HealBot_ActionIcons_luVars["inCombat"]=false
HealBot_ActionIcons_luVars["inGroup"]=false
HealBot_ActionIcons_luVars["inInst"]=false
HealBot_ActionIcons_luVars["HazardFreq"]=0.3
HealBot_ActionIcons_luVars["HazardMinAlpha"]=0.25
HealBot_ActionIcons_luVars["MaxIcons"]=20
HealBot_ActionIcons_luVars["TankUnit"]="x"

function HealBot_ActionIcons_setLuVars(vName, vValue)
    HealBot_ActionIcons_luVars[vName]=vValue
      --HealBot_setCall("HealBot_ActionIcons_setLuVars")
end

function HealBot_ActionIcons_retLuVars(vName)
      --HealBot_setCall("HealBot_ActionIcons_retLuVars")
    return HealBot_ActionIcons_luVars[vName]
end

function HealBot_ActionIcons_LoadSpec(updateAll)
    local spec=HealBot_Action_GetActionIconSpec()
    if HealBot_Config_Spells.ActionIconsData and HealBot_Config_Spells.ActionIconsData[HealBot_Data["PGUID"]] and HealBot_Config_Spells.ActionIconsData[HealBot_Data["PGUID"]][spec] then
        Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin]=HealBot_Options_copyTable(HealBot_Config_Spells.ActionIconsData[HealBot_Data["PGUID"]][spec])
        HealBot_Options_CheckActionIconsProfile()
    else
        HealBot_Timers_Set("OOC","SaveActionIconsProfile",1)
    end
    if HealBot_Config_Spells.ActionIcons and HealBot_Config_Spells.ActionIcons[HealBot_Data["PGUID"]] and HealBot_Config_Spells.ActionIcons[HealBot_Data["PGUID"]][spec] then
        Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin]=HealBot_Options_copyTable(HealBot_Config_Spells.ActionIcons[HealBot_Data["PGUID"]][spec])
    end
    if updateAll then
        HealBot_Timers_Set("OOC","ActionIconsNumbers",0.2)
        HealBot_Timers_Set("OOC","SaveActionIconsProfile",1)
    end
      --HealBot_setCall("HealBot_ActionIcons_LoadSpec")
end

function HealBot_ActionIcons_InitFrames()
    if not HealBot_ActionIcons_luVars["Loaded"] then
        if not InCombatLockdown() then
            HealBot_ActionIcons_LoadSpec()
            cursorIcon.isVisible=false
            HealBot_ActionIcons_luVars["Loaded"]=true
            local uid=0
            for x=1,10 do
                if not Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["NUMICONS"] then
                    Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["NUMICONS"]=0
                end
                grpFrame[x]=_G["f"..x.."_HealBot_Action"]
                iconFrame[x]=_G["fi"..x.."_HealBot_ActionIcons"]
                if not iconFrame[x] then
                    --iconFrame[x]=CreateFrame("Frame", "fi"..x.."_HealBot_ActionIcons", grpFrame[x], BackdropTemplateMixin and "SecureFrameTemplate,BackdropTemplate")
                    --iconFrame[x]:SetBackdrop({
                    --    edgeFile = "Interface\\Addons\\HealBot\\Images\\border",
                    --    edgeSize = 8,
                    --    insets = { left = 3, right = 3, top = 3, bottom = 3, },
                    --})
                    iconFrame[x]=CreateFrame("Frame", "fi"..x.."_HealBot_ActionIcons", grpFrame[x], "SecureFrameTemplate")
                    iconFrame[x].id=x
                    iconFrame[x]:SetMovable(false)
                    iconFrame[x]:EnableMouse(false)
                    iconFrame[x]:SetFrameLevel(1)
                    iconFrame[x]:SetFrameStrata(HealBot_Globals.FrameStrata)
                    iconFrame[x]:UnregisterAllEvents()
                    
                    actionIcons[x]={}
                    actionIconFrame[x]={}
                    for y=1,HealBot_ActionIcons_luVars["MaxIcons"] do
                        uid=uid+1
                        hbIconUID[uid]={}
                        hbIconUID[uid]["Frame"]=x
                        hbIconUID[uid]["ID"]=y
                        actionIconFrame[x][y]=CreateFrame("Frame", "f"..x.."i"..y.."_HealBot_ActionIconFrame", grpFrame[x], BackdropTemplateMixin and "SecureFrameTemplate,BackdropTemplate")
                        actionIconFrame[x][y]:SetFrameLevel(3)
                        actionIconFrame[x][y]:SetBackdrop({
                        --    edgeFile = "Interface\\Addons\\HealBot\\Images\\border",
                            edgeFile = "Interface\\Buttons\\WHITE8X8",
                            edgeSize = 3,
                            insets = { left = 2, right = 2, top = 2, bottom = 2, },
                        })
                        actionIconFrame[x][y].cdText=actionIconFrame[x][y]:CreateFontString()
                        actionIconFrame[x][y].cdText:SetWordWrap(false)
                        actionIconFrame[x][y].countText=actionIconFrame[x][y]:CreateFontString()
                        actionIconFrame[x][y].countText:SetWordWrap(false)
                        actionIcons[x][y]=CreateFrame("Button", "ActionIcon_f"..x.."i"..y , actionIconFrame[x][y], "SecureActionButtonTemplate")
                        actionIcons[x][y]:SetFrameLevel(2)
                        actionIcons[x][y]:SetNormalTexture([[Interface\Addons\HealBot\Images\icon_outline]])
                        actionIcons[x][y].frame=x
                        actionIcons[x][y].id=y
                        actionIcons[x][y].filter=0
                        actionIcons[x][y].auraStacks=0
                        actionIcons[x][y].health=100
                        actionIcons[x][y].mana=100
                        actionIcons[x][y].aggro=0
                        actionIcons[x][y].glowStyle=0
                        actionIcons[x][y].glowEnd=0
                        actionIcons[x][y].count=0
                        actionIcons[x][y].uid=uid
                        hbIconUID[uid]["Icon"]=actionIcons[x][y]
                        HealBot_ActionIcons_FadeIcon(x, y)

                       -- actionIcons[x][y]:UnregisterAllEvents()
                        actionIcons[x][y]:EnableMouse(false)
                        actionIcons[x][y]:SetMovable(false)
                        actionIcons[x][y]:SetScript("OnReceiveDrag", function(self) HealBot_ActionIcons_OnReceiveDrag(self) end)
                        actionIcons[x][y]:SetScript("OnMouseDown", function(self, button) HealBot_ActionIcons_OnMouseDown(self, button) end)
                        actionIcons[x][y]:SetScript("OnEnter", function(self) HealBot_ActionIcons_OnEnter(self) end)
                        actionIcons[x][y]:SetScript("OnLeave", function(self) HealBot_ActionIcons_OnLeave(self) end)
                        actionIcons[x][y]:RegisterForClicks("LeftButtonDown")
                    end
                    HealBot_ActionIcons_UpdateNumIcons(x)
                end
            end
            HealBot_Options_FramesActionIconsSetLists()
            HealBot_ActionIcons_SetGlowSize()
        else
            HealBot_Timers_Set("OOC","ActionIconsInitFrames",1)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_InitFrames")
end

function HealBot_ActionIcons_setCountFont(frame, id)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTCOL"] then
        actionIconFrame[frame][id].countText:SetTextColor(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTCOL"]["R"],
                                                          Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTCOL"]["G"],
                                                          Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTCOL"]["B"],
                                                          Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTCOL"]["A"]*actionIcons[frame][id]:GetAlpha())
    else
        actionIconFrame[frame][id].countText:SetTextColor(1,1,1,actionIcons[frame][id]:GetAlpha())
    end
end

function HealBot_ActionIcons_setFont(frame, id)
    actionIconFrame[frame][id].cdText:ClearAllPoints()
    actionIconFrame[frame][id].cdText:SetPoint("CENTER",(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTHOFFSET"] or 0),
                                                   (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTVOFFSET"] or 0))
    actionIconFrame[frame][id].cdText:SetFont(LSM:Fetch('font',(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONT"] or HealBot_Default_Font)),
                                          (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTSIZE"] or 18),--*frameScale),
                                          HealBot_Font_Outline[(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTOUTLINE"] or 2)])
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOL"] then
        actionIconFrame[frame][id].cdText:SetTextColor(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOL"]["R"],
                                                       Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOL"]["G"],
                                                       Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOL"]["B"],
                                                       Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOL"]["A"])
    else
        actionIconFrame[frame][id].cdText:SetTextColor(1,1,1,1)
    end
    
    actionIconFrame[frame][id].countText:ClearAllPoints()
    actionIconFrame[frame][id].countText:SetPoint("BOTTOMRIGHT",(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTHOFFSET"] or 0),
                                                   (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTVOFFSET"] or 0))
    actionIconFrame[frame][id].countText:SetFont(LSM:Fetch('font',(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNT"] or HealBot_Default_Font)),
                                          (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTSIZE"] or 12),--*frameScale),
                                          HealBot_Font_Outline[(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FONTCOUNTOUTLINE"] or 2)])
    HealBot_ActionIcons_setCountFont(frame, id)
    actionIconFrame[frame][id].FontSet=true
      --HealBot_setCall("HealBot_ActionIcons_setFont")
end

function HealBot_ActionIcons_setFontChange()
    for x=1,10  do
        for y=1,HealBot_ActionIcons_luVars["MaxIcons"] do
            if actionIconFrame[x][y].FontSet then
                HealBot_ActionIcons_setFont(x, y)
            end
        end
    end
    HealBot_Timers_Set("OOC","SaveActionIconsProfile",0.1)
      --HealBot_setCall("HealBot_ActionIcons_setFontChange")
end

local hb_ActionHazard_BorderHighlightCol={}
hb_ActionHazard_BorderHighlightCol.r=1
hb_ActionHazard_BorderHighlightCol.g=1
hb_ActionHazard_BorderHighlightCol.b=1
function HealBot_ActionIcons_setBorderHighlightCol()
    if HealBot_Globals.OverrideColours["USEADAPTIVE"]==2 then
        hb_ActionHazard_BorderHighlightCol.r=HealBot_Globals.OverrideAdaptiveCol["Highlight"].R
        hb_ActionHazard_BorderHighlightCol.g=HealBot_Globals.OverrideAdaptiveCol["Highlight"].G
        hb_ActionHazard_BorderHighlightCol.b=HealBot_Globals.OverrideAdaptiveCol["Highlight"].B
    else
        hb_ActionHazard_BorderHighlightCol.r=Healbot_Config_Skins.AdaptiveCol[Healbot_Config_Skins.Current_Skin]["Highlight"].R
        hb_ActionHazard_BorderHighlightCol.g=Healbot_Config_Skins.AdaptiveCol[Healbot_Config_Skins.Current_Skin]["Highlight"].G
        hb_ActionHazard_BorderHighlightCol.b=Healbot_Config_Skins.AdaptiveCol[Healbot_Config_Skins.Current_Skin]["Highlight"].B
    end
      --HealBot_setCall("HealBot_ActionIcons_setBorderHighlightCol")
end

function HealBot_ActionIcons_OnEnter(self)
    if cursorIcon.RightClick then 
        cursorIcon.OnFrame=self.frame
        cursorIcon.OnID=self.id
    end
    local infoType, info1, _, info3 = GetCursorInfo()
    if infoType then
        cursorIcon.infoType=infoType
        if infoType == "item" then
            cursorIcon.info="I:"..info1
        elseif infoType == "spell" then
            cursorIcon.info="S:"..info3
        elseif infoType == "macro" then
            cursorIcon.info=info1
        end
    else
        cursorIcon.infoType=false
        HealBot_ActionIcons_ClearConfig(self.frame, self.id)
    end
    if HealBot_Data["TIPUSE"] then
        HealBot_Tooltip_DisplayActionIconTooltip(self.frame, self.infoType, self.infoID, self.name, self.info, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][self.id][self.frame]["Target"])
    end
    HealBot_ActionIcons_UpdateHazardIconBordersColours(actionIconFrame[self.frame][self.id], hb_ActionHazard_BorderHighlightCol.r,hb_ActionHazard_BorderHighlightCol.g,hb_ActionHazard_BorderHighlightCol.b,0.5)
      --HealBot_setCall("HealBot_ActionIcons_OnEnter")
end

function HealBot_ActionIcons_OnLeave(self)
    cursorIcon.OnFrame=0
    cursorIcon.OnID=0
    if HealBot_Data["TIPUSE"] then
        HealBot_Tooltip_Hide()
    end
    HealBot_ActionIcons_UpdateHazardIconBordersColours(actionIconFrame[self.frame][self.id], 1,1,1,0)
      --HealBot_setCall("HealBot_ActionIcons_OnLeave")
end

function HealBot_ActionIcons_CursorChanged(isDefault, newCursorType)
    if newCursorType==0 and cursorIcon.OnFrame>0 and cursorIcon.infoType then
        HealBot_ActionIcons_CursorUpdateIcon(cursorIcon.infoType,
                                             cursorIcon.OnFrame,
                                             cursorIcon.OnID,
                                             cursorIcon.info)
    end
      --HealBot_setCall("HealBot_ActionIcons_CursorChanged")
end

function HealBot_ActionIcons_RightOnFrame(frame, id)
    cursorIcon.RightClick=true
    cursorIcon.OnFrame=frame
    cursorIcon.OnID=id
      --HealBot_setCall("HealBot_ActionIcons_RightOnFrame")
end

function HealBot_ActionIcons_StoreConfig(frame, id, tmp)
    if tmp then
        hbTmpConfigCache[frame][id]=HealBot_Options_copyTable(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame])
        hbCacheMap[1]["Frame"]=frame
        hbCacheMap[1]["ID"]=id
        --HealBot_ActionIcons_Debug(frame, id, "StoreConfig - TMP")
    else
        hbConfigCache[frame][id]=HealBot_Options_copyTable(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame])
        hbCacheMap[0]["Frame"]=frame
        hbCacheMap[0]["ID"]=id
        --HealBot_ActionIcons_Debug(frame, id, "StoreConfig - LIVE")
    end
      --HealBot_setCall("HealBot_ActionIcons_StoreConfig")
end

function HealBot_ActionIcons_SwapConfig(frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "SwapConfig - TRY")
    if hbTmpConfigCache[frame][id] then
        hbConfigCache[frame][id]=HealBot_Options_copyTable(hbTmpConfigCache[frame][id])
        HealBot_ActionIcons_ClearConfig(frame, id, true)
        --HealBot_ActionIcons_Debug(frame, id, "SwapConfig - DONE")
    end
      --HealBot_setCall("HealBot_ActionIcons_SwapConfig")
end

function HealBot_ActionIcons_UpdateConfig(frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "UpdateConfig - TRY")
    if hbCacheMap[0]["Frame"]>0 and hbCacheMap[0]["ID"]>0 and hbConfigCache[hbCacheMap[0]["Frame"]][hbCacheMap[0]["ID"]] then
        Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]=HealBot_Options_copyTable(hbConfigCache[hbCacheMap[0]["Frame"]][hbCacheMap[0]["ID"]])
        HealBot_ActionIcons_ClearConfig(hbCacheMap[0]["Frame"], hbCacheMap[0]["ID"])
        --HealBot_ActionIcons_Debug(frame, id, "UpdateConfig - DONE")
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateConfig")
end

function HealBot_ActionIcons_ClearConfig(frame, id, tmp)
    --HealBot_ActionIcons_Debug(frame, id, "ClearConfig - TRY")
    if tmp then
        if hbTmpConfigCache[frame][id] then
            hbTmpConfigCache[frame][id]=nil
            --HealBot_ActionIcons_Debug(frame, id, "StoreConfig - TMP - DONE")
        end
    elseif hbConfigCache[frame][id] then
        hbConfigCache[frame][id]=nil
        --HealBot_ActionIcons_Debug(frame, id, "StoreConfig - LIVE - DONE")
    end
      --HealBot_setCall("HealBot_ActionIcons_ClearConfig")
end

local modKey=1 -- Not Locked
function HealBot_ActionIcons_IsIconLocked(frame)
    if HealBot_Data["UILOCK"] then
        return true
    else
        modKey=1 -- Not Locked
        if (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["LOCK"] or 1)>1 then
            if IsAltKeyDown() then 
                if IsControlKeyDown() then
                    modKey=4
                else
                    modKey=3
                end
            elseif IsControlKeyDown() then
                modKey=2
            end
        end
        if HealBot_Action_retLuVars("TestBarsOn") or (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["LOCK"] or 1)==modKey then
            return false
        else
            return true
        end
    end
end

function HealBot_ActionIcons_ClearIconFrame(frame, id, info)
    HealBot_ActionIcons_RightOnFrame(frame, id)
    HealBot_ActionIcons_CursorUpdateIcon("nil", frame, id)
    if hbSelfAbility[info] then hbSelfAbility[info][actionIcons[frame][id].uid]=nil end
    --HealBot_ActionIcons_Debug(frame, id, "ClearIconFrame - info="..(info or ""))
end

function HealBot_ActionIcons_OnMouseDown(self, button)
    if button=="RightButton" then
        if not HealBot_ActionIcons_IsIconLocked(self.frame) then
            if actionIcons[self.frame][self.id].infoType and actionIcons[self.frame][self.id].infoID then
                cursorIcon.infoType=actionIcons[self.frame][self.id].infoType
                cursorIcon.info=actionIcons[self.frame][self.id].info
                HealBot_ActionIcons_StoreConfig(self.frame, self.id)
                if actionIcons[self.frame][self.id].infoType=="item" then
                    PickupItem(actionIcons[self.frame][self.id].infoID)
                elseif actionIcons[self.frame][self.id].infoType=="spell" then
                    PickupSpell(actionIcons[self.frame][self.id].infoID)
                elseif actionIcons[self.frame][self.id].infoType=="macro" then
                    PickupMacro(actionIcons[self.frame][self.id].infoID)
                end
            end
            HealBot_ActionIcons_ClearIconFrame(self.frame, self.id, HealBot_ActionIcons_GetSpell(cursorIcon.info))
        end
    else
        HealBot_ActionIcons_OnReceiveInfo(self.frame, self.id)
    end
      --HealBot_setCall("HealBot_ActionIcons_OnMouseDown")
end

function HealBot_ActionIcons_CursorUpdateIcon(infoType, frame, id, info)
    if infoType == "nil" then
        actionIcons[frame][id].infoType=false
        actionIcons[frame][id].infoID=false
        actionIcons[frame][id].info=false
        if HealBot_Options_SkinsFrameActionIconsConfig:IsVisible() and id==HealBot_Options_retLuVars("ActionIconsID") then
            HealBot_Options_ActionIconsConfigAbility:SetText("")
        else
            HealBot_Options_ActionIconsConfigAbilityTextUpdate(frame, id, nil)
        end
    else
        local prevType,prevID,prevInfo=nil,nil,nil
        if actionIcons[frame][id].valid then
            prevType,prevID,prevInfo=actionIcons[frame][id].infoType,actionIcons[frame][id].infoID,actionIcons[frame][id].info
            HealBot_ActionIcons_StoreConfig(frame, id, true)
        else
            cursorIcon.RightClick=false
        end
        if infoType=="macro" then info=GetMacroInfo(info) end
        HealBot_ActionIcons_UpdateConfig(frame, id)
        HealBot_Options_ActionIconsConfigAbilityTextUpdate(frame, id, info)
        if HealBot_Options_SkinsFrameActionIconsConfig:IsVisible() and id==HealBot_Options_retLuVars("ActionIconsID") then
            HealBot_Options_SkinsFramesActionIconsConfigTab("SkinsFramesActionIconsConfig", true)
            HealBot_Options_ActionIconsAlertFilterHideShow(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertFilter"])
        end
        if prevType then
            HealBot_ActionIcons_SwapConfig(frame, id)
            cursorIcon.infoType=prevType
            cursorIcon.info=prevInfo
            if prevType=="item" then
                PickupItem(prevID)
            elseif prevType=="spell" then
                PickupSpell(prevID)
            elseif prevType=="macro" then
                PickupMacro(prevID)
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_CursorUpdateIcon")
end

function HealBot_ActionIcons_OnReceiveInfo(frame, id)
    local infoType, info1, _, info3 = GetCursorInfo()
    if infoType then
        if infoType == "item" then
            HealBot_ActionIcons_CursorUpdateIcon(infoType, frame, id, "I:"..info1)
        elseif infoType == "spell" then
            HealBot_ActionIcons_CursorUpdateIcon(infoType, frame, id, "S:"..info3)
        elseif infoType == "macro" then
            local name=GetMacroInfo(info1)
            HealBot_ActionIcons_CursorUpdateIcon(infoType, frame, id, name)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_OnReceiveInfo")
end

function HealBot_ActionIcons_OnReceiveDrag(self)
    HealBot_ActionIcons_OnReceiveInfo(self.frame, self.id)
      --HealBot_setCall("HealBot_ActionIcons_OnReceiveDrag")
end

local hb_ActionHazard_ButtonIcons={}
local hb_ActionHazard_IconData={}
function HealBot_ActionIcons_UpdateHazardIconBordersColours(icon, r, g, b, a)
    icon:SetBackdropBorderColor(r, g, b, a)
      --HealBot_setCall("HealBot_ActionIcons_UpdateHazardIconBordersColours")
end

function HealBot_ActionIcons_UpdateIconHazardBorders()
    HealBot_ActionIcons_luVars["IconHazardCurrentInUse"]=false
    if HealBot_ActionIcons_luVars["IconHazardAltAlpha"] then
        HealBot_ActionIcons_luVars["IconHazardAltAlpha"]=false
        for id,icon in pairs(hb_ActionHazard_ButtonIcons) do
            HealBot_ActionIcons_luVars["IconHazardCurrentInUse"]=true
            HealBot_ActionIcons_UpdateHazardIconBordersColours(icon, hb_ActionHazard_IconData[id].r,hb_ActionHazard_IconData[id].g,hb_ActionHazard_IconData[id].b, hb_ActionHazard_IconData[id].a)
        end
    else
        HealBot_ActionIcons_luVars["IconHazardAltAlpha"]=true
        for id,icon in pairs(hb_ActionHazard_ButtonIcons) do
            HealBot_ActionIcons_luVars["IconHazardCurrentInUse"]=true
            HealBot_ActionIcons_UpdateHazardIconBordersColours(icon, hb_ActionHazard_IconData[id].r,hb_ActionHazard_IconData[id].g,hb_ActionHazard_IconData[id].b, HealBot_ActionIcons_luVars["HazardMinAlpha"])
        end
    end

    if HealBot_ActionIcons_luVars["IconHazardCurrentInUse"] then
        C_Timer.After(HealBot_ActionIcons_luVars["HazardFreq"], function() HealBot_ActionIcons_UpdateIconHazardBorders() end)
    else
        HealBot_ActionIcons_luVars["IconHazardInUse"]=false
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateIconHazardBorders")
end

function HealBot_ActionIcons_EnableIconBorderHazard(iFrame, uid, r, g, b, a)
    if not hb_ActionHazard_IconData[uid] then hb_ActionHazard_IconData[uid]={} end
    hb_ActionHazard_IconData[uid].r=r
    hb_ActionHazard_IconData[uid].g=g
    hb_ActionHazard_IconData[uid].b=b
    hb_ActionHazard_IconData[uid].a=a
    hb_ActionHazard_ButtonIcons[uid]=iFrame
    if not HealBot_ActionIcons_luVars["IconHazardInUse"] then
        HealBot_ActionIcons_luVars["IconHazardInUse"]=true
        HealBot_ActionIcons_luVars["IconHazardAltAlpha"]=true
        HealBot_ActionIcons_UpdateIconHazardBorders()
    end
      --HealBot_setCall("HealBot_ActionIcons_EnableIconBorderHazard")
end

function HealBot_ActionIcons_DisableIconBorderHazard(iFrame, uid)
    hb_ActionHazard_ButtonIcons[uid]=nil
    iFrame:SetBackdropBorderColor(0,0,0,0)
      --HealBot_setCall("HealBot_ActionIcons_DisableIconBorderHazard")
end

local hbGlowCol={}
local hbGlowFreq=0.28
local hbIconGlowLen={[1]=3, [2]=3, [3]=3, [4]=3, [5]=3, [6]=3, [7]=3, [8]=3, [9]=3, [10]=3}
local hbIconGlowSize={[1]=1, [2]=1, [3]=1, [4]=1, [5]=1, [6]=1, [7]=1, [8]=1, [9]=1, [10]=1}



function HealBot_ActionIcons_SetGlowSize()
    for x=1,10 do
        if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["GLOWSIZE"] then
            hbIconGlowSize[x]=Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["GLOWSIZE"]
            hbIconGlowLen[x]=ceil(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["GLOWSIZE"]*1.25)
            for y=1,10 do
                actionIconFrame[x][y]:SetBackdrop({
                    edgeFile = "Interface\\Buttons\\WHITE8X8",
                    edgeSize = Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["GLOWSIZE"],
                    insets = { left = 2, right = 2, top = 2, bottom = 2, },
                })
                actionIconFrame[x][y]:SetBackdropBorderColor(0,0,0,0)
            end
        else
            hbIconGlowSize[x]=3
            hbIconGlowLen[x]=4
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SetGlowSize")
end

function HealBot_ActionIcons_IconGlow(frame, id, enable)
    if enable then
        lGlow.PixelGlow_Start(actionIconFrame[frame][id], hbGlowCol, 8, hbGlowFreq, hbIconGlowLen[frame], hbIconGlowSize[frame]+1, 1, 1, false, id)
    else
        lGlow.PixelGlow_Stop(actionIconFrame[frame][id], id)
    end
      --HealBot_setCall("HealBot_ActionIcons_IconGlow")
end

function HealBot_ActionIcons_IconGlowBall(frame, id, enable)
    if enable then
        lGlow.AutoCastGlow_Start(actionIconFrame[frame][id], hbGlowCol, 4, hbGlowFreq,  hbIconGlowSize[frame], 1, 1, id)
    else
        lGlow.AutoCastGlow_Stop(actionIconFrame[frame][id], id)
    end
      --HealBot_setCall("HealBot_ActionIcons_IconGlowBall")
end

function HealBot_ActionIcons_IconGlowBlizz(frame, id, enable)
    if enable then
        lGlow.ButtonGlow_Start(actionIconFrame[frame][id], hbGlowCol, hbGlowFreq)
    else
        lGlow.ButtonGlow_Stop(actionIconFrame[frame][id])
    end
      --HealBot_setCall("HealBot_ActionIcons_IconGlowBlizz")
end

function HealBot_ActionIcons_DisableIconGlow(frame, id)
    if actionIcons[frame][id].glowStyle==2 then
        HealBot_ActionIcons_DisableIconBorderHazard(actionIconFrame[frame][id], actionIcons[frame][id].uid)
    elseif actionIcons[frame][id].glowStyle==3 then
        HealBot_ActionIcons_IconGlow(frame, id, false)
    elseif actionIcons[frame][id].glowStyle==4 then
        HealBot_ActionIcons_IconGlowBall(frame, id, false)
    elseif actionIcons[frame][id].glowStyle==5 then
        HealBot_ActionIcons_IconGlowBlizz(frame, id, false)
    end
      --HealBot_setCall("HealBot_ActionIcons_DisableIconGlow")
end

function HealBot_ActionIcons_EndGlow(frame, id, eTime)
    if eTime==actionIcons[frame][id].glowEnd then
        HealBot_ActionIcons_DisableIconGlow(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_EndGlow")
end

function HealBot_ActionIcons_EnableIconGlow(frame, id)
    if Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowCol"] then
        hbGlowCol[1]=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowCol"]["R"]
        hbGlowCol[2]=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowCol"]["G"]
        hbGlowCol[3]=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowCol"]["B"]
        hbGlowCol[4]=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowCol"]["A"]
    else
        hbGlowCol[1]=1
        hbGlowCol[2]=0
        hbGlowCol[3]=0
        hbGlowCol[4]=1
    end
    if actionIcons[frame][id].glowStyle>1 and actionIcons[frame][id].glowStyle~=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowStyle"] then
        HealBot_ActionIcons_DisableIconGlow(frame, id)
    end
    actionIcons[frame][id].glowStyle=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowStyle"]
    if actionIcons[frame][id].glowStyle==2 then
        HealBot_ActionIcons_EnableIconBorderHazard(actionIconFrame[frame][id], actionIcons[frame][id].uid, hbGlowCol[1], hbGlowCol[2], hbGlowCol[3], hbGlowCol[4])
    elseif actionIcons[frame][id].glowStyle==3 then
        HealBot_ActionIcons_IconGlow(frame, id, true)
    elseif actionIcons[frame][id].glowStyle==4 then
        HealBot_ActionIcons_IconGlowBall(frame, id, true)
    else
        HealBot_ActionIcons_IconGlowBlizz(frame, id, true)
    end
    local eTime=HealBot_TimeNow+(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowTimeout"] or 60)
    actionIcons[frame][id].glowEnd=eTime
    C_Timer.After((Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowTimeout"] or 60), function() HealBot_ActionIcons_EndGlow(frame, id, eTime) end)
      --HealBot_setCall("HealBot_ActionIcons_EnableIconGlow")
end

function HealBot_ActionIcons_ShowHide(frame) 
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]==0 then
        HideUIPanel(iconFrame[frame])
    else
        ShowUIPanel(iconFrame[frame])
    end
    HealBot_ActionIcons_SetFramePoints(frame)
      --HealBot_setCall("HealBot_ActionIcons_ShowHide")
end

function HealBot_ActionIcons_UpdateNumIcons(frame, all)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]<HealBot_ActionIcons_luVars["MaxIcons"] then
        for y=Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]+1,HealBot_ActionIcons_luVars["MaxIcons"] do
            if actionIcons[frame][y].visible then
                actionIconFrame[frame][y]:Hide()
                actionIcons[frame][y]:Hide()
                actionIcons[frame][y].visible=false
            end
        end
    end
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            if not actionIcons[frame][y].visible then
                actionIconFrame[frame][y]:Show()
                actionIcons[frame][y]:Show()
                actionIcons[frame][y].visible=true
            end
        end
    end
    if not all then HealBot_ActionIcons_UpdateActiveFrameIdx() end
    HealBot_ActionIcons_ValidateTargetAllIcons(frame)
    HealBot_ActionIcons_ValidateAbilityFrame(frame)
    HealBot_ActionIcons_ShowHide(frame)
    HealBot_ActionIcons_SetAlpha(frame)
      --HealBot_setCall("HealBot_ActionIcons_UpdateNumIcons")
end

function HealBot_ActionIcons_UpdateNumIconsAll()
    if not HealBot_ActionIcons_luVars["UpdateNumIcons"] then
        HealBot_ActionIcons_luVars["UpdateNumIcons"]=true
        for x,_ in pairs(hbSelfAbility) do
            hbSelfAbility[x]=nil
        end
        HealBot_ActionIcons_UpdateNumIcons(1)
        for x=2,10 do
            C_Timer.After(x/50, function() HealBot_ActionIcons_UpdateNumIcons(x, true) end)
        end
        HealBot_Options_FramesActionIconsSetLists()
        C_Timer.After(0.25, function() HealBot_ActionIcons_setLuVars("UpdateNumIcons", false) end)
    else
        HealBot_Timers_Set("OOC","ActionIconsNumbers",0.25)
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateNumIconsAll")
end

local vFrameSetPointX,vFrameSetPointY=0,0
function HealBot_ActionIcons_SetPoints(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==4 or Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==8 then
        if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["DOUBLEROW"] then
            iconFrame[frame]:SetHeight((Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"])*ceil(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]/2))
            iconFrame[frame]:SetWidth(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"]*2))
        else
            iconFrame[frame]:SetHeight((Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"])*Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"])
            iconFrame[frame]:SetWidth(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"]*2))
        
        end
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["DOUBLEROW"] then
        iconFrame[frame]:SetWidth((Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"])*ceil(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]/2))
        iconFrame[frame]:SetHeight(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"]*2))
    else
        iconFrame[frame]:SetWidth((Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"])*Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"])
        iconFrame[frame]:SetHeight(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"]*2))
    end
    iconFrame[frame]:ClearAllPoints()
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==1 then
        iconFrame[frame]:SetPoint("BOTTOMLEFT",grpFrame[frame],"TOPLEFT",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==2 then
        iconFrame[frame]:SetPoint("BOTTOM",grpFrame[frame],"TOP",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==3 then
        iconFrame[frame]:SetPoint("BOTTOMRIGHT",grpFrame[frame],"TOPRIGHT",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==4 then
        iconFrame[frame]:SetPoint("LEFT",grpFrame[frame],"RIGHT",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==5 then
        iconFrame[frame]:SetPoint("TOPRIGHT",grpFrame[frame],"BOTTOMRIGHT",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==6 then
        iconFrame[frame]:SetPoint("TOP",grpFrame[frame],"BOTTOM",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==7 then
        iconFrame[frame]:SetPoint("TOPLEFT",grpFrame[frame],"BOTTOMLEFT",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==8 then
        iconFrame[frame]:SetPoint("RIGHT",grpFrame[frame],"LEFT",Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETX"],Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["OFFSETY"]);
    end
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            actionIcons[frame][y]:ClearAllPoints()
            actionIconFrame[frame][y]:ClearAllPoints()
            actionIconFrame[frame][y]:SetSize(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"],
                                              Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"]+Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"])
            actionIcons[frame][y]:SetSize(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"],
                                          Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SIZE"])
            actionIcons[frame][y]:SetPoint("TOP", actionIconFrame[frame][y],"TOP",0,-floor(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["SPACE"]/2))
            HealBot_ActionIcons_UpdateHazardIconBordersColours(actionIconFrame[frame][y], 1,1,1,0)
            if not actionIconFrame[frame][y].FontSet then
                HealBot_ActionIcons_setFont(frame, y)
            end
        end
        local row2=1000
        if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["DOUBLEROW"] then
            row2=ceil(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]/2)+1
        end
        if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==4 then
            actionIconFrame[frame][1]:SetPoint("TOP", iconFrame[frame], "TOP",0,0)
            for y=2,HealBot_ActionIcons_luVars["MaxIcons"] do
                if y==row2 then
                    actionIconFrame[frame][y]:SetPoint("LEFT", actionIconFrame[frame][1], "RIGHT",0,0)
                else
                    actionIconFrame[frame][y]:SetPoint("TOP", actionIconFrame[frame][y-1], "BOTTOM",0,0)
                end
            end
        elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]==8 then
            actionIconFrame[frame][1]:SetPoint("TOP", iconFrame[frame], "TOP",0,0)
            for y=2,HealBot_ActionIcons_luVars["MaxIcons"] do
                if y==row2 then
                    actionIconFrame[frame][y]:SetPoint("RIGHT", actionIconFrame[frame][1], "LEFT",0,0)
                else
                    actionIconFrame[frame][y]:SetPoint("TOP", actionIconFrame[frame][y-1], "BOTTOM",0,0)
                end
            end
        elseif Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["ANCHOR"]<4 then
            actionIconFrame[frame][1]:SetPoint("LEFT", iconFrame[frame], "LEFT",0,0)
            for y=2,HealBot_ActionIcons_luVars["MaxIcons"] do
                if y==row2 then
                    actionIconFrame[frame][y]:SetPoint("BOTTOM", actionIconFrame[frame][1], "TOP",0,0)
                else
                    actionIconFrame[frame][y]:SetPoint("LEFT", actionIconFrame[frame][y-1], "RIGHT",0,0)
                end
            end
        else
            actionIconFrame[frame][1]:SetPoint("LEFT", iconFrame[frame], "LEFT",0,0)
            for y=2,HealBot_ActionIcons_luVars["MaxIcons"] do
                if y==row2 then
                    actionIconFrame[frame][y]:SetPoint("TOP", actionIconFrame[frame][1], "BOTTOM",0,0)
                else
                    actionIconFrame[frame][y]:SetPoint("LEFT", actionIconFrame[frame][y-1], "RIGHT",0,0)
                end
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SetPoints")
end

function HealBot_ActionIcons_SetFramePoints(frame)        
    if HealBot_Data["UILOCK"] then
        HealBot_Timers_Set("OOC","ActionIconsSetPoints")
    else
        HealBot_ActionIcons_SetPoints(frame)
    end
      --HealBot_setCall("HealBot_ActionIcons_SetFramePoints")
end

function HealBot_ActionIcons_SetAllFramePoints()
    if #activeFramesIdx>0 then
        if not HealBot_ActionIcons_luVars["SetPoints"] then
            HealBot_ActionIcons_luVars["SetPoints"]=true
            for x=1,#activeFramesIdx do
                C_Timer.After(x/40, function() HealBot_ActionIcons_SetFramePoints(activeFramesIdx[x]) end)
            end
            C_Timer.After(0.25, function() HealBot_ActionIcons_setLuVars("SetPoints", false) end)
        else
            HealBot_Timers_Set("OOC","ActionIconsSetPoints",0.25)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SetAllFramePoints")
end

function HealBot_ActionIcons_UpdateHighlight(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            if actionIcons[frame][y].highlight then
                HealBot_ActionIcons_HighlightIcon(frame, y, "UpdateHighlight")
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateHighlight")
end

function HealBot_ActionIcons_UpdateFade(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            if not actionIcons[frame][y].highlight then
                HealBot_ActionIcons_FadeIcon(frame, y)
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateFade")
end

function HealBot_ActionIcons_ConditionChange(frame, id, old, new)
    if old<5 and old~=2 and (new==2 or new>4) then
        HealBot_ActionIcons_DeleteBuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuff"])
    elseif old>4 and old<9 and old~=6 and (new==6 or new>8 or new<5) then
        HealBot_ActionIcons_DeleteDebuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuff"])
    elseif old==2 then
        HealBot_ActionIcons_DeleteBuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffTag"])
    elseif old==6 then
        HealBot_ActionIcons_DeleteDebuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffTag"])
    elseif old==9 then
        HealBot_ActionIcons_DelHealth(frame, id)
    elseif old==10 then
        HealBot_ActionIcons_DelMana(frame, id)
    elseif old==11 then
        HealBot_ActionIcons_DelAggro(frame, id)
    elseif old==12 then
        HealBot_ActionIcons_DelFalling(frame, id)
    elseif old==13 then
        HealBot_ActionIcons_DelSwimming(frame, id)
    end
    if new<5 and new~=2 and (old==2 or old>4) then
        HealBot_ActionIcons_AddBuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuff"])
    elseif new>4 and new<9 and new~=6 and (old==6 or old>8 or old<5) then
        HealBot_ActionIcons_AddDebuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuff"])
    elseif new==2 then
        HealBot_ActionIcons_AddBuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffTag"])
    elseif new==6 then
        HealBot_ActionIcons_AddDebuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffTag"])
    elseif new==9 then
        HealBot_ActionIcons_AddHealth(frame, id)
    elseif new==10 then
        HealBot_ActionIcons_AddMana(frame, id)
    elseif new==11 then
        HealBot_ActionIcons_AddAggro(frame, id)
    elseif new==12 then
        HealBot_ActionIcons_AddFalling(frame, id)
    elseif new==13 then
        HealBot_ActionIcons_AddSwimming(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_ConditionChange")
end

function HealBot_ActionIcons_ConditionAdd(frame, id, cond)
    if cond then
        if cond<5 and cond~=2 then
            HealBot_ActionIcons_AddBuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuff"])
        elseif cond>4 and cond<9 and cond~=6 then
            HealBot_ActionIcons_AddDebuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuff"])
        elseif cond==2 then
            HealBot_ActionIcons_AddBuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffTag"])
        elseif cond==6 then
            HealBot_ActionIcons_AddDebuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffTag"])
        elseif cond==9 then
            HealBot_ActionIcons_AddHealth(frame, id)
        elseif cond==10 then
            HealBot_ActionIcons_AddMana(frame, id)
        elseif cond==11 then
            HealBot_ActionIcons_AddAggro(frame, id)
        elseif cond==12 then
            HealBot_ActionIcons_AddFalling(frame, id)
        elseif cond==13 then
            HealBot_ActionIcons_AddSwimming(frame, id)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ConditionAdd")
end

function HealBot_ActionIcons_ConditionDel(frame, id, cond)
    if cond then
        if cond<5 and cond~=2 then
            HealBot_ActionIcons_DeleteBuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuff"])
        elseif cond>4 and cond<9 and cond~=6 then
            HealBot_ActionIcons_DeleteDebuff(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuff"])
        elseif cond==2 then
            HealBot_ActionIcons_DeleteBuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffTag"])
        elseif cond==6 then
            HealBot_ActionIcons_DeleteDebuffTag(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffTag"])
        elseif cond==9 then
            HealBot_ActionIcons_DelHealth(frame, id)
        elseif cond==10 then
            HealBot_ActionIcons_DelMana(frame, id)
        elseif cond==11 then
            HealBot_ActionIcons_DelAggro(frame, id)
        elseif cond==12 then
            HealBot_ActionIcons_DelFalling(frame, id)
        elseif cond==13 then
            HealBot_ActionIcons_DelSwimming(frame, id)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ConditionDel")
end

function HealBot_ActionIcons_ConditionCheck(frame, id)
    if actionIcons[frame][id].filter~=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["HighlightFilter"] or 1) then
        actionIcons[frame][id].filter=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["HighlightFilter"] or 1)
        if actionIcons[frame][id].filter==2 then
            HealBot_ActionIcons_ConditionAdd(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertFilter"])
        else
            HealBot_ActionIcons_ConditionDel(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertFilter"])
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ConditionCheck")
end

function HealBot_ActionIcons_AddHealth(frame, id)
    if actionIcons[frame][id].guid then
        if not hbHealthGUID[actionIcons[frame][id].guid] then hbHealthGUID[actionIcons[frame][id].guid]={} end
        hbHealthGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=true
        HealBot_ActionWatchHealth(actionIcons[frame][id].guid, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddHealth")
end

function HealBot_ActionIcons_UpdateHealth(guid, health)
    for uid,_ in pairs(hbHealthGUID[guid]) do
        actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].health=health
        HealBot_ActionIcons_CheckHighlightIconAbility(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateHealth")
end

function HealBot_ActionIcons_DelHealth(frame, id)
    if actionIcons[frame][id].guid then
        HealBot_ActionWatchHealth(actionIcons[frame][id].guid, false)
        if hbHealthGUID[actionIcons[frame][id].guid] then hbHealthGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=nil end
    end
      --HealBot_setCall("HealBot_ActionIcons_DelHealth")
end

function HealBot_ActionIcons_AddMana(frame, id)
    if actionIcons[frame][id].guid then
        if not hbManaGUID[actionIcons[frame][id].guid] then hbManaGUID[actionIcons[frame][id].guid]={} end
        hbManaGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=true
        HealBot_ActionWatchMana(actionIcons[frame][id].guid, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddMana")
end

function HealBot_ActionIcons_UpdateMana(guid, mana)
    for uid,_ in pairs(hbManaGUID[guid]) do
        actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].mana=mana
        HealBot_ActionIcons_CheckHighlightIconAbility(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateMana")
end

function HealBot_ActionIcons_DelMana(frame, id)
    if actionIcons[frame][id].guid then
        HealBot_ActionWatchMana(actionIcons[frame][id].guid, false)
        if hbManaGUID[actionIcons[frame][id].guid] then hbManaGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=nil end
    end
      --HealBot_setCall("HealBot_ActionIcons_DelMana")
end

function HealBot_ActionIcons_AddAggro(frame, id)
    if actionIcons[frame][id].guid then
        if not hbAggroGUID[actionIcons[frame][id].guid] then hbAggroGUID[actionIcons[frame][id].guid]={} end
        hbAggroGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=true
        HealBot_Aggro_ActionWatch(actionIcons[frame][id].guid, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddAggro")
end

function HealBot_ActionIcons_UpdateAggro(guid, aggro)
    for uid,_ in pairs(hbAggroGUID[guid]) do
        actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].aggro=aggro
        HealBot_ActionIcons_CheckHighlightIconAbility(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateAggro")
end

function HealBot_ActionIcons_DelAggro(frame, id)
    if actionIcons[frame][id].guid then
        HealBot_Aggro_ActionWatch(actionIcons[frame][id].guid, false)
        if hbAggroGUID[actionIcons[frame][id].guid] then hbAggroGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=nil end
    end
      --HealBot_setCall("HealBot_ActionIcons_DelAggro")
end

function HealBot_ActionIcons_AddFalling(frame, id)
    if actionIcons[frame][id].guid then
        if not hbFallGUID[actionIcons[frame][id].guid] then hbFallGUID[actionIcons[frame][id].guid]={} end
        hbFallGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=true
        HealBot_ActionWatchFalling(actionIcons[frame][id].guid, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddFalling")
end

function HealBot_ActionIcons_UpdateFalling(guid, falling)
    for uid,_ in pairs(hbFallGUID[guid]) do
        actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].falling=falling
        HealBot_ActionIcons_CheckHighlightIconAbility(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateFalling")
end

function HealBot_ActionIcons_DelFalling(frame, id)
    if actionIcons[frame][id].guid then
        HealBot_ActionWatchFalling(actionIcons[frame][id].guid, false)
        if hbFallGUID[actionIcons[frame][id].guid] then hbFallGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=nil end
    end
      --HealBot_setCall("HealBot_ActionIcons_DelFalling")
end

function HealBot_ActionIcons_AddSwimming(frame, id)
    if actionIcons[frame][id].guid then
        if not hbSwimGUID[actionIcons[frame][id].guid] then hbSwimGUID[actionIcons[frame][id].guid]={} end
        hbSwimGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=true
        HealBot_ActionWatchSwimming(actionIcons[frame][id].guid, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddSwimming")
end

function HealBot_ActionIcons_UpdateSwimming(guid, swimming)
    for uid,_ in pairs(hbSwimGUID[guid]) do
        actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].swimming=swimming
        HealBot_ActionIcons_CheckHighlightIconAbility(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateSwimming")
end

function HealBot_ActionIcons_DelSwimming(frame, id)
    if actionIcons[frame][id].guid then
        HealBot_ActionWatchSwimming(actionIcons[frame][id].guid, false)
        if hbSwimGUID[actionIcons[frame][id].guid] then hbSwimGUID[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=nil end
    end
      --HealBot_setCall("HealBot_ActionIcons_DelSwimming")
end

function HealBot_ActionIcons_AddBuff(frame, id, buff)
    if actionIcons[frame][id].guid and buff then
        actionIcons[frame][id].buff=buff
        if not hbBuffGUID[actionIcons[frame][id].guid] then hbBuffGUID[actionIcons[frame][id].guid]={} end
        if not hbBuffGUID[actionIcons[frame][id].guid][buff] then hbBuffGUID[actionIcons[frame][id].guid][buff]={} end
        hbBuffGUID[actionIcons[frame][id].guid][buff][actionIcons[frame][id].uid]=true
        HealBot_Aura_BuffWatch(actionIcons[frame][id].guid, buff, true, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddBuff")
end

function HealBot_ActionIcons_AddBuffTag(frame, id, tag)
    if actionIcons[frame][id].guid and tag then
        if not hbBuffGUID[actionIcons[frame][id].guid] then hbBuffGUID[actionIcons[frame][id].guid]={} end
        if not hbBuffGUID[actionIcons[frame][id].guid][tag] then hbBuffGUID[actionIcons[frame][id].guid][tag]={} end
        hbBuffGUID[actionIcons[frame][id].guid][tag][actionIcons[frame][id].uid]=true
        HealBot_Aura_BuffTagWatch(actionIcons[frame][id].guid, tag, true, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddBuffTag")
end

function HealBot_ActionIcons_DeleteBuff(frame, id, buff)
    if actionIcons[frame][id].guid and buff then
        if hbBuffGUID[actionIcons[frame][id].guid] and hbBuffGUID[actionIcons[frame][id].guid][buff] then
            hbBuffGUID[actionIcons[frame][id].guid][buff][actionIcons[frame][id].uid]=nil
            if not hbBuffGUID[actionIcons[frame][id].guid][buff] then
                HealBot_Aura_BuffWatch(actionIcons[frame][id].guid, buff, false, true)
            end
        end
    end
    actionIcons[frame][id].buff=false
      --HealBot_setCall("HealBot_ActionIcons_DeleteBuff")
end

function HealBot_ActionIcons_DeleteBuffTag(frame, id, tag)
    if actionIcons[frame][id].guid and tag then
        if hbBuffTags[actionIcons[frame][id].guid] and hbBuffTags[actionIcons[frame][id].guid][tag] then
            hbBuffTags[actionIcons[frame][id].guid][tag][actionIcons[frame][id].uid]=nil
        end
        HealBot_Aura_BuffTagWatch(actionIcons[frame][id].guid, tag, false, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_DeleteBuffTag")
end

function HealBot_ActionIcons_UpdatedAura(frame, id, count, casterIsPlayer)
    actionIcons[frame][id].auraIsSelf=casterIsPlayer
    actionIcons[frame][id].auraStacks=count
    HealBot_ActionIcons_CheckHighlightIconAbility(frame, id)
      --HealBot_setCall("HealBot_ActionIcons_UpdatedAura")
end

function HealBot_ActionIcons_BuffUpdate(guid, buff, count, active, casterIsPlayer)
    if hbBuffGUID[guid] and hbBuffGUID[guid][buff] then
        for uid,_ in pairs(hbBuffGUID[guid][buff]) do
            HealBot_ActionIcons_UpdatedAura(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"], count, casterIsPlayer)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_BuffUpdate")
end

function HealBot_ActionIcons_BuffTagUpdate(guid, tag, count, active, casterIsPlayer)
    if hbBuffGUID[guid] and hbBuffGUID[guid][tag] then
        for uid,_ in pairs(hbBuffGUID[guid][tag]) do
            HealBot_ActionIcons_UpdatedAura(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"], count, casterIsPlayer)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_BuffTagUpdate")
end

function HealBot_ActionIcons_AddDebuff(frame, id, debuff)
    if actionIcons[frame][id].guid and debuff then
        actionIcons[frame][id].debuff=debuff
        if not hbDebuffGUID[actionIcons[frame][id].guid] then hbDebuffGUID[actionIcons[frame][id].guid]={} end
        if not hbDebuffGUID[actionIcons[frame][id].guid][debuff] then hbDebuffGUID[actionIcons[frame][id].guid][debuff]={} end
        hbDebuffGUID[actionIcons[frame][id].guid][debuff][actionIcons[frame][id].uid]=true
        HealBot_Aura_DebuffWatch(actionIcons[frame][id].guid, debuff, true, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddDebuff")
end

function HealBot_ActionIcons_AddDebuffTag(frame, id, tag)
    if actionIcons[frame][id].guid and tag then
        if not hbDebuffTags[actionIcons[frame][id].guid] then hbDebuffTags[actionIcons[frame][id].guid]={} end
        if not hbDebuffTags[actionIcons[frame][id].guid][tag] then hbDebuffTags[actionIcons[frame][id].guid][tag]={} end
        hbDebuffTags[actionIcons[frame][id].guid][tag][actionIcons[frame][id].uid]=true
        HealBot_Aura_DebuffTagWatch(actionIcons[frame][id].guid, tag, true, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_AddDebuffTag")
end

function HealBot_ActionIcons_DeleteDebuff(frame, id, debuff)
    if actionIcons[frame][id].guid and debuff then
        if hbDebuffGUID[actionIcons[frame][id].guid] and hbDebuffGUID[actionIcons[frame][id].guid][debuff] then
            hbDebuffGUID[actionIcons[frame][id].guid][debuff][actionIcons[frame][id].uid]=nil
            if not hbDebuffGUID[actionIcons[frame][id].guid][debuff] then
                HealBot_Aura_DebuffWatch(actionIcons[frame][id].guid, debuff, false, true)
            end
        end
    end
    actionIcons[frame][id].debuff=false
      --HealBot_setCall("HealBot_ActionIcons_DeleteDebuff")
end

function HealBot_ActionIcons_DeleteDebuffTag(frame, id, tag)
    if actionIcons[frame][id].guid and tag then
        if hbDebuffTags[actionIcons[frame][id].guid] and hbDebuffTags[actionIcons[frame][id].guid][tag] then
            hbDebuffTags[actionIcons[frame][id].guid][tag][actionIcons[frame][id].uid]=nil
        end
        HealBot_Aura_BuffTagWatch(actionIcons[frame][id].guid, tag, false, true)
    end
      --HealBot_setCall("HealBot_ActionIcons_DeleteDebuffTag")
end

function HealBot_ActionIcons_DebuffUpdate(guid, debuff, count, active, casterIsPlayer)
    if hbDebuffGUID[guid] and hbDebuffGUID[guid][debuff] then
        for uid,_ in pairs(hbDebuffGUID[guid][debuff]) do
            HealBot_ActionIcons_UpdatedAura(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"], count, casterIsPlayer)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_DebuffUpdate")
end

function HealBot_ActionIcons_DebuffTagUpdate(guid, tag, count, active, casterIsPlayer)
    if hbDebuffTags[guid] and hbDebuffTags[guid][tag] then
        for uid,_ in pairs(hbDebuffTags[guid][tag]) do
            HealBot_ActionIcons_UpdatedAura(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"], count, casterIsPlayer)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_DebuffTagUpdate")
end

function HealBot_ActionIcons_DeleteTarget(frame, id)
    actionIcons[frame][id].name=HEALBOT_WORDS_UNSET
      --HealBot_setCall("HealBot_ActionIcons_DeleteTarget")
end

function HealBot_ActionIcons_ReturnTarget(frame, id)
      --HealBot_setCall("HealBot_ActionIcons_ReturnTarget")
    return actionIcons[frame][id].name
end

function HealBot_ActionIcons_UpdateTarget(frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "UpdateTarget "..(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Target"] or ""))
    if Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Target"]==HEALBOT_OPTIONS_SELFHEALS then
        HealBot_ActionIcons_SetTarget(frame, id, "player", UnitName("player") or "player")
    elseif Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Target"]==HEALBOT_OPTIONS_SINGLETANK then
        if UnitExists(HealBot_ActionIcons_luVars["TankUnit"]) then
            --HealBot_ActionIcons_Debug(frame, id, "UpdateTarget Tank found as unit "..HealBot_ActionIcons_luVars["TankUnit"].."  name "..(UnitName(HealBot_ActionIcons_luVars["TankUnit"])))
            HealBot_ActionIcons_SetTarget(frame, id, HealBot_ActionIcons_luVars["TankUnit"], UnitName(HealBot_ActionIcons_luVars["TankUnit"]))
        else
            --HealBot_ActionIcons_Debug(frame, id, "UpdateTarget Tank NOT found as unit "..HealBot_ActionIcons_luVars["TankUnit"])
            HealBot_ActionIcons_SetTarget(frame, id)
        end
    elseif HealBot_Panel_RaidUnitName(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Target"]) then
        HealBot_ActionIcons_SetTarget(frame, id, HealBot_Panel_RaidUnitName(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Target"]), Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Target"])
    elseif actionIcons[frame][id].guid then
        HealBot_ActionIcons_SetTarget(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateTarget")
end

hbGUIDChecks={}
function HealBot_ActionIcons_UnitChecks()
    if #activeFramesIdx>0 then
        if HealBot_Data["UILOCK"] then
            HealBot_Timers_Set("OOC","ActionIconsUnitChecks")
        else
            if hbGUIDChecks[1] then
                HealBot_ActionIcons_luVars["delGUID"]=true
                for x=1,#activeFramesIdx do
                    for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][activeFramesIdx[x]]["NUMICONS"] do
                        if actionIcons[activeFramesIdx[x]][y].guid and actionIcons[activeFramesIdx[x]][y].guid==hbGUIDChecks[1] then
                            HealBot_ActionIcons_luVars["delGUID"]=false
                            break
                        end
                    end
                end
                if HealBot_ActionIcons_luVars["delGUID"] then
                    HealBot_ActionIconsInRange(hbGUIDChecks[1], false)
                end
                table.remove(hbGUIDChecks,1)
            end
            if #hbGUIDChecks>0 then
                C_Timer.After(1, HealBot_ActionIcons_UnitChecks)
            else
                HealBot_ActionIcons_luVars["CheckGUIDS"]=false
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_UnitChecks")
end

function HealBot_ActionIcons_CheckGUID(guid)
    table.insert(hbGUIDChecks,guid)
    if not HealBot_ActionIcons_luVars["CheckGUIDS"] then
        HealBot_ActionIcons_luVars["CheckGUIDS"]=true
        C_Timer.After(1, HealBot_ActionIcons_UnitChecks)
    end
      --HealBot_setCall("HealBot_ActionIcons_CheckGUID")
end

function HealBot_ActionIcons_PlayerDied(guid)
   -- for uid,_ in pairs(hbIconKey[guid]) do
   --     if actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].highlight then
   --         HealBot_ActionIcons_FadeIcon(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
   --     end
   -- end
end

function HealBot_ActionIcons_SetTarget(frame, id, target, name)
    if not target or not name then
        --HealBot_ActionIcons_Debug(frame, id, "SetTarget NULL t="..(target or "nil").." n="..(name or "nil"))
        if actionIcons[frame][id].guid then HealBot_ActionIcons_CheckGUID(actionIcons[frame][id].guid) end
        actionIcons[frame][id].name=nil
        actionIcons[frame][id]:SetAttribute("unit", "noone")
        actionIcons[frame][id].target=false
        if actionIcons[frame][id].filter==2 then
            HealBot_ActionIcons_ConditionDel(frame, id, Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertFilter"])
            actionIcons[frame][id].filter=1
        end
        --if actionIcons[frame][id].guid and hbIconKey[actionIcons[frame][id].guid][actionIcons[frame][id].uid] then
        --    hbIconKey[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=nil
        --end
        actionIcons[frame][id].guid=false
        actionIcons[frame][id].isSelf=false
        HealBot_ActionIcons_CheckHighlightIconAbility(frame, id)
    elseif name~=(actionIcons[frame][id].name or "") or target~=(actionIcons[frame][id].target or "") then
        --HealBot_ActionIcons_Debug(frame, id, "SetTarget t="..target.." n="..name)
        actionIcons[frame][id].name=name
        actionIcons[frame][id]:SetAttribute("unit", target)
        actionIcons[frame][id].target=target
        actionIcons[frame][id].guid=UnitGUID(target)
        actionIcons[frame][id].isSelf=UnitIsUnit(target, "player")
        --if not hbIconKey[actionIcons[frame][id].guid] then hbIconKey[actionIcons[frame][id].guid]={} end
        --hbIconKey[actionIcons[frame][id].guid][actionIcons[frame][id].uid]=true
        HealBot_ActionIcons_ConditionCheck(frame, id)
        HealBot_ActionIconsInRange(actionIcons[frame][id].guid, true)
        HealBot_ActionIcons_CheckHighlightIconAbility(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_SetTarget")
end

function HealBot_ActionIcons_UpdateActiveFrameIdx()
    for x,_ in pairs(activeFramesIdx) do
        activeFramesIdx[x]=nil
    end
    for x=1,10 do
        if activeFrames[x] and Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][x]["NUMICONS"]>0 then
            table.insert(activeFramesIdx, x)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateActiveFrameIdx")
end

function HealBot_ActionIcons_UpdateActiveFrame(frame, active)
    if activeFrames[frame]~=active then
        activeFrames[frame]=active
        HealBot_ActionIcons_UpdateActiveFrameIdx()
        C_Timer.After(frame/40, function() HealBot_ActionIcons_ValidateTarget(frame) end)
        if active then
            C_Timer.After(frame/40, function() HealBot_ActionIcons_ValidateAbilityFrame(frame) end)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateActiveFrame")
end

function HealBot_ActionIcons_ValidateAbility(frame, id, itemsOnly)
    if not HealBot_Data["UILOCK"] and HealBot_ActionIcons_luVars["Loaded"] then
        local hbAbility, icon, aType, aID="", nil, 0
        if Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Ability"] then
            hbAbility, icon, aType, aID=HealBot_ActionIcons_GetSpell(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Ability"])
        end
        actionIcons[frame][id].valid=true
        actionIcons[frame][id].icon=icon
        actionIcons[frame][id].info=Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Ability"]
        actionIcons[frame][id].infoID=aID
        actionIcons[frame][id].infoType=aType
        hbItem[actionIcons[frame][id].uid]=false
        if not actionIconFrame[frame][id].FontSet then
            HealBot_ActionIcons_setFont(frame, id)
        end
        if hbSelfAbilityRev[actionIcons[frame][id].uid] and hbSelfAbility[hbSelfAbilityRev[actionIcons[frame][id].uid]] then
            hbSelfAbility[hbSelfAbilityRev[actionIcons[frame][id].uid]][actionIcons[frame][id].uid]=nil
            hbSelfAbilityRev[actionIcons[frame][id].uid]=false
        end
        if HealBot_Spell_Names[hbAbility] or HealBot_Init_knownClassicHealSpell(hbAbility) then
            actionIcons[frame][id]:SetAttribute("type1", "spell")
            actionIcons[frame][id]:SetAttribute("spell1", hbAbility)
            HealBot_ActionIcons_SelfCountText(frame, id)
        elseif hbAbility and GetMacroIndexByName(hbAbility)>0 then           
            local mId=GetMacroIndexByName(hbAbility)
            local _,_,mText=GetMacroInfo(mId)
            if actionIcons[frame][id].target then
                if string.find(mText,"hbtargetpet") then
                    local pet=HealBot_UnitPet(actionIcons[frame][id].target)
                    if pet and UnitExists(pet) then
                        mText=string.gsub(mText,"hbtargetpet",pet)
                    end
                end
                mText=string.gsub(mText,"hbtarget",actionIcons[frame][id].target)
                mText=string.gsub(mText,"hbtargettarget",actionIcons[frame][id].target.."target")
                mText=string.gsub(mText,"hbtargettargettarget",actionIcons[frame][id].target.."targettarget")
            end
            actionIcons[frame][id]:SetAttribute("type1","macro")
            actionIcons[frame][id]:SetAttribute("macrotext1", mText)
            actionIconFrame[frame][id].countText:SetText("")
        elseif HealBot_IsKnownItem(hbAbility) then
            actionIcons[frame][id]:SetAttribute("type1", "item")
            actionIcons[frame][id]:SetAttribute("item1", hbAbility)
            HealBot_ActionIcons_SelfCountText(frame, id)
            hbItem[actionIcons[frame][id].uid]=true
        else
            actionIcons[frame][id]:SetAttribute("type1", nil)
            actionIcons[frame][id].valid=false
            actionIcons[frame][id].infoType=""
            actionIconFrame[frame][id].countText:SetText("")
            hbItem[actionIcons[frame][id].uid]=true
        end
        if icon then
            actionIcons[frame][id]:SetNormalTexture(icon)
            actionIcons[frame][id].isIcon=true
        else
            actionIcons[frame][id]:SetNormalTexture([[Interface\Addons\HealBot\Images\icon_outline]])
            actionIcons[frame][id].isIcon=false
            HealBot_ActionIcons_CheckHighlightIconAbility(frame, id)
            HealBot_ActionIcons_HighlightIcon(frame, id)
        end
        if actionIcons[frame][id].valid then
            if not hbSelfAbility[hbAbility] then hbSelfAbility[hbAbility]={} end
            hbSelfAbility[hbAbility][actionIcons[frame][id].uid]=true
            hbSelfAbilityRev[actionIcons[frame][id].uid]=hbAbility
            HealBot_ActionIcons_SelfAbilityCD(hbAbility, frame, id)
            HealBot_ActionIcons_CheckHighlightIcon(hbAbility, frame, id)
        else
            HealBot_ActionIcons_FadeIcon(frame, id)
        end
    elseif itemsOnly then
        HealBot_Timers_Set("OOC","ActionIconsValidateItems",0.1)
    else
        HealBot_Timers_Set("OOC","ActionIconsValidateAbility",0.1)
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateAbility")
end

local itemsQueue={}
function HealBot_ActionIcons_ValidateItemsQueue()
    if itemsQueue[1] then
        HealBot_ActionIcons_ValidateAbility(hbIconUID[itemsQueue[1]]["Frame"], hbIconUID[itemsQueue[1]]["ID"], true)
        table.remove(itemsQueue,1)
        C_Timer.After(0.01, HealBot_ActionIcons_ValidateItemsQueue)
    else
        HealBot_ActionIcons_luVars["ValidateAbilityItems"]=false
    end
end

function HealBot_ActionIcons_ValidateItems()
    if not HealBot_ActionIcons_luVars["ValidateAbilityItems"] then
        HealBot_ActionIcons_luVars["ValidateAbilityItems"]=true
        for uid,_ in pairs(hbItem) do
            table.insert(itemsQueue, uid)
        end
        HealBot_ActionIcons_ValidateItemsQueue()
    else
        HealBot_Timers_Set("OOC","ActionIconsValidateItems",0.1)
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateItems")
end

function HealBot_ActionIcons_ValidateAbilityFrameId(frame, id)
    if id<=Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] then
        HealBot_ActionIcons_ValidateAbility(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateAbilityFrameId")
end

function HealBot_ActionIcons_ValidateAbilityFrame(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            HealBot_ActionIcons_ValidateAbility(frame, y)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateAbilityFrame")
end

function HealBot_ActionIcons_ValidateAbilityAll()
    if #activeFramesIdx>0 then
        if not HealBot_ActionIcons_luVars["ValidateAbility"] then
            HealBot_ActionIcons_luVars["ValidateAbility"]=true
            for x=1,#activeFramesIdx do
                C_Timer.After(x/40, function() HealBot_ActionIcons_ValidateAbilityFrame(activeFramesIdx[x]) end)
            end
            C_Timer.After(0.25, function() HealBot_ActionIcons_setLuVars("ValidateAbility", false) end)
        else
            HealBot_Timers_Set("OOC","ActionIconsValidateAbility",0.25)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateAbilityAll")
end

function HealBot_ActionIcons_ValidateTargets(frame, num, caller)
    if not HealBot_Data["UILOCK"] and HealBot_ActionIcons_luVars["Loaded"] then
        for y=1,num do
            --HealBot_ActionIcons_Debug(frame, y, "ValidateTargets  caller="..(caller or "nil"))
            if activeFrames[frame] then
                if actionIcons[frame][y].visible and y<=Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] then
                    if Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][y][frame]["Target"] then
                        HealBot_ActionIcons_UpdateTarget(frame, y)
                    else
                        if actionIcons[frame][y].name then
                            HealBot_ActionIcons_SetTarget(frame, y)
                        end
                        actionIcons[frame][y].guid="unset"
                        actionIcons[frame][y]:SetAttribute("unit", nil)
                        if not actionIcons[frame][y].highlight then
                            HealBot_ActionIcons_CheckHighlightIconAbility(frame, y)
                        end
                    end
                elseif actionIcons[frame][y].name then
                    HealBot_ActionIcons_SetTarget(frame, y)
                end
            elseif actionIcons[frame][y].name then
                HealBot_ActionIcons_SetTarget(frame, y)
            end
        end
    elseif num==HealBot_ActionIcons_luVars["MaxIcons"] then
        HealBot_Timers_Set("OOC","ActionIconsValidateTargetIcons",1)
    else
        HealBot_Timers_Set("OOC","ActionIconsValidateTarget",1)
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateTargets")
end

function HealBot_ActionIcons_ValidateTarget(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        HealBot_ActionIcons_ValidateTargets(frame, Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"], "ValidateTarget")
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateTarget")
end

function HealBot_ActionIcons_ValidateTargetAll()
    if #activeFramesIdx>0 then
        if not HealBot_ActionIcons_luVars["ValidateTarget"] then
            HealBot_ActionIcons_luVars["ValidateTarget"]=true
            for x=1,#activeFramesIdx do
                C_Timer.After(x/40, function() HealBot_ActionIcons_ValidateTarget(activeFramesIdx[x]) end)
            end
            C_Timer.After(0.25, function() HealBot_ActionIcons_setLuVars("ValidateTarget", false) end)
        else
            HealBot_Timers_Set("OOC","ActionIconsValidateTarget",0.25)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateTargetAll")
end

function HealBot_ActionIcons_ValidateTargetAllIcons(frame)
    HealBot_ActionIcons_ValidateTargets(frame, HealBot_ActionIcons_luVars["MaxIcons"], "ValidateTargetAllIcons")
      --HealBot_setCall("HealBot_ActionIcons_ValidateTargetAllIcons")
end

function HealBot_ActionIcons_ValidateTargetAllIconFrames()
    if #activeFramesIdx>0 then
        if not HealBot_ActionIcons_luVars["ValidateTarget"] then
            HealBot_ActionIcons_luVars["ValidateTarget"]=true
            for x=1,#activeFramesIdx do
                C_Timer.After(x/40, function() HealBot_ActionIcons_ValidateTargets(activeFramesIdx[x], HealBot_ActionIcons_luVars["MaxIcons"], "ValidateTargetAllIconFrames") end)
            end
            C_Timer.After(0.25, function() HealBot_ActionIcons_setLuVars("ValidateTarget", false) end)
        else
            HealBot_Timers_Set("OOC","ActionIconsValidateTargetIcons",0.25)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_ValidateTargetAllIconFrames")
end

function HealBot_ActionIcons_CheckStateChange()
    if #activeFramesIdx>0 then
        for x=1,#activeFramesIdx do
            for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][activeFramesIdx[x]]["NUMICONS"] do
                if actionIcons[activeFramesIdx[x]][y].valid and (Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][y][activeFramesIdx[x]]["HighlightFilter"] or 1)==2 then
                    HealBot_ActionIcons_CheckHighlightIconAbility(activeFramesIdx[x], y)
                end
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_CheckStateChange")
end

function HealBot_ActionIcons_CheckAlertChangeFrameId(frame, id)
    if id<=Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] then
        HealBot_ActionIcons_CheckHighlightIconAbility(frame, id)
    end
    HealBot_Timers_Set("OOC","SaveActionIconsProfile",1)
      --HealBot_setCall("HealBot_ActionIcons_CheckAlertChangeFrameId")
end

function HealBot_ActionIcons_CombatState(state)
    HealBot_ActionIcons_luVars["inCombat"]=state
    HealBot_Timers_Set("SKINS","ActionIconsStateChange")
      --HealBot_setCall("HealBot_ActionIcons_CombatState")
end

function HealBot_ActionIcons_SoloState(IsSolo)
    if IsSolo then
        HealBot_ActionIcons_luVars["inGroup"]=false
    else
        HealBot_ActionIcons_luVars["inGroup"]=true
    end
    HealBot_Timers_Set("SKINS","ActionIconsStateChange")
      --HealBot_setCall("HealBot_ActionIcons_SoloState")
end

function HealBot_ActionIcons_InstanceState(inInst)
    HealBot_ActionIcons_luVars["inInst"]=inInst
    HealBot_Timers_Set("SKINS","ActionIconsStateChange")
      --HealBot_setCall("HealBot_ActionIcons_InstanceState")
end

function HealBot_ActionIcons_AlertBuffExists(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].buff and HealBot_Aura_CurrentBuff(actionIcons[frame][id].guid, actionIcons[frame][id].buff) and
       (actionIcons[frame][id].auraIsSelf or not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffSelf"]) and
       actionIcons[frame][id].auraStacks>=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffMinStacks"] or 1) and
       actionIcons[frame][id].auraStacks<=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffMaxStacks"] or 99) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertBuffExists")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertBuffExists")
end

function HealBot_ActionIcons_AlertBuffTagExists(frame, id)
    if actionIcons[frame][id].guid and HealBot_Aura_ActionIconBuffTag(actionIcons[frame][id].guid, (Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffTag"] or "")) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertBuffTagExists")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertBuffTagExists")
end

function HealBot_ActionIcons_AlertBuffExistsOrNot(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].buff then
        if not HealBot_Aura_CurrentBuff(actionIcons[frame][id].guid, actionIcons[frame][id].buff) or
          (HealBot_Aura_CurrentBuff(actionIcons[frame][id].guid, actionIcons[frame][id].buff) and 
          (actionIcons[frame][id].auraIsSelf or not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffSelf"]) and
          actionIcons[frame][id].auraStacks>=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffMinStacks"] or 1) and
          actionIcons[frame][id].auraStacks<=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertBuffMaxStacks"] or 99)) then
            HealBot_ActionIcons_HighlightIcon(frame, id, "AlertBuffExistsOrNot")
        else
            HealBot_ActionIcons_FadeIcon(frame, id)
        end
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertBuffExistsOrNot")
end

function HealBot_ActionIcons_AlertBuffNotExists(frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "AlertBuffNotExists buff="..(actionIcons[frame][id].buff or ""))
    if actionIcons[frame][id].guid and actionIcons[frame][id].buff and not HealBot_Aura_CurrentBuff(actionIcons[frame][id].guid, actionIcons[frame][id].buff) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertBuffNotExists")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertBuffNotExists")
end

function HealBot_ActionIcons_AlertDebuffExists(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].debuff and HealBot_Aura_CurrentDebuff(actionIcons[frame][id].guid, actionIcons[frame][id].debuff) and
       (actionIcons[frame][id].auraIsSelf or not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffSelf"]) and
       actionIcons[frame][id].auraStacks>=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffMinStacks"] or 1) and
       actionIcons[frame][id].auraStacks<=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffMaxStacks"] or 99) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertDebuffExists")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertDebuffExists")
end

function HealBot_ActionIcons_AlertDebuffTagExists(frame, id)
    if actionIcons[frame][id].guid and HealBot_Aura_ActionIconDebuffTag(actionIcons[frame][id].guid, (Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffTag"] or "")) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertDebuffTagExists")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertDebuffTagExists")
end

function HealBot_ActionIcons_AlertDebuffExistsOrNot(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].debuff then
        if not HealBot_Aura_CurrentDebuff(actionIcons[frame][id].guid, actionIcons[frame][id].debuff) or
          (HealBot_Aura_CurrentDebuff(actionIcons[frame][id].guid, actionIcons[frame][id].debuff) and 
          (actionIcons[frame][id].auraIsSelf or not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffSelf"]) and
          actionIcons[frame][id].auraStacks>=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffMinStacks"] or 1) and
          actionIcons[frame][id].auraStacks<=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertDebuffMaxStacks"] or 99)) then
            HealBot_ActionIcons_HighlightIcon(frame, id, "AlertDebuffExistsOrNot")
        else
            HealBot_ActionIcons_FadeIcon(frame, id)
        end
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertDebuffExistsOrNot")
end

function HealBot_ActionIcons_AlertDebuffNotExists(frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "AlertDebuffNotExists debuff="..(actionIcons[frame][id].debuff or ""))
    if actionIcons[frame][id].guid and actionIcons[frame][id].debuff and not HealBot_Aura_CurrentDebuff(actionIcons[frame][id].guid, actionIcons[frame][id].debuff) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertDebuffNotExists")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertDebuffNotExists")
end

function HealBot_ActionIcons_AlertLowHealth(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].health<=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertHealth"] or 50) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertLowHealth")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertLowHealth")
end

function HealBot_ActionIcons_AlertLowMana(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].mana<=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertMana"] or 50) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertLowMana")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertLowMana")
end

function HealBot_ActionIcons_AlertAggroLevel(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].aggro>=(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertAggro"] or 2) then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertAggroLevel")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertAggroLevel")
end

function HealBot_ActionIcons_AlertIsFalling(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].falling then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertIsFalling")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertIsFalling")
end

function HealBot_ActionIcons_AlertIsSwimming(frame, id)
    if actionIcons[frame][id].guid and actionIcons[frame][id].swimming then
        HealBot_ActionIcons_HighlightIcon(frame, id, "AlertIsSwimming")
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_AlertIsSwimming")
end

local HealBot_ActionIcons_AlertFuncs={[1]=HealBot_ActionIcons_AlertBuffExists,
                                      [2]=HealBot_ActionIcons_AlertBuffTagExists,
                                      [3]=HealBot_ActionIcons_AlertBuffExistsOrNot,
                                      [4]=HealBot_ActionIcons_AlertBuffNotExists,
                                      [5]=HealBot_ActionIcons_AlertDebuffExists,
                                      [6]=HealBot_ActionIcons_AlertDebuffTagExists,
                                      [7]=HealBot_ActionIcons_AlertDebuffExistsOrNot,
                                      [8]=HealBot_ActionIcons_AlertDebuffNotExists,
                                      [9]=HealBot_ActionIcons_AlertLowHealth,
                                     [10]=HealBot_ActionIcons_AlertLowMana,
                                     [11]=HealBot_ActionIcons_AlertAggroLevel,
                                     [12]=HealBot_ActionIcons_AlertIsFalling,
                                     [13]=HealBot_ActionIcons_AlertIsSwimming,
                                     }
function HealBot_ActionIcons_CheckAlertFuncs(frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "CheckAlertFuncs Filter="..(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertFilter"] or 1))
    HealBot_ActionIcons_AlertFuncs[(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertFilter"] or 1)](frame, id)
end

function HealBot_ActionIcons_CheckAlertState(frame, id)
    if (not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["inGroup"] or HealBot_ActionIcons_luVars["inGroup"]) and
       (not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["inInst"] or HealBot_ActionIcons_luVars["inInst"]) and
       (not Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["inCombat"] or HealBot_ActionIcons_luVars["inCombat"]) then
            HealBot_ActionIcons_CheckAlertFuncs(frame, id)
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_CheckAlertState")
end

function HealBot_ActionIcons_IsInRange(frame, id)
    if actionIcons[frame][id].target then
        _, xButton, pButton = HealBot_UnitID(actionIcons[frame][id].target)
        if (xButton and xButton.status.range>0) or (pButton and pButton.status.range>0) then
            return true
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_IsInRange")
    return false
end

function HealBot_ActionIcons_UpdateRange(guid, inRange)
    if #activeFramesIdx>0 then
        for x=1,#activeFramesIdx do
            for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][activeFramesIdx[x]]["NUMICONS"] do
                if actionIcons[activeFramesIdx[x]][y].guid and actionIcons[activeFramesIdx[x]][y].guid==guid then
                    if inRange or actionIcons[activeFramesIdx[x]][y].highlight then
                        HealBot_ActionIcons_CheckHighlightIconAbility(activeFramesIdx[x], y)
                    end
                end
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_UpdateRange")
end

function HealBot_ActionIcons_Debug(frame, id, msg)
    HealBot_AddDebug(" -"..id.."- "..msg,"aIcons_f"..frame.." i"..id, true)
end

function HealBot_ActionIcons_CheckHighlightIcon(spellName, frame, id)
    --HealBot_ActionIcons_Debug(frame, id, "CheckHighlightIcon sName="..spellName.." CD="..(hbCDRunning[spellName] or "nil"))
    if actionIcons[frame][id].valid and not hbOnCD[spellName] and (actionIcons[frame][id].isSelf or actionIcons[frame][id].guid=="unset" or HealBot_ActionIcons_IsInRange(frame, id)) and 
       (actionIcons[frame][id].infoType~="item" or IsUsableItem(actionIcons[frame][id].infoID)) then
        if (Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["HighlightFilter"] or 1)==1 then
            HealBot_ActionIcons_HighlightIcon(frame, id, "CheckHighlightIcon")
        else
            HealBot_ActionIcons_CheckAlertState(frame, id)
        end
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_CheckHighlightIcon")
end


function HealBot_ActionIcons_CheckHighlightIconAbility(frame, id)
    if Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Ability"] then
        HealBot_ActionIcons_CheckHighlightIcon(HealBot_ActionIcons_GetSpell(Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["Ability"]), frame, id)
    else
        HealBot_ActionIcons_FadeIcon(frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_CheckHighlightIconAbility")
end

function HealBot_ActionIcons_HighlightIcon(frame, id, caller)
    actionIcons[frame][id]:SetAlpha(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["HIGHLIGHT"])
    if not actionIcons[frame][id].highlight then
        --HealBot_ActionIcons_Debug(frame, id, "HighlightIcon")
        actionIcons[frame][id].highlight=true
        if actionIcons[frame][id].count>0 then
            HealBot_ActionIcons_setCountFont(frame, id)
        end
        if actionIcons[frame][id].isIcon and actionIcons[frame][id].glowEnd==0 and (Healbot_Config_Skins.ActionIconsData[Healbot_Config_Skins.Current_Skin][id][frame]["AlertGlowStyle"] or 1)>1 then
            HealBot_ActionIcons_EnableIconGlow(frame, id)
        elseif actionIcons[frame][id].glowStyle>1 then
            HealBot_ActionIcons_DisableIconGlow(frame, id)
        end
    end
    --HealBot_AddDebug("HighlightIcon caller="..(caller or "nil"),"Icons",true)
      --HealBot_setCall("HealBot_ActionIcons_HighlightIcon")
end

function HealBot_ActionIcons_FadeIcon(frame, id)
    if actionIcons[frame][id].isIcon then
        actionIcons[frame][id]:SetAlpha(Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["FADE"])
        actionIcons[frame][id].highlight=false
        if actionIcons[frame][id].count>0 then
            HealBot_ActionIcons_setCountFont(frame, id)
        end
    end
    if actionIcons[frame][id].glowStyle>1 then
        HealBot_ActionIcons_DisableIconGlow(frame, id)
    end
    actionIcons[frame][id].glowEnd=0
      --HealBot_setCall("HealBot_ActionIcons_FadeIcon")
end

function HealBot_ActionIcons_SetAlpha(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            if actionIcons[frame][y].highlight then
                HealBot_ActionIcons_HighlightIcon(frame, y, "SetAlpha")
            else
                HealBot_ActionIcons_FadeIcon(frame, y)
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SetAlpha")
end

local sbStartTime, sbDuration, sbCDTime=0,0,0
function HealBot_ActionIcons_SelfAbilityCD(spellName, frame, id)
    if actionIcons[frame][id].infoType=="spell" then
        sbStartTime, sbDuration=GetSpellCooldown(spellName)
    elseif actionIcons[frame][id].infoType=="item" and HEALBOT_GAME_VERSION>9 then
        sbStartTime, sbDuration=GetItemCooldown(spellName)
    else
        sbStartTime, sbDuration=0,0
    end
    sbCDTime=(((sbStartTime or 0)+(sbDuration or 0))-HealBot_TimeNow)-0.25
    if sbCDTime>0 then 
        HealBot_ActionIcons_SelfTimerStart(spellName, actionIcons[frame][id].uid, sbCDTime, HealBot_TimeNow+sbCDTime)
    elseif hbOnCD[spellName] then
        hbOnCD[spellName]=nil
        hbCDRunning[spellName]=0
        HealBot_ActionIcons_CheckHighlightIcon(spellName, frame, id)
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfAbilityCD")
end

function HealBot_ActionIcons_SelfCDTextUpdate(frame)
    for spellName,_ in pairs(hbOnCD) do
        for uid,_ in pairs(hbSelfAbility[spellName]) do
            if hbIconUID[uid]["Frame"]==frame then
                HealBot_ActionIcons_SelfAbilityCD(spellName, frame, hbIconUID[uid]["ID"])
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCDTextUpdate")
end

function HealBot_ActionIcons_SelfCountText(frame, id)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["HIDECOUNTTEXT"] then
        actionIcons[frame][id].count=0
    elseif actionIcons[frame][id].infoType=="spell" then
        actionIcons[frame][id].count=GetSpellCharges(actionIcons[frame][id].infoID) or GetSpellCount(actionIcons[frame][id].infoID) or 0
    elseif actionIcons[frame][id].infoType=="item" then
        actionIcons[frame][id].count=GetItemCount(actionIcons[frame][id].infoID) or 0
    else
        actionIcons[frame][id].count=0
    end
    if actionIcons[frame][id].count>0 then
        actionIconFrame[frame][id].countText:SetText(actionIcons[frame][id].count)
    else
        actionIconFrame[frame][id].countText:SetText("")
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCountText")
end

function HealBot_ActionIcons_SelfCountTextUpdate(frame)
    if Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"]>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            HealBot_ActionIcons_SelfCountText(frame, y)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCountTextUpdate")
end

function HealBot_ActionIcons_SelfCountTextUpdateExisting(frame)
    if (Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] or 0)>0 then
        for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["NUMICONS"] do
            if actionIcons[frame][y].count>0 then
                HealBot_ActionIcons_SelfCountText(frame, y)
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCountTextUpdateExisting")
end

function HealBot_ActionIcons_SelfCountTextUpdateAll()
    if #activeFramesIdx>0 then
        if not HealBot_ActionIcons_luVars["SelfCountTextUpdate"] then
            HealBot_ActionIcons_luVars["SelfCountTextUpdate"]=true
            x=1,#activeFramesIdx do
                C_Timer.After(x/40, function() HealBot_ActionIcons_SelfCountTextUpdateExisting(activeFramesIdx[x]) end)
            end
            C_Timer.After(0.25, function() HealBot_ActionIcons_setLuVars("SelfCountTextUpdate", false) end)
        else
            HealBot_Timers_Set("SKINS","SelfCountTextUpdate",0.25)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCountTextUpdateAll")
end

local cdLeft=0
function HealBot_ActionIcons_SelfCDText(spellName, frame, id, cdEnd)
    if (hbCDRunning[spellName] or 0)>HealBot_TimeNow and hbSelfAbility[spellName] and hbSelfAbility[spellName][actionIcons[frame][id].uid] and 
       not Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][frame]["HIDETEXT"] then
        cdLeft=ceil(hbCDRunning[spellName]-HealBot_TimeNow)
        if cdLeft<91 then
            cdLeft=cdLeft
        else
            cdLeft=ceil(cdLeft/60)
            if cdLeft<91 then
                cdLeft=cdLeft.."m"
            else
                cdLeft=ceil(cdLeft/60)
                cdLeft=cdLeft.."h"
            end
        end
        actionIconFrame[frame][id].cdText:SetText(cdLeft)
        C_Timer.After(0.999, function() HealBot_ActionIcons_SelfCDText(spellName, frame, id, cdEnd) end)
    else
        actionIconFrame[frame][id].cdText:SetText("")
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCDText")
end

function HealBot_ActionIcons_SelfCDTimerEnd(spellName, frame, id, cdEnd)
    if hbCDRunning[spellName]==cdEnd then
        --hbCDRunning[spellName]=0
        hbOnCD[spellName]=nil
        --HealBot_ActionIcons_Debug(frame, id, "SelfCDTimerEnd cdEnd="..cdEnd)
        if not actionIcons[frame][id].highlight then
            HealBot_ActionIcons_CheckHighlightIcon(spellName, frame, id)
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCDTimerEnd")
end

function HealBot_ActionIcons_SelfTimerStart(spellName, uid, cdTime, cdEnd)
    if actionIcons[hbIconUID[uid]["Frame"]][hbIconUID[uid]["ID"]].highlight then 
        HealBot_ActionIcons_FadeIcon(hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"]) 
    end
    hbCDRunning[spellName]=cdEnd
    hbOnCD[spellName]=true
    HealBot_ActionIcons_SelfCDText(spellName, hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"], cdEnd)
    C_Timer.After(cdTime+0.1, function() HealBot_ActionIcons_SelfCDTimerEnd(spellName, hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"], cdEnd) end)
      --HealBot_setCall("HealBot_ActionIcons_SelfTimerStart")
end

function HealBot_ActionIcons_SelfCD(spellName, cdTime, cdEnd)
    if hbSelfAbility[spellName] then
        cdEnd=floor(cdEnd)
        if cdEnd~=(hbCDRunning[spellName] or -1) then
            for uid,_ in pairs(hbSelfAbility[spellName]) do
                if activeFrames[hbIconUID[uid]["Frame"]] then
                    HealBot_ActionIcons_SelfTimerStart(spellName, uid, cdTime, cdEnd)
                end
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_SelfCD")
end

local gcd=0
function HealBot_ActionIcons_UpdateAllCDs()
    if #activeFramesIdx>0 then
        sbStartTime, sbDuration=GetSpellCooldown(61304)
        gcd = sbDuration or 0
        if gcd>0 then
            for x=1,#activeFramesIdx do
                for y=1,Healbot_Config_Skins.ActionIcons[Healbot_Config_Skins.Current_Skin][activeFramesIdx[x]]["NUMICONS"] do
                    if actionIcons[activeFramesIdx[x]][y].highlight then
                        HealBot_ActionIcons_FadeIcon(activeFramesIdx[x], y)
                        C_Timer.After(gcd, function() HealBot_ActionIcons_CheckHighlightIconAbility(activeFramesIdx[x], y) end)
                    end
                end
                HealBot_ActionIcons_SelfCDTextUpdate(x)
            end
        end
        for spellName,_ in pairs(hbOnCD) do
            for uid,_ in pairs(hbSelfAbility[spellName]) do
                HealBot_ActionIcons_SelfAbilityCD(spellName, hbIconUID[uid]["Frame"], hbIconUID[uid]["ID"])
            end
        end
    end
end

local hbLocalItems={["Healthstone"]=19009,}
function HealBot_ActionIcons_SetSpell(sText)
    if sText then
        if HealBot_Text_Len(sText)>0 then
            local _, _, _, _, _, _, spellId = GetSpellInfo(sText)
            if spellId then 
                sText = "S:"..spellId
            else
                local itemID = GetItemInfoInstant(sText)
                if itemID then 
                    sText = "I:"..itemID
                elseif hbLocalItems[sText] then
                    sText = "I:"..hbLocalItems[sText]
                end
            end
        else
            sText=nil
        end
    end
    if sText then HealBot_ActionIcons_ClearCache(sText) end
      --HealBot_setCall("HealBot_ActionIcons_SetSpell")
    return sText
end

local vSpellText,vSpellIcon,vSpellType,vSpellID,cSpellText=nil,nil,nil,nil,nil
local HealBot_ActionIcons_SpellCache={["name"]={},["icon"]={},["type"]={},["id"]={}}
function HealBot_ActionIcons_ClearCache(spellCode)
    HealBot_ActionIcons_SpellCache["name"][spellCode]=nil
    HealBot_ActionIcons_SpellCache["icon"][spellCode]=nil
    HealBot_ActionIcons_SpellCache["type"][spellCode]=nil
    HealBot_ActionIcons_SpellCache["id"][spellCode]=nil
      --HealBot_setCall("HealBot_ActionIcons_ClearCache")
end

function HealBot_ActionIcons_GetSpell(spellCode)
    vSpellText=HealBot_ActionIcons_SpellCache["name"][spellCode]
    if not vSpellText then
        if spellCode and HealBot_Text_Len(spellCode)>2 then
            local sType,sID = string.split(":", spellCode)
            if sType and sID then
                if sType == "I" then
                    vSpellText=GetItemInfo(sID)
                    vSpellType="item"
                    vSpellID=sID
                    _, _, _, _, vSpellIcon, _, _ = GetItemInfoInstant(sID) 
                elseif sType == "S" then
                    cSpellText=GetSpellInfo(sID)
                    vSpellID=sID
                    vSpellType="spell"
                    vSpellIcon=GetSpellTexture(sID)
                    if HEALBOT_GAME_VERSION<3 and cSpellText then
                        local rank = GetSpellSubtext(sID)
                        if rank then
                            local knownHealSpells=HealBot_Init_retFoundHealSpells()
                            if knownHealSpells[cSpellText] then
                                cSpellText=cSpellText.."("..rank..")"
                            end
                        end
                    end
                    vSpellText=cSpellText or vSpellText
                end
            elseif GetMacroIndexByName(spellCode)>0 then
                vSpellText=spellCode
                vSpellType="macro"
                vSpellID=GetMacroIndexByName(spellCode)
                _, vSpellIcon=GetMacroInfo(spellCode)
            end
            if vSpellText then 
                HealBot_ActionIcons_SpellCache["name"][spellCode]=vSpellText
                HealBot_ActionIcons_SpellCache["icon"][spellCode]=vSpellIcon
                HealBot_ActionIcons_SpellCache["type"][spellCode]=vSpellType
                HealBot_ActionIcons_SpellCache["id"][spellCode]=vSpellID
            end
        end
    end
      --HealBot_setCall("HealBot_ActionIcons_GetSpell")
    return HealBot_ActionIcons_SpellCache["name"][spellCode],
           HealBot_ActionIcons_SpellCache["icon"][spellCode],
           HealBot_ActionIcons_SpellCache["type"][spellCode],
           HealBot_ActionIcons_SpellCache["id"][spellCode]
end

function HealBot_ActionIcons_ClearGUID(guid)
    hbBuffGUID[guid]=nil
    HealBot_Aura_BuffWatch(guid, nil, nil, true)
    hbDebuffGUID[guid]=nil
    HealBot_Aura_DebuffWatch(guid, nil, nil, true)
      --HealBot_setCall("HealBot_ActionIcons_ClearGUID")
end