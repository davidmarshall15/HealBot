HealBot_Supplied_Textures={
     [1]= {name="HealBot 01", file=[[Interface\Addons\HealBot\Images\bar1.tga]]},
     [2]= {name="Waves", file=[[Interface\Addons\HealBot\Images\bar2.tga]]},
     [3]= {name="HealBot 03", file=[[Interface\Addons\HealBot\Images\bar3.tga]]},
     [4]= {name="Aluminium", file=[[Interface\Addons\HealBot\Images\Aluminium.tga]]},
     [5]= {name="HealBot 05", file=[[Interface\Addons\HealBot\Images\bar5.tga]]},
     [6]= {name="BantoBar", file=[[Interface\Addons\HealBot\Images\bar6.tga]]},
     [7]= {name="Otravi", file=[[Interface\Addons\HealBot\Images\bar7.tga]]},
     [8]= {name="Smooth", file=[[Interface\Addons\HealBot\Images\bar8.tga]]},
     [9]= {name="Charcoal", file=[[Interface\Addons\HealBot\Images\bar9.tga]]},
    [10]= {name="HealBot 10", file=[[Interface\Addons\HealBot\Images\bar10.tga]]},
    [11]= {name="Diagonal", file=[[Interface\Addons\HealBot\Images\bar11.tga]]},
    [12]= {name="Skewed", file=[[Interface\Addons\HealBot\Images\bar12.tga]]},
    [13]= {name="Marble", file=[[Interface\Addons\HealBot\Images\bar13.tga]]},
    [14]= {name="HealBot 14", file=[[Interface\Addons\HealBot\Images\bar14.tga]]},
    [15]= {name="Healbot", file=[[Interface\Addons\HealBot\Images\Bar15.tga]]},
    [16]= {name="Tukui", file=[[Interface\Addons\HealBot\Images\normTex.tga]]},----Tukui-----
    [17]= {name="Tukui2", file=[[Interface\Addons\HealBot\Images\DsmV1.tga]]},-----Tukui-----
    [18]= {name="Tukui4", file=[[Interface\Addons\HealBot\Images\tukuibar.tga]]},----TUKUI----
    [19]= {name="Flat", file=[[Interface\Addons\HealBot\Images\Flat.tga]]},
    [20]= {name="Smooth v2", file=[[Interface\Addons\HealBot\Images\Smoothv2.tga]]},
    [21]= {name="Outline", file=[[Interface\Addons\HealBot\Images\Outline.tga]]},
    [22]= {name="Armory", file=[[Interface\Addons\HealBot\Images\Armory.tga]]},
    [23]= {name="Button", file=[[Interface\Addons\HealBot\Images\Button.tga]]},
    [24]= {name="Fourths", file=[[Interface\Addons\HealBot\Images\Fourths.tga]]},
    [25]= {name="Fifths", file=[[Interface\Addons\HealBot\Images\Fifths.tga]]},
    [26]= {name="Glass", file=[[Interface\Addons\HealBot\Images\Glass.tga]]},
    [27]= {name="Gloss", file=[[Interface\Addons\HealBot\Images\Gloss.tga]]},
    [28]= {name="Graphite", file=[[Interface\Addons\HealBot\Images\Graphite.tga]]},
    [29]= {name="Minimalist", file=[[Interface\Addons\HealBot\Images\Minimalist.tga]]},
    [30]= {name="Ruben", file=[[Interface\Addons\HealBot\Images\Ruben.tga]]},
};
function HealBot_Data_Default_TextureIndex()
    return 20
end
function HealBot_Data_Default_Texture()
    --return HealBot_Supplied_Textures[HealBot_Data_Default_TextureIndex()].file
    return 'Interface\\Addons\\HealBot\\Images\\Smoothv2.tga'
end
function HealBot_Data_Default_TextureName()
    --return HealBot_Supplied_Textures[HealBot_Data_Default_TextureIndex()].name
    return "Smooth v2"
end

HealBot_Supplied_Sounds={
    [1]= {name="Tribal Bass Drum", file=566027},
    [2]= {name="Thorns", file=569022},
    [3]= {name="Elf Bell Toll", file=566558},
};
function HealBot_Data_Default_SoundIndex()
    return 3
end
function HealBot_Data_Default_Sound()
    return HealBot_Supplied_Sounds[HealBot_Data_Default_SoundIndex()].file
end
function HealBot_Data_Default_SoundName()
    return HealBot_Supplied_Sounds[HealBot_Data_Default_SoundIndex()].name
end

HealBot_Supplied_Fonts={
    [1]= {name="Aovel Sans Black", file=[[Interface\AddOns\HealBot\Fonts\ASansBlack.ttf]]},
    [2]= {name="Ace Futurism", file=[[Interface\AddOns\HealBot\Fonts\ace_futurism.ttf]]},
    [3]= {name="Oregon LDO Black", file=[[Interface\AddOns\HealBot\Fonts\Oregon_LDO_Black.ttf]]},
    [4]= {name="Oregon LDO Bold", file=[[Interface\AddOns\HealBot\Fonts\Oregon_LDO_Bold.ttf]]},
    [5]= {name="Playball", file=[[Interface\AddOns\HealBot\Fonts\Playball.ttf]]},
    [6]= {name="Special Elite", file=[[Interface\AddOns\HealBot\Fonts\SpecialElite.ttf]]},
    [7]= {name="SpicyRice", file=[[Interface\AddOns\HealBot\Fonts\SpicyRice_Regular.ttf]]},
    [8]= {name="Star Jedi", file=[[Interface\AddOns\HealBot\Fonts\Star_Jedi_Rounded.ttf]]},
    [9]= {name="Swansea", file=[[Interface\AddOns\HealBot\Fonts\SWANSE__.ttf]]},
    [10]= {name="Swansea Bold", file=[[Interface\AddOns\HealBot\Fonts\SWANSE_B.ttf]]},
    [11]= {name="Cognosis", file=[[Interface\AddOns\HealBot\Fonts\Cognosis.ttf]]},
    [12]= {name="Myriad", file=[[Interface\AddOns\HealBot\Fonts\Myriad.ttf]]},
    [13]= {name="NotoSans Bold", file=[[Interface\AddOns\HealBot\Fonts\NotoSans-Bold.ttf]]},
    [14]= {name="Roboto Bold", file=[[Interface\AddOns\HealBot\Fonts\Roboto-Bold.ttf]]},
    [15]= {name="Roboto Medium", file=[[Interface\AddOns\HealBot\Fonts\Roboto-Medium.ttf]]},
    [16]= {name="Bazooka", file=[[Interface\AddOns\HealBot\Fonts\Bazooka.ttf]]},
    [17]= {name="DorisPP", file=[[Interface\AddOns\HealBot\Fonts\DorisPP.ttf]]},
    [18]= {name="Augustus", file=[[Interface\AddOns\HealBot\Fonts\AUGUSTUS.ttf]]},
    [19]= {name="Caesar", file=[[Interface\AddOns\HealBot\Fonts\CAESAR.ttf]]},
    [20]= {name="Diogenes", file=[[Interface\AddOns\HealBot\Fonts\DIOGENES.ttf]]},
    [21]= {name="Capitalis Type Oasis", file=[[Interface\AddOns\HealBot\Fonts\CapitalisTypOasis.ttf]]},
    [22]= {name="Mystic Orbs", file=[[Interface\AddOns\HealBot\Fonts\MystikOrbs.ttf]]},
    [23]= {name="X360", file=[[Interface\AddOns\HealBot\Fonts\X360.ttf]]},
    [24]= {name="Impact", file=[[Interface\AddOns\HealBot\Fonts\Impact.ttf]]},
    [25]= {name="Olde English", file=[[Interface\AddOns\HealBot\Fonts\OldeEnglish.ttf]]},
};
function HealBot_Data_Default_FontIndex()
    return 15
end
function HealBot_Data_Default_Font()
    return HealBot_Supplied_Fonts[HealBot_Data_Default_FontIndex()].file
end
function HealBot_Data_Default_FontName()
    return HealBot_Supplied_Fonts[HealBot_Data_Default_FontIndex()].name
end

HealBot_ConfigDefaults={
  MyFriend="x",
  CurrentSpec=9,
  Spec="",
  CurrentLoadout=0,
  LastLoadout=0,
  Skin_ID=-1,
  MacroUse10=false,
  DisableHealBot=false,
  DisableSolo=false,
  DisabledNow=0,
  LastAutoSkinChangeType="-",
  LastAutoSkinChangeTime=0,
  ClassicAbsorbsFilter=0,
  KnownLoadouts={},
  SkinDefault={[HEALBOT_SKINS_STD]         ={[HEALBOT_WORD_SOLO]=false, 
                                                 [HEALBOT_WORD_PARTY]=false, 
                                                 [HEALBOT_OPTIONS_RAID10]=false, 
                                                 [HEALBOT_OPTIONS_RAID25]=false, 
                                                 [HEALBOT_OPTIONS_RAID40]=false,
                                                 [HEALBOT_WORD_ARENA]=false, 
                                                 [HEALBOT_WORD_BG10]=false, 
                                                 [HEALBOT_WORD_BG15]=false, 
                                                 [HEALBOT_WORD_BG40]=false, 
                                                 [HEALBOT_WORD_PETBATTLE]=false}, 
                 [HEALBOT_OPTIONS_GROUPHEALS]={[HEALBOT_WORD_SOLO]=false, 
                                                 [HEALBOT_WORD_PARTY]=false, 
                                                 [HEALBOT_OPTIONS_RAID10]=false, 
                                                 [HEALBOT_OPTIONS_RAID25]=false, 
                                                 [HEALBOT_OPTIONS_RAID40]=false,
                                                 [HEALBOT_WORD_ARENA]=false, 
                                                 [HEALBOT_WORD_BG10]=false, 
                                                 [HEALBOT_WORD_BG15]=false, 
                                                 [HEALBOT_WORD_BG40]=false, 
                                                 [HEALBOT_WORD_PETBATTLE]=false}, 
                 [HEALBOT_OPTIONS_RAID25]    ={[HEALBOT_WORD_SOLO]=false, 
                                                 [HEALBOT_WORD_PARTY]=false, 
                                                 [HEALBOT_OPTIONS_RAID10]=false, 
                                                 [HEALBOT_OPTIONS_RAID25]=false, 
                                                 [HEALBOT_OPTIONS_RAID40]=false,
                                                 [HEALBOT_WORD_ARENA]=false, 
                                                 [HEALBOT_WORD_BG10]=false, 
                                                 [HEALBOT_WORD_BG15]=false, 
                                                 [HEALBOT_WORD_BG40]=false, 
                                                 [HEALBOT_WORD_PETBATTLE]=false}, 
                 [HEALBOT_OPTIONS_RAID40]    ={[HEALBOT_WORD_SOLO]=false, 
                                                 [HEALBOT_WORD_PARTY]=false, 
                                                 [HEALBOT_OPTIONS_RAID10]=false, 
                                                 [HEALBOT_OPTIONS_RAID25]=false, 
                                                 [HEALBOT_OPTIONS_RAID40]=false,
                                                 [HEALBOT_WORD_ARENA]=false, 
                                                 [HEALBOT_WORD_BG10]=false, 
                                                 [HEALBOT_WORD_BG15]=false, 
                                                 [HEALBOT_WORD_BG40]=false, 
                                                 [HEALBOT_WORD_PETBATTLE]=false},
                },
  SkinZoneEnabled={},
  SkinSpecEnabled={},
  EnableHealthy=true,
  Profile=1,
  SpecProfAtSave=0,
  };


local hbSkinDefault=false
function HealBot_SkinDefault_GetData(skin, id)
    if HealBot_Config.SkinDefault[skin] then
        return HealBot_Config.SkinDefault[skin][id] or hbSkinDefault
    end
    return false
end

function HealBot_SkinDefault_SetData(value, skin, id)
    if hbSkinDefault == value then
        HealBot_SkinDefault_NilData(skin, id)
    else
        HealBot_Config.SkinDefault[skin][id]=value
    end
end

function HealBot_SkinDefault_NilData(skin, id)
    HealBot_Config.SkinDefault[skin][id]=nil
end


HealBot_Config_SpellsDefaults={
  EnabledKeyCombo={["New"]=true},
  EnabledSpellTarget={},
  EnabledSpellTrinket1={},
  EnabledSpellTrinket2={},
  EnabledAvoidBlueCursor={},
  EnemyKeyCombo={},
  EnemySpellTarget={},
  EnemySpellTrinket1={},
  EnemySpellTrinket2={},
  EnemyAvoidBlueCursor={},
  EmergKeyCombo={},
  EmergSpellTarget={},
  EmergSpellTrinket1={},
  EmergSpellTrinket2={},
  EmergAvoidBlueCursor={},
  SpellTargetLastTarget={},
  ButtonCastMethod=2,
  Binds={[1]=1,[2]=1,[3]=1,[4]=1,[5]=1,[6]=1,[7]=1,[8]=1,[9]=1,[10]=1,[11]=1,[12]=1,[13]=1,[14]=1,[15]=1,[16]=1,[17]=1,[18]=1,[19]=1,[20]=1,},
};

HealBot_Config_BuffsDefaults={
  BuffWatch=true,
  BuffWatchInCombat=false,
  BuffCustomWatchInCombat=true,
  PalaBlessingsAsOne=false,
  ShortBuffTimer=10,
  LongBuffTimer=120,
  AutoBuff=1,
  AutoBuffCastBy=1,
  ListSortOrder=1,
  ListSortFilter=1,
  ListSortFilterTag="",
  AutoBuffExpireTime=31,
  BuffWatchWhenGrouped=false,
  BuffWatchWhenMounted=false,
  NoAuraWhenRested=false,
  ExtraBuffsOnlyInInstance=false,
  HealBotBuffText={},
  HealBotBuffDropDown={},
  HealBotBuffColR={},
  HealBotBuffColG={},
  HealBotBuffColB={},
  AlwaysShowSelf=false,
  AlwaysShowClass=false,
  AlwaysShowTimed=false,
  CBshownHB=true,
  EnableBar=true,
  ShowBuffWarning=false,
  SoundBuffWarning=false,
  SoundBuffPlay=HealBot_Data_Default_SoundName(),
  WarnRange_Bar=2,
  WarnRange_Screen=2,
  WarnRange_Sound=3,
  CustomBuffCheck={[1]=false, [2]=false, [3]=false},
  CustomBuffName={[1]="", [2]="", [3]="", [4]=""},
  CustomItemName={[1]="", [2]="", [3]="", [4]=""},
  ManaDrinkThreshold=50,
  ManaDrinkItem="",
  WellFedItem="",
  BackupManaDrinkItem="",
  BackupWellFedItem="",
};

HealBot_Config_CuresDefaults={
  SoundDebuffWarning=false,
  DebuffWatch=true,
  IgnoreFastDurDebuffs=true,
  IgnoreFastDurDebuffsSecs=2,
  IgnoreOnCooldownDebuffs=false,
  IgnoreFriendDebuffs=false,
  IgnoreCannotDispell=false,
  SoundDebuffPlay=HealBot_Data_Default_SoundName(),
  DebuffWatchInCombat=true,
  DebuffWatchWhenGrouped=false,
  DebuffWatchWhenMounted=false,
  ShowDebuffWarning=true,
  AlwaysShowBoss=true,
  AlwaysShowTimed=false,
  ListSortOrder=1,
  ListSortFilter=1,
  ListSortFilterTag="",
  ShowTimeMaxDuration=31,
  CDCshownHB=true,
  EnableBar=true,
  WarnRange_Bar=2,
  WarnRange_Screen=2,
  WarnRange_Sound=3,
  HealBotDebuffText={[1]=HEALBOT_WORDS_NONE, [2]=HEALBOT_WORDS_NONE, [3]=HEALBOT_WORDS_NONE, [4]=HEALBOT_WORDS_NONE, [5]=HEALBOT_WORDS_NONE, },
  HealBotDebuffDropDown={[1]=1, [2]=1, [3]=1, [4]=1, [5]=1, },
  HealBotDebuffPriority={
    [HEALBOT_DISEASE_en]=7,
    [HEALBOT_MAGIC_en]=5,
    [HEALBOT_POISON_en]=8,
    [HEALBOT_CURSE_en]=6,
    [HEALBOT_BLEED_en]=9,
    [HEALBOT_CUSTOM_en]=15,
  },
  CDCBarColour={
    [HEALBOT_DISEASE_en]={ R=0.55, G=0.19, B=0.7, },
    [HEALBOT_MAGIC_en]={ R=0.26, G=0.33, B=0.83, },
    [HEALBOT_POISON_en]={ R=0.12, G=0.46, B=0.24, },
    [HEALBOT_CURSE_en]={ R=0.83, G=0.43, B=0.09, },
    [HEALBOT_BLEED_en]={ R=0.58, G=0.02, B=0.02, },
  },
  HealBot_Custom_Debuffs_All={
    [HEALBOT_DISEASE_en]=false,
    [HEALBOT_MAGIC_en]  =false,
    [HEALBOT_POISON_en] =false,
    [HEALBOT_CURSE_en]  =false,
    [HEALBOT_BLEED_en]  =false,
  },
};
HealBot_Class_En={ 
                [HEALBOT_CLASSES_ALL]="ALL",
                [HEALBOT_DRUID]="DRUI",
                [HEALBOT_HUNTER]="HUNT",
                [HEALBOT_MAGE]="MAGE",
                [HEALBOT_PALADIN]="PALA",
                [HEALBOT_PRIEST]="PRIE",
                [HEALBOT_ROGUE]="ROGU",
                [HEALBOT_SHAMAN]="SHAM",
                [HEALBOT_WARLOCK]="WARL",
                [HEALBOT_WARRIOR]="WARR",
                [HEALBOT_EVOKER]="EVOK",
                [HEALBOT_DEATHKNIGHT]="DEAT",
                [HEALBOT_MONK]="MONK",
                [HEALBOT_DEMONHUNTER]="DEMO",
}

HEALBOT_OPTIONS_SELFHEALS_en=HEALBOT_OPTIONS_SELFHEALS
HEALBOT_OPTIONS_TANKHEALS_en=HEALBOT_OPTIONS_TANKHEALS
HEALBOT_CLASSES_HEALERS_en=HEALBOT_CLASSES_HEALERS
HEALBOT_OPTIONS_GROUPHEALS_en=HEALBOT_OPTIONS_GROUPHEALS
HEALBOT_OPTIONS_MYTARGET_en=HEALBOT_OPTIONS_MYTARGET
HEALBOT_FOCUS_en=HEALBOT_FOCUS
HEALBOT_OPTIONS_EMERGENCYHEALS_en=HEALBOT_OPTIONS_EMERGENCYHEALS
HEALBOT_OPTIONS_PETHEALS_en=HEALBOT_OPTIONS_PETHEALS
HEALBOT_VEHICLE_en=HEALBOT_VEHICLE
HEALBOT_OPTIONS_TARGETHEALS_en=HEALBOT_OPTIONS_TARGETHEALS
HEALBOT_CUSTOM_CASTBY_ENEMY_en=HEALBOT_CUSTOM_CASTBY_ENEMY

HealBot_HealGroupsTrans={ [HEALBOT_OPTIONS_SELFHEALS_en]=HEALBOT_OPTIONS_SELFHEALS,
                            [HEALBOT_OPTIONS_TANKHEALS_en]=HEALBOT_OPTIONS_TANKHEALS,
                            [HEALBOT_CLASSES_HEALERS_en]=HEALBOT_CLASSES_HEALERS,
                            [HEALBOT_OPTIONS_GROUPHEALS_en]=HEALBOT_OPTIONS_GROUPHEALS,
                            [HEALBOT_OPTIONS_MYTARGET_en]=HEALBOT_OPTIONS_MYTARGET,
                            [HEALBOT_FOCUS_en]=HEALBOT_FOCUS,
                            [HEALBOT_OPTIONS_EMERGENCYHEALS_en]=HEALBOT_OPTIONS_EMERGENCYHEALS,
                            [HEALBOT_OPTIONS_PETHEALS_en]=HEALBOT_OPTIONS_PETHEALS,
                            [HEALBOT_VEHICLE_en]=HEALBOT_VEHICLE,
                            [HEALBOT_OPTIONS_TARGETHEALS_en]=HEALBOT_OPTIONS_TARGETHEALS,
                            [HEALBOT_CUSTOM_CASTBY_ENEMY_en]=HEALBOT_CUSTOM_CASTBY_ENEMY,
                            }
HealBot_GlobalsDefaults={}

function HealBot_Data_InitVars()
    HealBot_GlobalsDefaults={
        LastVersionSkinUpdate=HealBot_Global_InitVersion(),
        FirstLoad=true,
        PluginThreat=true,
        PluginTimeToDie=true,
        PluginExtraButtons=true,
        PluginCombatProt=true,
        PluginTimeToLive=true,
        PluginPerformance=true,
        PluginMyCooldowns=true,
        PluginBuffWatch=true,
        PluginTweaks=true,
        PluginRequests=true,
        PluginHealthWatch=true,
        PluginManaWatch=true,
        PluginMedia=true,
        FrameStrata="LOW",
        CompressExport=true,
        VehicleFontSizeReduction=4,
        UseCrashProt=false,
        NoRanks=false,
        ClassicHoTTime=6,
        CPUUsage=5,
        OptionsTheme=1,
        OptionsOpacityAdj=35,
        AbsorbDiv=10,
        InHealDiv=10,
        HealAbsorbsDiv=10,
        DebugOut=false,
        VersionResetDone={["ICONS"]="9.1.0.0",["BUFF"]="9.1.0.0",["CBUFF"]="9.1.0.0",["DEBUFF"]="9.1.0.0",["CDEBUFF"]="9.1.0.0"},
        CureCustomDefaultCastBy=1,
        TopRole="TANK",
        TargetBarRestricted=0,
        ShowTooltip=true,
        Tooltip_ShowTarget=true,
        Tooltip_ShowMyBuffs=false,
        Tooltip_ShowRequiredBuffs=true,
        Tooltip_ShowSpellInfo=true,
        Tooltip_ShowSpellExtra=true,
        Tooltip_ShowSpec=true,
        Tooltip_ShowLevel=true,
        Tooltip_ShowHealth=true,
        Tooltip_ShowMana=true,
        Tooltip_ShowRank=false,
        Tooltip_ShowRole=false,
        Tooltip_HideRoleWhenRank=false,
        Tooltip_MouseWheel=false,
        ShowGameUnitInfo=false,
        Tooltip_ShowHoT=false,
        Tooltip_ShowCD=false,
        Tooltip_ShowBuffIconInfo=false,
        Tooltip_ShowDebuffIconInfo=true,
        Tooltip_MaxButtons=5,
        Tooltip_IgnoreGCD=false,
        Tooltip_Scale=1,
        Tooltip_Alpha=1,
        Tooltip_HeaderFont=HealBot_Supplied_Fonts[14].name,
        Tooltip_HeaderFontSize=14,
        Tooltip_DetailFont=HealBot_Data_Default_FontName(),
        Tooltip_DetailFontSize=12,
        DisableToolTipInCombat=false,
        HideOptions=true,
        ProtectPvP=false,
        RightButtonOptions=false,
        TalentInspect=true,
        HideUnlockedTag=true,
        SmartCast=true,
        SmartCastDebuff=true,
        SmartCastBuff=true,
        SmartCastRes=true,
        HealBot_ButtonRadius=78,
        HealBot_ButtonPosition=300,
        MinimapIcon={hide=false, minimapPos=220, radius=80,},
        TestBars={["PETS"]=4,["TARGETS"]=5,["HEALERS"]=3,["TANKS"]=2,["PROFILE"]=3,["ENEMY"]=2},
        TestBarsIcons={["DEBUFF"]=false,["BUFF"]=false,["EXTRA"]=false},
        EmergencyFClass=4,
        MacroSuppressSound=true,
        MacroSuppressError=true,
        AcceptSkins=1,
        FocusMonitor={},
        OneTimeMsg={},
        dislikeMount={},
        excludeMount={},
        aggro2pct=55,
        aggro3pct=100,
        RaidHideMethod=0,
        useUTF8=false,
        CustomCuresReset="6.0.0",
        LastSupporter=1,
        IncMainAssist=true,
        FPS=60,
        LAG=0.05,
        PresetColoursAlias={[1]=HEALBOT_OPTIONS_PRESET.." 1",[2]=HEALBOT_OPTIONS_PRESET.." 2",
                            [3]=HEALBOT_OPTIONS_PRESET.." 3",[4]=HEALBOT_OPTIONS_PRESET.." 4",
                            [5]=HEALBOT_OPTIONS_PRESET.." 5",[6]=HEALBOT_OPTIONS_PRESET.." 6",
                            [7]=HEALBOT_OPTIONS_PRESET.." 7",[8]=HEALBOT_OPTIONS_PRESET.." 8",
                            [9]=HEALBOT_OPTIONS_PRESET.." 9",[10]=HEALBOT_OPTIONS_PRESET.." 10"},
        PresetColours={[1]={R=0.2, G=0.2, B=0.9, A=1 },
                       [2]={R=0.9, G=0.2, B=0.2, A=1 },
                       [3]={R=0.2, G=0.9, B=0.2, A=1 },
                       [4]={R=0.8, G=0.2, B=0.8, A=1 },
                       [5]={R=0.2, G=0.8, B=0.8, A=1 },
                       [6]={R=0.8, G=0.5, B=0.2, A=1 },
                       [7]={R=0.7, G=0.7, B=0.2, A=1 },
                       [8]={R=0.9, G=0.7, B=0.5, A=1 },
                       [9]={R=1, G=1, B=1, A=1 },
                       [10]={R=0.7, G=0.7, B=0.7, A=1 },},
        OverrideEffects={["USE"]=1,["FOCUSGROUPS"]=1,["FLUIDBARS"]=true,["FLUIDFREQ"]=10,["OFREQ"]=0.07,["OMIN"]=0.1,["OMAX"]=0.95,["HOTBARHLTH"]=0,["GLOW"]=3,["ICONGLOW"]=3,
                         ["HOTBARDEBUFF"]=1,["FGDIMMING"]=2.5,["HEALTHDROP"]=true,["HEALTHDROPPCT"]=400,["HEALTHDROPCANCEL"]=200,["HEALTHDROPTIME"]=3,["HAZARDFREQ"]=0.3,["HAZARDMINALPHA"]=0.25},
        OverrideFocusGroups={[1]=true, [2]=true, [3]=true, [4]=true, [5]=true, [6]=true, [7]=true, [8]=true, },
        OverrideChat={["USE"]=1,["NOTIFY"]=1,["MSG"]=HEALBOT_NOTIFYOTHERMSG,["RESONLY"]=true,["EOCOOM"]=false,["EOCOOMV"]=10},
        OverrideFrames={["USE"]=1,["RUNBLIZZEVENTS"]=false,["HIDEPARTYF"]=false,["HIDEPTF"]=false,["HIDEFOCUSF"]=false,["HIDEBOSSF"]=true,["HIDERAIDF"]=true,},
        OverrideColours={["USECLASS"]=1,["USEROLE"]=1,["USEPOWER"]=1,["USEADAPTIVE"]=1},
        OverrideAdaptive={["Plugin"]=true,["RecentHeals"]=false,["Debuffs"]=true,["Aggro"]=true,["Threat"]=false,["Highlight"]=false,
                          ["Target"]=false,["OOR"]=false,["Buffs"]=true,["Overheals"]=false,["Absorbs"]=false},
        OverrideAdaptiveOrder={[1]="Plugin",[2]="RecentHeals",[3]="Debuffs",[4]="Aggro",[5]="Threat",
                               [6]="Highlight",[7]="Target",[8]="OOR",[9]="Buffs",[10]="Overheals",[11]="Absorbs",},
        OverrideAdaptiveCol={["RecentHeals"]={R=0.1,G=1,B=0.2},["Threat"]={R=1,G=0.49,B=0.04},
                             ["Aggro"]={R=1,G=0,B=0},["Highlight"]={R=0.4,G=1,B=1},
                             ["Target"]={R=1,G=0.9,B=0.2},["OOR"]={R=0,G=0,B=0},
                             ["Overheals"]={R=1,G=0.2,B=0.2},["Absorbs"]={R=1,G=1,B=1}},
        AuxTextPrefs={},
        HealBot_customPermUserName={},
        HealBot_PermMyTargets={},
        HealBot_PermPrivateTanks={},
        HealBot_PermPrivateHealers={},
        HealBot_PermPrivateDamagers={},
        HealBot_MouseWheelIndex={ ["AltUp"]=2, ["AltDown"]=3 },
        HealBot_MouseWheelTxt={ ["AltUp"]=HEALBOT_BLIZZARD_MENU, ["AltDown"]=HEALBOT_HB_MENU },
        HealBot_Emotes={ ["NoneUp"]=HEALBOT_EMOTE_HELLO,  ["NoneDown"]=HEALBOT_EMOTE_HELLO,
                         ["ShiftUp"]=HEALBOT_EMOTE_HELLO, ["ShiftDown"]=HEALBOT_EMOTE_HELLO,
                         ["CtrlUp"]=HEALBOT_EMOTE_HELLO,  ["CtrlDown"]=HEALBOT_EMOTE_HELLO,
                         ["AltUp"]=HEALBOT_EMOTE_HELLO,   ["AltDown"]=HEALBOT_EMOTE_HELLO, },
        HealBot_Macros={ ["NoneUp"]="",  ["NoneDown"]="",
                         ["ShiftUp"]="", ["ShiftDown"]="",
                         ["CtrlUp"]="",  ["CtrlDown"]="",
                         ["AltUp"]="",   ["AltDown"]="", },
        EmergIncRange={
            [HEALBOT_DRUID]   =false,  [HEALBOT_HUNTER]     =true,   [HEALBOT_MAGE]    =true,
            [HEALBOT_PALADIN] =false,  [HEALBOT_PRIEST]     =false,  [HEALBOT_ROGUE]   =false,
            [HEALBOT_SHAMAN]  =false,  [HEALBOT_WARLOCK]    =true,   [HEALBOT_WARRIOR] =false, 
            [HEALBOT_MONK]    =false,  [HEALBOT_DEATHKNIGHT]=false,  [HEALBOT_MONK]    =false, [HEALBOT_DEMONHUNTER]=false,
        },
        EmergIncMelee={
            [HEALBOT_DRUID]   =false,  [HEALBOT_HUNTER]     =false,  [HEALBOT_MAGE]    =false,
            [HEALBOT_PALADIN] =false,  [HEALBOT_PRIEST]     =false,  [HEALBOT_ROGUE]   =true,
            [HEALBOT_SHAMAN]  =false,  [HEALBOT_WARLOCK]    =false,  [HEALBOT_WARRIOR] =true, 
            [HEALBOT_MONK]    =false,  [HEALBOT_DEATHKNIGHT]=true,   [HEALBOT_MONK]    =false, [HEALBOT_DEMONHUNTER]=false,
        },
        EmergIncHealers={
            [HEALBOT_DRUID]   =true,   [HEALBOT_HUNTER]     =false,  [HEALBOT_MAGE]    =false,
            [HEALBOT_PALADIN] =false,  [HEALBOT_PRIEST]     =true,   [HEALBOT_ROGUE]   =false,
            [HEALBOT_SHAMAN]  =false,  [HEALBOT_WARLOCK]    =false,  [HEALBOT_WARRIOR] =false, 
            [HEALBOT_MONK]    =true,   [HEALBOT_DEATHKNIGHT]=false,  [HEALBOT_MONK]    =false, [HEALBOT_DEMONHUNTER]=false,
        },
        EmergIncCustom={
            [HEALBOT_DRUID]   =true,   [HEALBOT_HUNTER]     =false,  [HEALBOT_MAGE]    =true,
            [HEALBOT_PALADIN] =true,   [HEALBOT_PRIEST]     =true,   [HEALBOT_ROGUE]   =false,
            [HEALBOT_SHAMAN]  =true,   [HEALBOT_WARLOCK]    =true,   [HEALBOT_WARRIOR] =false, 
            [HEALBOT_MONK]    =true,   [HEALBOT_DEATHKNIGHT]=false,  [HEALBOT_MONK]    =false, [HEALBOT_DEMONHUNTER]=false,
        },
        CDCBarColour={
            [HEALBOT_CUSTOM_en.."15"]={ R=0.45, G=0, B=0.28, },
        },
        HealBot_Custom_Debuffs_ShowBarCol={  
            [HEALBOT_CUSTOM_CAT_CUSTOM_AUTOMATIC]=4,
            ["DEFAULT"]=4,
        },
        HealBot_Custom_Debuffs_IconGlow={  
            [HEALBOT_CUSTOM_CAT_CUSTOM_AUTOMATIC]=1,
            ["DEFAULT"]=1,
        },
        CDCTag={},
        IgnoreCustomDebuff={},
        FilterCustomDebuff={
        },
        CustomDebuffIDMethod={},
        HealBot_Custom_Debuffs={
            -- Defaults
            [HEALBOT_CUSTOM_CAT_CUSTOM_AUTOMATIC]=15,
        },
        HealBot_Custom_Debuffs_IconSet={},
        Custom_Debuff_Categories=HEALBOT_CUSTOM_DEBUFF_CATS,
        CustomBuffTag={},
        IgnoreCustomBuff={},
        HealBot_Custom_Buffs={},
        HealBot_Custom_Buffs_IconSet={},
        CustomBuffBarColour={
            [HEALBOT_CUSTOM_en.."Buff"]={ R=0.25, G=0.58, B=0.8, },
        },
        HealBot_Custom_Buffs_ShowBarCol={["DEFAULT"]=4},
        HealBot_Custom_Buffs_IconGlow={},
        CustomBuffIDMethod={},
        IconKeyCombo={},
        UseIconCommands=false,
        WatchHoT={
           ["DRUI"]={
                [HEALBOT_REJUVENATION]=1,
                [HEALBOT_OVERGROWTH]=1,
                [HEALBOT_CENARION_WARD]=1,
                [HEALBOT_REGROWTH]=1,
                [HEALBOT_LIFEBLOOM]=1,
                [HEALBOT_WILD_GROWTH]=1,
                [HEALBOT_TRANQUILITY]=1,
                [HEALBOT_BARKSKIN]=1,
                [HEALBOT_IRONBARK]=1,
                [HEALBOT_IRONFUR]=1,
                [HEALBOT_SURVIVAL_INSTINCTS]=1,
                [HEALBOT_FRENZIED_REGEN]=1,
                [HEALBOT_NATURE_REJUVENATION_GERMINATION]=1,
                [HEALBOT_NATURE_MOMENT_OF_CLARITY]=1,
                [HEALBOT_SPRING_BLOSSOMS]=1,               
                [HEALBOT_CULTIVATION]=1,
                [HEALBOT_INNERVATE]=1,
                [HEALBOT_ESSENCE_OF_GHANIR]=1,
                [HEALBOT_FOCUSED_GROWTH]=1,
                [HEALBOT_GROVE_TENDING]=1,
            },
            ["HUNT"]={
                [HEALBOT_MENDPET]=1,
                [HEALBOT_DETERRENCE]=1,
            }, 
            ["MAGE"]={
                [HEALBOT_EVOCATION]=1,
                [HEALBOT_ICE_BARRIER]=1,
                [HBC_DAMPEN_MAGIC]=1,
                [HBC_FROST_ARMOR]=1,
                [HBC_ICE_ARMOR]=1,
                [HBC_MOLTEN_ARMOR]=1,
                [HBC_MAGE_ARMOR]=1,
                [HEALBOT_INCANTERS_WARD]=1,
                [HBC_MANA_SHIELD]=1,
                [HEALBOT_ICE_BLOCK]=1,
                [HEALBOT_BLAZING_BARRIER]=1,
                [HEALBOT_PRISMATIC_BARRIER]=1,
                [HEALBOT_ARCANE_POWER]=1,
                [HEALBOT_SLOW_FALL]=1,
            },
            ["PALA"]={
                [HEALBOT_FLASH_OF_LIGHT]=1,
                [HEALBOT_BEACON_OF_LIGHT]=1,
                [HEALBOT_HAND_OF_FREEDOM]=1,
                [HEALBOT_LIGHT_BEACON]=1,
                [HEALBOT_DIVINE_SHIELD]=1,
                [HEALBOT_INFUSION_OF_LIGHT]=1,
                [HEALBOT_SPEED_OF_LIGHT]=1,
                [HEALBOT_DIVINE_PURPOSE]=1,
                [HEALBOT_ARDENT_DEFENDER]=1,
                [HEALBOT_DIVINE_PROTECTION]=1,
                [HBC_DIVINE_INTERVENTION]=1,
                [HEALBOT_BEACON_OF_FAITH]=1,   
                [HBC_DIVINE_FAVOR]=1,
                [HEALBOT_BLESSING_OF_SACRIFICE]=1,
                [HEALBOT_BESTOW_FAITH]=1,
                [HEALBOT_BEACON_OF_VIRTUE]=1,
                [HEALBOT_TYRS_DELIVERANCE]=1,
                [HEALBOT_SACRED_DAWN]=1,   
                [HEALBOT_LIGHTS_GRACE]=1,
                [HEALBOT_GLIMMER_OF_LIGHT]=1,
                [HEALBOT_BLESSING_OF_SANCTUARY]=1,
                [HEALBOT_BLESSING_OF_SPELLWARDING]=1,
            },
            ["PRIE"]={
                [HEALBOT_GUARDIAN_SPIRIT]=1,
                [HEALBOT_PAIN_SUPPRESSION]=1,
                [HEALBOT_POWER_INFUSION]=1,
                [HEALBOT_RENEW]=1,
                [HEALBOT_HOLY_WARD]=1,
                [HEALBOT_DIVINE_HYMN]=1,
                [HEALBOT_POWER_WORD_SHIELD]=1,
                [HEALBOT_SPIRIT_SHELL]=1,
                [HEALBOT_POWER_WORD_BARRIER]=1,
                [HEALBOT_PRAYER_OF_MENDING]=1,
                [HEALBOT_ECHO_OF_LIGHT]=1,                       
                [HEALBOT_BLESSED_HEALING]=1,
                [HEALBOT_SERENDIPITY]=1,
                [HEALBOT_TWIST_OF_FATE]=1,
                [HEALBOT_DISPERSION]=1,
                [HEALBOT_VAMPIRIC_EMBRACE]=1,          
                [HEALBOT_SURGE_OF_DARKNESS]=1,               
                [HEALBOT_SURGE_OF_LIGHT]=1,                                            
                [HEALBOT_CLARITY_OF_WILL]=1,                                      
                [HEALBOT_RAPTURE]=1, --Disc
                [HEALBOT_ATONEMENT]=1,                       
                [HEALBOT_APOTHEOSIS]=1, --Holy    
                [HEALBOT_DIVINITY]=1,                      
                [HEALBOT_SYMBOL_OF_HOPE]=1,                      
                [HEALBOT_BODY_AND_MIND]=1, 
                [HEALBOT_INSPIRATION]=1,
                [HEALBOT_HARMONY]=1,   
                [HEALBOT_SUNDERING_SOUL]=1,
                [HEALBOT_FOCUSED_WILL]=1,        
                [HEALBOT_LIGHT_OF_TUURE]=1, 
                [HEALBOT_BLESSING_OF_TUURE]=1,
                [HEALBOT_POWER_OF_THE_NAARU]=1,
                [HEALBOT_POWER_OF_THE_DARK_SIDE]=1,
                [HEALBOT_ANGELIC_FEATHER]=1,
                [HEALBOT_ALMAIESH_THE_CORD_OF_HOPE]=1,
                [HEALBOT_VESTMANTS_OF_DISCIPLINE]=1,
                [HEALBOT_RAMMALS_ULTERIOR_MOTIVE]=1,
                [HEALBOT_SPIRIT_OF_REDEMPTION]=1,
                [HEALBOT_RAY_OF_HOPE]=1,
                [HEALBOT_PERMEATING_GLOW]=1,
            },
            ["ROGU"]={
                [HEALBOT_VANISH]=1,
                [HEALBOT_EVASION]=1,
                [HEALBOT_FEINT]=1,
                [HEALBOT_CLOAK_OF_SHADOWS]=1,
            },
            ["SHAM"]={
                [HEALBOT_RIPTIDE]=1,
                [HEALBOT_PRIMORDIAL_WAVE]=1,
                [HEALBOT_WELLSPRING]=1,
                [HEALBOT_DOWNPOUR]=1,
                [HEALBOT_TIDAL_WAVES]=1,
                [HEALBOT_ANACESTRAL_GUIDANCE]=1,
                [HEALBOT_ASCENDANCE]=1,
                [HEALBOT_UNLEASH_LIFE]=1,
                [HEALBOT_ASTRAL_SHIFT]=1,
                [HEALBOT_ELEMENTAL_MASTERY]=1,
                [HEALBOT_FLAMETONGUE]=1,
                [HEALBOT_FROSTBRAND]=1,
                [HEALBOT_HEALING_RAIN]=1,
                [HEALBOT_SPIRITWALKERS_GRACE]=1,
                [HEALBOT_CLOUDBURST_TOTEM]=1,
                [HEALBOT_EARTH_SHIELD]=1,
                [HEALBOT_SPIRIT_LINK_TOTEM]=1,
                [HEALBOT_BLOODLUST]=1,
                [HEALBOT_HEROISM]=1,
            },
            ["WARL"]={
                [HEALBOT_UNENDING_RESOLVE]=1,
                [HEALBOT_SOUL_LEECH]=1,
            }, 
            ["WARR"]={
                [HEALBOT_VIGILANCE]=1,
                [HEALBOT_LAST_STAND]=1,
                [HEALBOT_SHIELD_WALL]=1,
                [HEALBOT_SHIELD_BLOCK]=1,
            }, 
            ["DEAT"]={
                [HEALBOT_ICEBOUND_FORTITUDE]=1,
                [HEALBOT_ANTIMAGIC_SHELL]=1,
                [HEALBOT_ARMY_OF_THE_DEAD]=1,
                [HEALBOT_ANTIMAGIC_ZONE]=1,
                [HEALBOT_VAMPIRIC_BLOOD]=1,
                [HEALBOT_DANCING_RUNE_WEAPON]=1,
                [HEALBOT_SHROUD_OF_PURGATORY]=1,
            },
            ["DEMO"]={
                [HEALBOT_DEMON_SPIKES]=1,
                [HEALBOT_BLUR]=1,
                [HEALBOT_METAMORPHOSIS]=1,
            },
            ["MONK"]={
                [HEALBOT_VIGILANCE]=1,
                [HEALBOT_ENVELOPING_MIST]=1,
                [HEALBOT_ZEN_SPHERE]=1,
                [HEALBOT_LIFE_COCOON]=1,
                [HEALBOT_THUNDER_FOCUS_TEA]=1,
                [HEALBOT_ZEN_MEDITATION]=1,
                [HEALBOT_SOOTHING_MIST]=1,
                [HEALBOT_RENEWING_MIST]=1,
                [HEALBOT_ELUSIVE_BREW]=1,
                [HEALBOT_FORTIFYING_BREW]=1,
                [HEALBOT_DAMPEN_HARM]=1,
                [HEALBOT_DIFFUSE_MAGIC]=1,             
                [HEALBOT_EXTEND_LIFE]=1,
                [HEALBOT_TOUCH_OF_KARMA]=1,
                [HEALBOT_ESSENCE_FONT]=1,
            },
            ["EVOK"]={
                [HEALBOT_ECHO]=1,
                [HEALBOT_LIFEBIND]=1,
                [HEALBOT_DREAM_FLIGHT]=1,
                [HEALBOT_OBSIDIAN_SCALES]=1,
                [HEALBOT_TIME_DILATION]=1,
                [HEALBOT_RENEWING_BLAZE]=1,
                [HEALBOT_TIME_STOP]=1,
                [HEALBOT_STASIS]=1,
                [HEALBOT_FURY_OF_THE_ASPECTS]=1,
                [HEALBOT_EXHILARATING_BURST]=1,
                [HEALBOT_ESSENCE_BURST]=1,
                [HEALBOT_TEMPRAL_ANOMALY]=1,
                [HEALBOT_TEMPRAL_COMPRESSION]=1,
                [HEALBOT_NULLIFYING_SHROUD]=1,
                [HEALBOT_CALL_OF_YSERA]=1,
                [HEALBOT_EMERALD_COMMUNION]=1,
                [HEALBOT_DREAM_BREATH]=1,
                [HEALBOT_REVERSION]=1,
            }, 
            ["ALL"]={
                [HEALBOT_GIFT_OF_THE_NAARU]=1,
                [HEALBOT_DARKFLIGHT]=1,
                [HEALBOT_STONEFORM]=1,
                [HEALBOT_SHROUD_OF_THE_NAGLFAR]=1,
                [HEALBOT_SPIRIT_FRAGMENT]=1,
                [HEALBOT_NORGANNONS_FORESIGHT]=1,
                [HEALBOT_VELENS_FUTURE_SIGHT]=1,
                [HEALBOT_SEPHUZS_SECRET]=1,
                [HEALBOT_DELICIOUS_CAKE]=1,
                [HEALBOT_GUIDING_HAND]=1,
                [HEALBOT_FRUITFUL_MACHINATIONS]=1,
                --[HEALBOT_OCEANS_EMBRACE]=1,
                --[HEALBOT_AOF_INFUSION_OF_LIGHT]=1,
                [HEALBOT_CONCORDANCE_OF_THE_LEGIONFALL]=1,
                [HEALBOT_HIGHFATHERS_TIMEKEEPING]=1,
                --[HEALBOT_TAILWIND]=1,
                [HEALBOT_BRACING_CHILL]=1,
                [HEALBOT_BLESSED_PORTENTS]=1,
            },
        },
    };
end

HealBot_Config_SkinsData={  
  [HEALBOT_SKINS_STD]=[[TR1wVjoYs43ZVImzF1te2ab4bEOX2G9zm2SUnzsMvBoIzctcAtGraz0UkI8B)ux6l2maz3O5iLvkpKy7U66RU0vxDxDJ8pMn)i56jZVEYYRps8W6BxS8PV)UHlMVE2Xl(6XftxoD(Kvhf8W3UB2xMSEAVjlxbD4RtUB10J8VDY6Nw)UhdZ8ZYg29eQ1tC4ppVRxnNHYbDpXFYQ1ZMFZX)YQJxm)4Fz(jo5HYS0Kl7EY6LpamKMve3)YUUBoAW05txo5oe0O4GWEzszFdUdsY6jscIhomoDqxxNOSIEI8OKIOU1C6Nmooa(uA6EK4tI8aOVIKrrIU1o1RPdcA)m)XLqfBAKiV4Ysn1tleVt9CIcfGicYZgjhfgg0TrnNcXazHOimvmeGlTqBiiw5I4G(6gYauaj76KpoTxs8N(u45HPfwDK06(5H)AxxLjWkRrtmYElZI4P2P1DgNgxeN6NnSNOOBzLDKFbOQaQO5oipB8ij4Zo3V7jUGR40wN2(eLhe8ZJ73hDOOROW6h6pW6hA6KPKzTwoYIy)pCz)CW83HQwednxhSDXfq370SejFrQFycezuBZrrtNChewGJ1fy0q)84W0aRWdVaDL2Vr7OKLsM0Oq0zY(6cr(GWY(I(7a1ITqvgM0har)9MJcNp9()c1jnqYOSpkYHHAaXYTHCYnXuvAr5UqQm0NWlILudfI0pa(5Y9jbiTfYuVkXfolqdFyA4Wlzl1ydaVilYsQa1h7esnsSc5AuA29P7LfAz8NcX4CdJmEUoPJhsAtBlPrmfasYJusPyPPuQGSX9sc)yCamB9h0lL)DZr9x8Lhwny5Ih(2kCmqX7)0hBosC9KVTE23NIGem9Zp81VUYmhD2n3Eh83AJAKLzDvIBUz5ctxHi013gSCX3m0hD3d3mBUjK72LtNybkF6xMoFnY1kBa3KL3m12LELvLSVpD5Tv6T4ZRwS8ZRSHJAdjB51txsUewdatTK0GVuwj8gzcWtw5Gxmwm2iPoWlGrd)VNIhJMG8Z6aiC)hwTEX9(lUB1ttE3JWOuE3h)mmLUrDNBGhN56SeE0Q9gNaXqXGqf5AnjYnAcKD3WtCzkEmffH8SbJva6sT35mMqCQuaP1UKj2gPrsQbiO8XXkP0GLshMNrIebtOfRDnBs805SnodZGjueTMDaAKAVbJ3ZhWYq1iaZqrkbJRwOBCOPJm3SzZa3U5gNOXqUF2cyATRt0oRfIuyISihwxudhz3aG9hNRmToDO29oJDKDqUgeQOX2xB2YbvdZIQDXkg7qeRd2Y5zkDSbtPjtYZBJdmULO8mkA84wtyCdwwk2))ok7JmWSA22J1ZGqrrfFn8qpGNmovKBzevfcApTgfeomR043PSmboLrIsUK6SZ0fgAhbzQ1euJg5AVHA0WDJDgbewIrL6zmpIjHWDf0dzunX8XESwpGDm5ij78FGfOzlt2PJkWa)NdIa4e58c62Xw3uz6oHLwbioWSkyR2(RsfyaVJQRqAVLtUFQ4Uztw90xFY9Dps5FD9CsPfypbvChrsSaYMsD9y3tirH5oTPX63xcRkGR4J7ijFXNxSEXXdNE9ShUhYSWwPt24IK40qCZwLK61VZ7P6p14PMpvvxo7G6Y5tVD2xUB6pzD5Rp16GsD001R(PlY2huK6SM)KfANdpsJRf(txMU1oOqPT)8ZvOqjdCuTGsbc7aRyCoixCItVfRp2TMb(33GNsGBzmEqubwcHEIf1mV)bif02cWgaF2tTEQ9tDadvflRMs1NLbwRqsM)hGnYd6CgS53CEIUyCrMFsMmeBx4)burArVjinq6dPFXzUjW(O4Dc71MONt8pseeW1LG9a2)ldUGYXOL(5G0lIhbkq3MQoWCJ4Os4qTsUbNy)SucnpL9Uh7uUE2x(J)I6HodsXy)py3Ll(vr2OSyCWlnln00gOq0BLPTPkG7wM4WNANAKe5Qba)ewyKrYCiMC6DF9KnvzX7WSmCYS5hdfM(hR2MX6hMrSVtx(dC14WCr9BBEA(d8OQxLyjFYSR3MJZoSugTC23HIOpoz2Q1BZAlnRNTtw15A3IR2AUATBbI5k3ILoAwAVtwu562IjmTbZvNDYfNSABMSHf12jxC2gyn95F52flvbsx29SwN6vhlWdc8DOA6DD0U1l6wVXPDAdl(o5Ul6((ZQvNE9YUUDAugiVNdiMlpOAwnunmOBb663TZi)Rnj1QKLCN524ma9OKi7kTwRYz10yV35Cxxm9pxBZN2IsEBYoxrkD2DY6bvtuBWC)tZngRc46y13J8Zsmv35peQBmof8YgxG8(flwF7XF3dkAc3MOV9ysGmA4(SvfQRAKDcDQH1ysqJMv8f4iLcCxnJk1(U97Oak4(djLUNaDmz5ctcF8f2ZhfREYpYY51OGU5xWdBWBdyNQp3hOfL7MGJjInMigPTfKRE0XZaVfxW8P4NoVkqe90OfRGWx1IwL4pJ8Z1ksUwuXgS9nTrRP75eP6DS6jSScDWokWyFW4cQndWk44VJuwEKsFIm6VgA93gpuSslusjiwYh32g94WEhKIfMHjHpK5t4JBJqqr2TDIJ1ldYlskWq3yCPtnbbvFHiMobcIk)FLUf7tFP4M6K6JyLviupJ9zefXKcq8jiSekSembSgcRMVxdZolfhVZs7HhhJ(CQgqN4a8V3FcO1Pz5HzP9hNKO7H0mFoAO4c)imXvn8evWsaXducXS4cOWu)iaj13xoIw2H51dyaZXwrYclniCnertVEPHiUFa88qHK1WSqtUfKhHA6pKmhfyC65Hr0jaLiUm0iKSZdZrKzUJQksQwAyjM5)b5haMqFqK1E1IWfjlgaPUXdXd2YKX3acerYCgn6uzEKacgb5KcMC)KBqBYsZpriLkNH5O)yZSFgKGbsQXfyFrrUGvDu)cb0G)Dm6E0PmbvW4h2zc2sJz2Ecz1yb5Xqh4d6PpaSHGlA1YDIO2NQuvpZbqVLZXoeIeTriKeLJhczLhp8ylE8((hG5Tf7uW4bf2tcziKuOLXfqJmw8RtolupG)b4hTlW2yMxCWznMecsPkJdMbQfhoJX6(yZW2XP5OPmTi(lP6l1jABovn)aoVUmxnnpI7EU6rOzHSugDHkPVe)eKc3Xmv6wHpVoRmxLyssPpu5PGUR6nRGejj)HMbHVEvfMCk9)mF9630NIyTCOpJuYq1gnCA2FpU3kOGojbBn4n60)DKbkdwgR1g6Mtuu5h52aOiv3kXgz)6HI0y25hqnlyQ0suOsNtwIGOWde4ADEiCCTnYsIsQhuIyoiOK6EMQaJS5kJpb82Ee(c(YfsjVdwJf3zPXhOTvfhsDhfXkNVWx5mt3kGbSfkWOKloIT8uDeuAGY2vdVK)GJwKAvtW(3uo4KMZGvYvkqF3ZeI)YI5QndN7hMA0bkjwPV7lcS7OgnGknK7)j8w5OZJn3)CtUbyDh7hy6ucw7EyPBaW2d1ncqv)sZHaocIlLgfti7x9symPDY9TmsIXQsCplRIrBjt735(gejuSA3VDYV9BpIMTm0x(7)(j)Ex3MKRGVVHYNXpN93LyPmpkMipHAhPwMIQ4PGaXcSgFRlwdk01QQO1UzJz7HXQ9UQyIYaXus5vU8HzJLHvrrlE7QIwvFBnOKQwszGVmJbBurE7oQeR3fPRYo)RJf5MvH9JZ9TRjhelgMHx6MDjBZ7FO0(CkYJfPdS8jlS7vXpV0TEne2fqx9D7y0J9p5XU7lk(aJhGbK0cASU8egPmySnuMJmk17YDhVDRy7njUXkO9UC25Zwn7ZZUB26)sTf3KW8cy)R1WcyPpY8v3qACqyPRHAZwCVxjixSuzOYXMABaGGydBymEHNmT6qkTEJ6BCLAe2l(0XERkJsfCgBhyXt2gR3ZSdQkJ04nzceP9yG2nWNN6OgHpvjczbSB5lE4pHEu6m8WTTa71KtKAcG5gRK)w1wEiK9SG30CvsJq3e3jOeWOeAxABX9wRjOAT8LfQr4hVKEfLQxu7Mkw0EIENFn(7SWCyiJm7Xxihj8dP1AOTNo0KbrGzpOLFicu2r8PPddPIdR7mIOuZzi989aML6cHURZi9ldz0gPEWxjmOfmusLmhgXqk101qpIjSPSfTBto8(PlVrFIgq(qETz1kZMnyslI7rvf7yt)7dvxhd554thgYVHABdUC(ooX8Jm1(m49It13ddSQoRhX4r7TAuFWm1BWvCcQfFx3)NX5HbeuLtjJfFZvB2zNNdIjl)gLrFO4(RClDxqugdsuPlMpLpXEqrZgt7bHUyqjEYi8VQg9VxMUg)NRd(l7ap3bZzxKPkyKkRfRqaNRQzDBS2yvQdPZy6qTEVZjRLkncuF1ga37eXYPtSBFzxtT2DHyGieSR7h8naPEDlDsz2fGbk5LQlc(u5O(hLaayBGLNDMiYEeCvCEhmMW71ymH3Zht49wmXlpM4W(3RQ)AmMO(Zhtu)TyIxEmXH9Vx141ymrJNpMOXBXeV8yId7FVQ5RXyIMpFmrZ3IjE5Xeh2)E1zVgJjo75Jjo7TyIxEmXH9Vx161ymrRNpMO1BXeV8yId7FVQ9RXyI2pFmr73IjE5Xeh2)EvNxJXeDE(yIoVft8YJj6CGtDxoD9k9P)eOVFf8QvcShyxVsVQVGI605XzoOZGQTV1f5ee72mm18dTz7l9kW6O4t0ZeG1d)XushUzUHO(krW3RGltElrRfM2S6zLvfWS3PvqvDReHkkde1Xn0Tb(Ep17Bk7vpSBV8bVzU)IkkUjsIuvZVlcYmhNxeLhb0c6zPe0RYDJe0d(6JI8u8Sy7zqJA2WTS0pYlYBTROELivyP8w8TXuIDLZcaDVGu9YBOwOguxUXw(MNjU17FECBJYXTnSXTn(jg3w)FhXTULIBD3u2R(3iU17T429g3(Coq9PO9IJBB))N42w)7oUT(FN426Vf3U34295a9xC)3UB66PV7)b]],
  [HEALBOT_OPTIONS_GROUPHEALS]=[[TV1YYTnsY296RqwZw0kWtcIfCrrqqcCnjaBaqzREHVbTfTmJwMSdkQoMECq9TFZhvvO4BB3Y3XteZcBcuvLzEYtLiRNQ63NV4IbRw(0FCH4P1FA5QN)ZxnA5I1ZVC5hVSE2QzlM(4f9E6pEy(hMUEw3PREeAWhN(WJZUi(ttx)86x9LKI4IIrDUIk9kl(1B64ABnQAqNRIN(465lU)Y)XJxUCXL)JfxzvMuvKp82oxTE1tGaXPI8oxDLvErDw)B7yV5IbZwmB10hqLx0Vm5x7yFTDO1GHfDfd7LnAuw(GoowPf1DfLPdRt7yBvvNf)6BRsYRYQZUjR(2oorw9hojRh0MkLPsf)MOShiVy44ubOw3aRj5Ge5XfJ6kQ74zLM1lzSOS(2(AH6QSP71UwPjcWI9klgxnojPxhFBRAXGQArDsUyus)I8AnvG6QuK1tRQcqnGvDGheVfEikGXi5Ko28lm206qBVMIiVqsmEsxVFjyDnK1cnogCQaBckDlQQ0q5M4ox5aeW1akyKoUUFJjiUfezs)(av3FqdfeyvojV7WSF73sUjjVU6ainwKhNmeIaSnkSodWhZV9lINu1ym61bLftgx1XzZfPZM(aeWG9(yhtvYWMMsTACsTUhTwuoiPP)Z1QFYBrk3q5qOw)YSK8Ekzqnc6q3K69BsFXW3iUTQkT4nBdtdlvFG2GizlvdVZWrc3Dqhwp5tYgS5IKfZ(8FH(UYsO(fLqWfyYK3Mvrfm6wWXHogOrCDkfAkfbytPQf5Vges)ogqOqMPGY2zw0qqeuv5jKPhy4JA1X2JKJXNbOqvQTLHwQY(niQiq7iCF7bCgkmWXkFYic1(nMDmAkxRDdvG3zajnAVIjDhM8MSEq(I9GUKG3Cr)LF4PhP8HpIDcsz)w)zZfI7M(hRN)NZqL0B27F6JF8r9hNZV)tpa)BToRqrP6rX93VAPUHWhcR)uVvl)dnGh)Wt3pFHwW)C2Qpbn6rD9I3)4YvVV596PRUF2A9RDzCOQ8tRMnTPYYzFy2I1PM6RXpkwD3SveJi9gWvzWapqOg(v7zWZGtb)VHoH3ydIpqWcEORuvApb1g7dGXJF6X1l)C8YhE85PanMmQOZxwb58ABDpLf994ZBS6vojdRWHk2pIk32FdecujYXXciP8XQvYuwmysJmrTOY9DaLjgjgKu2uxqavhufwHuvCvTPAIalnwmuWvbQYqQqpqSc4RjSoOcgZbrBWVbkhCRYmu5OfYfQMIqfmk9Ti71UKMBXA2hCI0jWGnuDTcza5X1fSXQ)KsPFhgr15Y(yueAMKHv1LWG2kBDDaBTXqwqtmbfHzWz(avmBMaTQgojxu()oU4nQM4XQZLBbWNjcjgd5UnBFD)dmqswSHWSYDz7cFtoKfmGfmGjVqK8UPqskUmPeWD6(rKCLBzWwSC(qxrvQG95RDOOHR9K(nNPOPpNKWfOXszFUJk4ztZ3eqGjgxQ(M7lDHwHtmPK634pU(sjvifw2v62njaKIqqTedaA(I(lyRDPkDznY5gWYXsLwH)(2OXrCfyofQuhVqQCpOVReDnKJm)uxlRdvVd4G9xn9ZZepmF6Jp)XNDE1xOK0W0tYPPyuoD(DxHwXsmmta5xP0LxrAyRbdl63VcgNW2INuu)vZ)xx(Rpn9Uvtxp9Y6AiBfibYaftQhMLNGd(VLPD3101tx87pULTZxU(Yjpo7UFeM3BxZpE26dB9lD(ryF)DTpn40LtxC3LQeOhclU)iWsWUyHMNYHbG3pca0AxaSLTVz2NM)HhM9JWWHNnkGl4L3YT3p8FVEDvrV8wp6Keofk(JWSo2NpstwYlSXHf3YP7WfggItvVEsjy)QpVC56pD5F6QnWV4t5YDSXLdMniTUdmCsPSKbYF5zAsJsUJrU7vUp79S)Zbp365WNB)Ce40pZTrMVTpBiCHTdlIFnSmZaRUfW6XkXm)DfXVw9Bx5ViMBfzvfddwJJPmeMooVaXiPKa(GPP0RhV4zSbWQX4Qe0qEkREd0W6SXGH7eAjMuxepSOcvk3yLfXXR0G21e0(Na0xB74QaU(zIW9oe4DB)3a9bNg9O5B8aVVwA)yEW)oH)DVIJM0EtOP38lbk3X1WDoUYf8mjpI)0y9VJWPg2yxgCWUDiTnDHGZ2HSRh8dO7W01nHVbt2a)OVT4PFuWp47e(uAyn(Dpua0FVVhCoUh48nKkIMF7wFruTE(h(9)I8d10xRNe)A9Ge0B1fJlYWXiYlYt0Lr7Ji8KzD7PqxTcL7M0w6dEyys)6gv6SLkHQlXbm2xTEVS4uNryhZeEo0ZW74WN8U9qF7tJ(VBwj606TBrDDXOZO6dJyka)LOFexfLCdJOOnEJyXMlQ1BilptMrtNV4Y10Ay2ro3tkx1Sh(4Us4DsjO1OTJe(7jHKtzr4vXTJmbNwMXRM)Ntxp7YHZFC9UI260IITD2Q9iIqLuToOuQ55VJuTvsfEiYGMF(oseDs6toR6D7CTpPq8uI3vMMic7djepv2nxiw8HpTCLme62oTCU2RnUB3Vbt5INGHJLY0VfR1ULPmq4JSrL80rB1k86iFB7wE(HTAzbHRDcDBbJQh123legnfIT74e4fy2kLzjd4GPQXVU60YhNoquKTFy7aNwsC4jrNjm8qOd6e01rHU31rEMY4JYeeEubccnBDa1AhCpToMaTJU2lYuMwmHEc20S1H7qLUr(Hx3YoQDlp32WOBiv22g3vPOwTJI8D8Dy2eQnck12Xo031jYKnbFosXMarIYg6A7h0oQTgh7ZMT3fjbUWqCbT98Ja84tiXh6uDdDDcccB5e6krIx7qSHo2b(TA3gqsqe8oIKqtK0Q9wYECKerSoPJJY6TUoiyRWy79GFieT5fg1UDdrcCRxuqe6q6WsxFOuJgUDyPJc(HqyPxulhN2oqe6(HLWNH3Pxs32hsJALD9Mp9(LlM(Wv8I34f1Pwshmxf5jesRORz9CnQ(WlKdRTE2)CT5IjX57OxDkBMJTgv1kkTP13ASsvTEpQzFq7VsL4dkPCCCXWMZujEKOCqwoquAAy08fZ)80hWC4w0MXgBCgMWuZWDLwEQxYCxmx4aySuRUI(zVLpGgYEokjvhP3XjmOgCRujG3nJMsjTOvI6uZygSMvACnTp(PuJWVEs5T8KBRp2uztWNKAknMMTArPSdGM9yJvkgkuN(gjvxDnz1uFxxTIgstfURrluQXqQszJ5TvnnUK2dGwaO7YWiRPTXL6hP98aAFjjwxDnWuB7GESelzAjMWNwDj7pkDQSool60yEbf8MaOGQ2R0eLwNkK1lRsqBfSQR5O9BzcDpNiggZwGAasvAj44(mwLqbzShz7BjOoVGiOs8Pai1CgtwzSqvXmefeWA5cQH6MTH1QqAbsgiig3levmT92oGILUKOKIo8bdukTUG0qly0lH0)Z4UmepK1rZiyv1gQK1ug3BKPLPtRnnU9rzLMV(XqMI8UgNfATyaDEFfpTgVIfLtxCpEyLdYlktkY7pz4q9es1jmGy0e8yyuZAIoCtSa8ZmXaiJx9BRfqrf4bHI2S(2XjnPC(LaUqJgbWOxmMb8XpSCXIzFynUf6IHao4klZgJ74xLk)dD(QIUvqKwLCB3qu1mVC8staZUb(2hQgVretgHkq0KolTrxf3KuI4NBDkdtxPNsN4fTv)eBvIQPr0uLcjysopE891z6pIhjEBCkoYJT2o4GqGM7ngYd2B6NNEpYHIJLboEOOQA7EnL71Vas4HF4P0SSaMZsQixwNZgOj92dYgRC57xUE5LDx(WDxPV3i7G)uvVwiMmLnGl2r3qt6YDW0IvhD7o1rqkC4zvXDYYzW2esa5yuD)c(bp(O)EBDPq2pzWSy8uw(njP0jWpuCBI(mSnGjmISKh3kKgRlDlcz0S7M)0NVAJ(RNt(TLoNtvfLpOj)inPAxR8y6lzx72qYe6rhitrUSrPn1kIJXeO5k9iI7j3bfEGaxE0JRJcBHfr74m1nlNdploN3aQkMZxKZTSiMNwbNRcScxnKoQsM9btckBuU2oP6MLZnZXh3yxkRjLae1O0IPgTGBcKKSiwnrgAaaHSnGoOSZ84cx7eOscc1qFTQxInUkfxKuKkmxMoSQNKuQ4KUWSFrmsxgl9qZ8aEeDRFmLBuUH8Lk5LxYiT1lLKiMnhM)sU6DWBW99QQPtuTh8vkBpK28zWk8PMwv28rvLQJ1O3dhkieSGQkWcekB0mLEbOcdfjIf8f3kNPtFmcJ6mD9rWYoyHKuurtQ2kYKDCIyvN0U(VzpHYtsJXXZfzCWAp(hQSQyIEcCDTyoUIlw1gvpDkfPUX8lOd)jwgmEGCzOLXj56lPhMtS5v8R(EzLJkMu1mgqz8nQuxTXdG(gD6hS5KgmggeV9pQwekFN3YqIuzd0qf4aoXBFRVKzUAbgwjimt74uTz5MPZNcCuzSuip2JuaasqZnMtxXdWPMZRjeOX80xBhvRlJvpbfkTGdBbfYcKgyBomTOQoZyyusefGDL3zPTRvzjmQjZja1Nz1sRhGiPX2e2taBLpO50YGzCKB(MM42iJcoCecU3sy9YuW)6erPMtIZkJByOEzIrfg37oAryYbPHrT19MLzI8bnIvv3mIrCPXDuR61ntpAtdooEGCZeXq2c6lmwydxsVjLBxIzt2wa82LLL3C392UsvaiW1M68awWOGnnO8Od4DZ8hN)(5pmF9FXEcmpm(JrAYFdtkRHPLszKOxkOxORzjnptLH2vtUhrtoMQj486X7fcrQnSElFVA5kz)x1e5YaBHrQG1AOE8cvY1bdSoP74(6ieLgok3sxPgzacMOexebH)C8OoOvNeWluwpXpZGy6UscvkV6mrTBtfzgKqQd3ocdRbuFPMPuw60wXuLDLjuLwEFlC3RuoRPvdjFCBR6CCRsoemWXUw)KwM30QDTI9PSIZ3MfU7vrB3ZzZgCxLCeRQczKM10mmA1wu80)emJXHYJZ4hMNlpLa1qaCzBnaUSSYey0ZAErABx1yCycUrPWSYhsZmFhPvtkylZSZ9UvPJ9VG4YAAUxPB7ohjF5I7W74VEtOhRxROOASioHorpADaJAQbhYa)LRGgofpzpAZm8Tgr)gynMk32Ae9lSoB9qKJyv7bIqpaYMYTDSuLPSkf8ff2QQruzdROAaLsk)xGkij3y6q77X74U2Fn(RZP93qP)gUJ)cqAph2v5W2s4Q8xHufk)w5DAVTblSY9um2Mls(8Sv3R21ry6h8mnLZZupzjAkPo0(tzDJEMgXLzqwByLY0oEcZWaHJVvHGV1N8gWO2Un5QjXhnN)hTBjrw0mpv7wQlV3o4Lc))zszspEMqh4Q1GB8Lfh2lTUAp5mkr)xNGCgDEbnET7lSx)FaoDtIEzqTocW(eKHhtgUBtg2MKHMl8odxeCwUWzFUiCpY4GmHXCMocvyRYR9ohZlQkJP8LlKz6brlMGpWxL5kCxP5)aK0dwOjh59dtTtX4FvmPDGvZi3qnHCitTO7QldeD40SC14u(uGgGxxklJEZvGsKlCSzRKGYK(IckYDRz394j6ONSai7awf0syBVppkH1Pq(7C3NQ5)KaO5m81q22w6uTyeOkU2Xvs3WdmF7zW3Q927i0T7HYXBIy7THm(xLgpvQVnaxUnGnXMjM1oYXamX0UNlaODGXoFUteG)Ura6tUYXX6qBU2xB))jOYguBFgy3Si89GTeg7T3Khb1kVSb2Akr377zetsn5LodqW3rgaVZNbW7NZmaNg5VZ)Nr22)8ST)pNS9Pr(7cEbzB3dX2oFhSDW5z7GFoz7tJ8316hYejoZyBNJTBDE2U1pNS9Pr(7cFPyBVTyBFjz7BW1QR0)5z7WZZ2H)CY2Ng5VR9lfB7)cY2TppB3(Nt2(0i)Dr)mMjj68SD0pNSD0j2M)QzRFuTAQE9f9sQsIRWRCqp9bsbKO5ZnNxeU8s9OJ92UC1XV0SMCu56t3iXqwIP6LfxKJ)TP3tEWmYg2mzywMdRxnOP2yEmph4iFKA2epDjRJ7QeTw6TERBdeaCYTeVllgS3PPxZfSU)zP0Rl)QevDpYHEOQgEPoTmfckiVtVchIB2QUTvBZDjr2Y3ikX7PW(hLdzdJAp4kl619GfJTVXs96ASCJDyJZer6UxezqtePDtaPDt8OVz8OFt8O)wXJgelhaO8AZispJisNV2iYD0Sg1FZHKkf9Tgt6SXK)(kIjD)5iMm6)VcjJore55im16n)UJiB)3kIm8)4Ji9(AIi9(VrKgCXHjS4LF(pEy26zV6)7d]],
  [HEALBOT_OPTIONS_RAID25]=[[TV1wZPnY2639VchVFvJlDfqpWdnscqNasmscpXZd5uKyId14atHXtTNDk8V9Z6s3TAH5sC22NY7Q2pKGu39AT(wF9sR(Ql)JflpRy2IBo3n4mXdB(6Q1p(xVB8QLBwC(QVCE181Zxo7(ZIF4pVBXNNTzEVzRVhAWM1pm)SOVoBZJBE33tYJYZh39IVm7U7NFHf)6vDDTTgxoO7frZUFZIL3E()4(ZxT88)XYlSkskZZgDD3lq1CHv0qrw3lUWklVkT)1DT3E2G5lNVE2DOYZ7xK8RDTV0UT1Gr59eJIthponBqxhRH5v9efdhvnSRTvzvA07VUmjRmTk9Q0QR76eA1F000yOnLktnu87IIyqEXOjdfGADdSMMbsKfLpUNOQRN1W04KjIIQR7RfQNYMUx6AnmrawmUiFs5KKK4U(2wvIbLvIQKmX4K(5zvAQa1vHinwRQCqnGvDGheFaEimGXi5Ko28lm206qBV6IiVqsmEsxVFbyDnK1cnjcCQaBck9Yll1q5QOUx4aeWLakyKoPQFTjiUfezA)(av3FqnfeyvmnR3O0F)3tUkjRQCpinsKfLmcIaSnkSkfWhZV9ZJMwwBm61bf5tNu21z7zdNp7oiGb79XoMYKr1nLA1KKkDpALOyqIz)x)KpGuUHYHqT(fPjzXkzqnc6q3KQN2K(Ir)M46YYH5)wtyAyPQ90gejnun8odhjC3bDy9KpjBW2Zswo)B)n67klH6xuabxDDTmlJ4fhSiUwLknBdbzqUKpKwsfujYEpiK(DmKqHntbLTZSOrGiOQYsgFnZ6gcIT3urutQtjOmhJhhtLuM(7qyrG2p4o3DfK1NJv20XeK9RRAcwdrnnIuG3zRjbvC(0EJs(T0yiDXtuVKF3Ew)vF(H7hSE1d)59yFGu2N7pBptCZS)CZI)Aofe)11ZNTP(ZKf3(17G)TrHSI5FE(Ynyu)96gjU921R0FndvT5RXRx9N11)P7xT(t1TppVq16j39WTlwQd4MT(251gV3dF5l1sfp)t87YSt)181F1eg1(r(6BMVMyew9GNAaB4nPQGNiOd)YUn8G2HXcj4apaag()Esz0wgLNDnW4rpC)MvFlA1D3)4S39DOtQO73xdP8A3X6w4NwowFc(X3BR1yXGeUoFhQUouvH(BH4GsrgoEaxnwlvxNTwf5dMIfZIe2IvNZw(l96AcOkCd2AfxmnTUC)qQcBWkteJeSfa1qYWc1gbxo8Tewhubd5GWT4NafdUwPmQC0pYeQMIWeWYeiVKzRGIgofgJHmwR2S36Xqpa1qYOYQcy8yLAi4Jo10cjj0oKk3LD4qam0N7uDDCzULHVpWsyg8ejZ7hW2lqljmwqA0)7K8Ft2eUEx2KXjIQgDz2(AgB00mrHHGWazeyDzvV1c6VhX1eWchWKxBK8UkxIxxgVbCxHFiA0X5sFHQYr1DxouWSYLouyWLEsMjwGXpfgD4S)bvvidSCuXnBR)MacmX4s1NIFVh0kCEjfOoLF0)9cQqkwPN0ZRtaifHONcS)V(lWVJT2LQ0L1iNsalhlvAf(RBJghYvG5dOsD8AtL7bDDfORHuKzghTSou9oGd2F9SVnxC3Iz3)4xE05DFNsrdZojJMHboBXlqRyjgLkkvfGkOXqH597xcJryBXtjQ)6f)RZ)1hMDZ6zBMDEvfKddKajG8PvJsZsWH(Byz3DTC1SL)X9nmTSKxEB7TRTNmFtttNTAZ5tVF(nN78AyF)DTpnW05ZwEZ5QuO7dlUVgyjyxSqtrz)aW71aaT2fanS9vZ)6IpF38xdd3(KrbCbV8wUZtJ9FsVUQOxERhEucNcfFnmRJ9PJ0KL8cBCyzTCQoCnHTXzPxnTaSF53wTAZxp)VC1g4x8P84o24kbthmSQlmysHSKbYF5zzsdqUJrU5DUp69O)Jbp26X2p25XqWPFKBJmxBF2q4AAhLh9EyfMbw9YHLIvGz9ftRYJgLxMGEdvkoEqpr07rK3k0QmcgTghvzemBBEfIUDKnfGjmrL4yE5ZylGvXWvjO5jOm(vqdRsNa2hndO8bsJOmgoyLg1UMO2)5J62EVEO(sBhxfY1pxWpx7bE)7X7V4Wp45a)BEhhoP9M2MEZVS3oKJPEbpHYd4t12)NPtrZCpLpBes1X0fc(j8GxJUK9d(9fpfEY4P)Fc(b)uWNYd)g47b3N53dLBw85)4VjVqnZ1QPrVxpgb9wv(K8uCiIS8SeDz0oicpzw3tuORwHY9rQH(GhgL0VQwLonujuDboEXtvR3llo15d2XmTpf6z4Dy4tE3tqFNJJ(FAwj846TxEvv(4tO69Jyk8(WmXZrZ4sOK7wefVXBcRRfTDWk1ZtLz8SflpFdTELDKZvjNZ(KJwD1os49ejKCels587(YUI4FCrO2TRmbhxMjRx8xZ2m)8rlUFZUI264IITD(6NWeTvs1AVsPMP)os1rjv79XF0m03rIWJ2tjNx9U9U2hviEsX7kJoKWXEVEepB2TNjw(5VUATmi66Ubb4ocmOaYnIP4kWTmvrNFOBlNl9CnLbcGKnQGNrARwTVm032ULNF7wTSG41UTDBbJQh2X3RnmEke921jWlWSvkZsgWhSl9Dq3w(40bcdT9B3jWPLehEs0zcdpe6GobDDqO7DzONPm(K72(Gce02S1buRDWnW6qc0j8sVqtzAHY0Y5iSPzRBVdv667fEzNGWwoHo(2mv2QJ3LUoE2T9A7bScZMUEUTnBObB6Dzhfz6b9cOO(EUoUDc1W4PKzhYvdV0o4WiVnTaJAzcpTmDADzqqJ4nBuO20E6Dqd5scbH23OxOeV4l9HAWlxkEXSBxTC2DxWRiIxPKEDsUwYtCJwMu9IKQ18(xDewB18)5g1k0ODyREbF4I6o0I(uM2MwWOXs)068GM8oTRkvIpOKIjr5J0hPq0yrXG0m8OGumW4flx8Tz3HzeTO92mY44aH56GBWR8aKKkHPHqBRcT2Y7N(b(SoiR5OeuD4ymYCRrwqnYKM6fbAAZQHsGcB1GLXVJTTj282l2EXznWQptAtp5OAS2(1Uh(P0OZHOXWgSyNxBw8zGSgDW38o(Ze4zCtWPVs6LsZppeNlpTQE1Yf66aPaIQOdFzi1OoHDSgYBwn3wFSPYMapvWkAyeTsP8c5N60knKgjoTuWPyab7PnCAfT)n9IKnJUCaqgnJwOqPHu6wZBf(WOcAVBAbWThJaAxPCP2wuRkPggwqI1txfSMKUOVkbtQwKP8fmOGDffauUl2pmmIxhfro9uyv7wAksRZ0A3iFKO(yKLDn7p9guzQq3ZLkvVGOeyqnlbVnyPSYB5zLY(MTVLG6adcHkXNcGrwtzAlLfQmsQncITCb1qD12q6FslEDSeOeDi9sNnHdOxPVjkOaeFq)fsJlif0cM7HqI0uUZdHdzC0kcwvDGkznLYDlIiy2KPW)TT2TpiRupmdg5KN1Z4qSRedOtzn)Hn4vJPy2YBXJzEqwErsEw)PJgPxpHESPHJfFiAioEQnEG04rPHFJjgad1w9HkbuuoE41O1QUEcoCl9Orv4efLarDJhgehHJ1E)NxTC58pVzoECm5JsqTRMAn1SI0j4w3wQg3JoKCrVsi0RuU)POC1RWcV4lWKuHmbygaOk6CbPtz5clr9GP0rc(HQcb3Y8RskWI43gYEVlUlbJa6bxgpGfej1azy9KcGkj(aVegvPt0Nkoy(4jq(U4zFB2TOhnSwCdAvCOX(JgjklB2fQCW(5q6n6Br1U6cXp6onHEEcafP3Jx2mfR(0QnRoV3Q7U5c99(zhKxYUnLuLTKl2Nxtl6YDWCJLhYbu0QeT1B4ShrOjLuNlcG64fiTJI0f8dEA9aGar80XOCyywA2vjdPRqXiX1j6aSAGQyNavinw4WgmX453S4HVXjCoYeQK1QZ5uws5cQZsMXRSklI(m21UdKiHE0bYhLjB0W6Afrr09brPhruSC7J4XdC5HpUmSDlkldWZeJjxZglnNZaQkIZvKvqTmpIN(kNqeLuwFPmXdM(t2MmTv4HnCBHWLf0h3oEkFjL6dvO0GdnAb3ei9yEKA(Y0GaIuL5PF7WJnCPtGk)hud1zQ3FeC9LUiLivyMmtyzSKsk58TH(oigP7qNQjYFZy)keiDag4E1LziCHsyTRwYmgM9gM9uMgHyM622iHQ6mIuhBc9XUmNheVc6NpK7YcJpHu9MdJWrffPCNTUpwjtwTAn6Dhw7eIibFn7Yywe9uUp0fEugwLlPcL2vnvKk7Uer6UcsZbUaCnO(HsYuEF50flJrJLONgGpHAAdFflVu2ivOwwtDT18lO9)jwkmCGChekIsY0tuetdw)kFPRQFVi6k1x5DWBnWv60G1dpykPQ(2Y35T6LiwO9XPgjBr5JAkTmlvlWSkbBdppuBuUz60YapxejfYJDffaGuYaC5878yzQ52AyFscJrWrLRePis9eOhPnCyBOWwGYPgNpTSECs(QKvVwluePcyjgMxwLUBluwd7wtDcWUaZQv(SlcNMaacTRWTl34YEzin8MM)2kJc2FecUvIy9YuW)6urHU3nkTiQUVoovmo34ctASy)Y3BmtNQIur2GA5kRQNNsuHXDlCmm8UEUPACC4a56jIH0f0HySugUK4PfnlXSjnfaVxGPz1x6YMvQIdX0kg6CpwWOGT1O8Gd4D1I7x8Pf3TyZFlNNnKTI(yKMc4OKIkyAPuYj6LC6f6(XsZZ04d)gAY9aAYXunbNwpEVqisTK6g(E5Q1Y(VYPYLb2cJubRvt94nHLRdgizAVj9nx9cPHdYT0LHsMSdbzNos8dDZ85WheWlnwpxVgbX4vCfQSRCpQC40xMbjK6W9KZWA4gTstR10sh3kMQuLOsA5NAHBENYznTABPpIdRAAzNdB5EY83nI6pMLPnBOqhfCAF7zBbCpdA0ZzZgCxLCaRQ(ouAwtZWOvBrXd)tWmgxPcC(VWeC55DOMJlxwJHRLLvKaJEwXlvRzvtKR1bA0qyM4JOzJVJ0QHTByg11LUzt3Zn7xwt9T5TP7CG8LlVb)BZqF(bt0RDuuoreLqhilT0SX11GdzG)YvqJQc)oH2OdFRX0VbwtOYTTgt)cXF6XjhZQ2deHEaKDi32jsvoKvPGVG3wL1IkByjvdOus5)cubj5wth6PE8oUR9pI)6CC)TT0FBVJ)cq6joSRYHTLWv5VcPku(TY70EBnwyL7PySTNL8T5RVTE7TnNRHCIN6jofZB7fUvvwxPNYqurkK6gwIhT)6W8mqmbtqsW3zxEhyu75MCzK4JY53sBvc8gIo12Y7Y7Rd(3aW)Z0IKyA2i77IrHB)Lfh2lnSkfHrj6)SsKtSZlO2RDFn8632oDDIEzqTocW(uKHhtgUnjdBtYqZfENGlcogx48uUO9tiJ9YegZz6auHTkV2hDmVIXSBNTAPCWsq08Pf0QMW07L4MvZ)LJPgKw9nLA0WDVpGow4Fxtd72HU)F5Y9yRhNBOHUmq0(tZYvJt5tbAaESM0BgfuICrK17HeuM0xKwxTbn17si3FeEWJXcKDaRcA1SDEkpkH1Xq(hDFkvZ)vBqhx3pmzxpXGMByeKU0vY20r9POBpAq7ds3U7lhVjITBc5H3HrD9E2awJmd0A6eMaU4iaMyA3tfa0jWyZo3jcWF3iG6Ji1XAFBU2pA)V7X7)9m6)jT8Q91wWp(xBEN(RnV3MFTDCK)r)3IST)PzB)3MS9Xr(hdEHyB3tY2o)4SDWPz7G3MS9Xr(hB96oO9rgi5iSDRtZ2TEBY2hh5FS9lbB7Dy22xs2(w8j4(dX2TpnB3(TjBFCK)XoVeST)lmB350SDN3MS9Xr(hdFlMjj80SD4Bt2o8iBPE58n3Rw5sCFrCszsujEA(X6tacgpZ8z9PqeqRLtpez8ovOopK6vaJQxFwcjgctCvCAuEg(3WFS8CqQfSrbSK7x7kW3R(SJWQuhYsCDXXMGPhzACdCOLT28Tetna4KBmEZrm4VJtWMlpC)NCr9TOiU3boIbP33dEPAyXqiSGaME9eeR0Oo2kk5QnHSL)MOaViap9GtiByu7Ex9rCVduCtRQX32DzJtet6(KyYG6ys76qs76isFZas)6as)gXJgelhdO8AZispJisNNxe5o6xH9F4qsL8)eXKoBn5VFGys3FGyYWx9qYW3erKNIWuR48NoISZ)wrKT)p(isVFKisV)BePbxSFclA13(Z7MVz(7()(]],
  [HEALBOT_OPTIONS_RAID40]=[[TZ1YYTnsY29(RqwZw0kWtcGfCrraqsCnjaBaqzREHVbTfTmJwM0bfLJPhhuF73mRSEbk(W2JuFvmXSOBcGQYmp5PYkRNY1)5ILVQA2IRpZ3(vS7385vRF4BVE8QLBwC2QpDwZ81Zxo7UxLE)xVDXhNTzEVzRVdQWM13p)vjFE2Mh286VNvMuwoU75FA2T3n)Cl61l76ABnUEq3ZtMD3MflV5S)XDNTA5z)JLNBvLvxwm6QUNJQ5CRKHSIUNFUvrztE)R6AV9vdMVC(6z3IkVSFv2V31(c7qRbJk7XgLMpECEXGUowdlB6XQgoQzyxBR6M8K3CvDwrDEt(L5nx11j2Q)OP5PqDQLMAi7pyvPG8SrtgYa16gynSNuLUx4AnmpnBcRQ5Q(sz6xMmTEqv50j1OrZyGbtRkNupjllTRVTvdBqDdRjRGnoRFzrJIjqDvXYtvQQemdyuhEjC92xv5PfaWlskh3J101JGoHsL6uMUjFCguhYBeeKNr5jSIKSrqlGTXhNKa6nW2QAArVr5)XFKDzwrtTs7xM09ChGqUW(I4ZfCBAwVP973LW7Kgny7pqZzb8s7vwxR8tQXOFfqikMxHdLskhZEha84aYz5(Hd06pC(SBHagS1hzK6SrAdZBhMK1OArByvdYArCSrVLDvD9WY3QHlgU1VkpRivjhicOhvvA2Fv42RvKGHPA2NPYEh2KR1luF6dcLUt5O3zGJTVkB58V8xOVlneQEwfeD111k7D518pm(kWXHggOsuzs9zkfhVMs1WkEdjKQoJGImRYJSe2WkbFwrg3WdqatFc0fQ1AJ3jSTpaXBk1GMAhLPn06Uo)pGW7angihXXQy6yoC81fnbTLR1UXjW7KqcyLwoT3OS3MNcjl2hYiMz7R6V6J3F3G1RU)R3HTbcP)z)z7Ryxp7RBw8T5OssN)H7)0NUt1tyXnF(w4)2OYk8T5R)meZFNczSBUz9kv9HI28501R(QU8pC3Q1Fqx)Q5FC(YndBPJMpVE(Sn6xNT(M56x7ris82KBV)Mflv4PSQ7U(r56RNVMZiuDbp1WOWBcNeEIdE4xcaWdkhg)ihgWdGrG)FpHmkkaLNCoW4j3F3MvFjz1T39WmGgZgx297FaYyezDdpl6A85TwPSXSbzvuzo8YccGcD2cnX1ScCWaTCCP83Avvoyk9zFsM4oKmPvtZPcS95f4htfqbu8sGHn4MHkycBeJ(EON28Og3AnUecS4LfedLXb9wmyVAaHkXhb1mMvWvJJeMGMHesYpjQ1WPWimeUjqe5XnwNqaHtReUACmVm3o8YcJrTNnQUPcgOwAco8bJa95fKNpb)oe1gcClM2wsTcDgroNFa4gxwkCoFQSGyEzUUCTosqkIYiTgaAfgckp5)Ds5BjvtOjYLGtAgRPf)d)iHZOPfSkTGaMivZf9cVTw8(XeIOOKoeAJaevpKz48Eubo(i1mitOoYIrKhcSDLSirBIZwDFciWeJlLDg)oMpgNxspSzs09779ihyaXrv8wqvcaqeBErHrKu6ubcTbCPfQca(usb53XVUTvhFuzxiraxcSJm)RbGPrD5bHmyzoEqWIiJGYqXcXGKGRN9L5SBxm7Uh(0doV(788Xo2wf8XZXzlEo6jwSr5SA5hq72AKWY(9RHXjSTO5e1F9I)1z)(9ZUE9SnZoRPbYIrCLv50Mr5fz80VMw2Dxl3mB5FExltl(YtVT9212tMVPTPlwT5SP3n)6ZCEoSV)U2NpW0zZwE9zYuO7dlUphyjyxSWNIY(bG3Zba6SlaAz7lN)5fF825phgo8Krb0hE6TC0JJ9FuRU8tp9wp(Oeopu85WSo2Nost8LNyJdlRLs1HRjm0IMNiFepHE)nFkXPnScXS8bdB664Bvj(YaXVWC7BMwbWU(lRwT5ZN9n3Z31ix)A3h8EW)HGh68q4drpedo9duDe5A7twext7OYK3alXeYzxclfRcZ6ZM2uMmQSod9g(x7HJfWsEdI8oXw1jWa2yg9rW0MPvg6gjQkoAZewAkT8zSgWIyOIy8Pdin(LqfBYNa2hndO8kHrKgBaUkDjQDnrT)ppQHjn9SH6lSDCLix98a6zTh49VhV)Kd)GFg4F9RPWjL3eA6n)2EBqmuZJupJMt5b8jdC9l0OOyK9YN6gKitxi4xWdEMBsob8Jpz80FtWp4xc(88WVa6p4(t2FOEZIp(N)f3lKZCTzAYB071c(wt5KYCCiIIYIm1347Gi8KzzpsHUkfk3Mlt9bpmkRFJwLoTujuCfoWXJvR3tlov5d2XmHNc9e8om85E3JqF0Xr)VmReFC92RSPPC8ju9(rmp8(WmXpJMXvEj2TiE8gTLNUw89dwQEAQmJNTy5zB4Rxzh5CLY5Sp54RUAhj8EKecoIePE(TFAxr8pUi86TRmbhxMjRx8TzBMF2Of3Tzxr7CCrX6oF9JyIqPuD2RuYz6VJursPc3h)XNH(oseF0wkX8Q3T11(OcrtkExzuHeo271JOzZU9vSLF8ZRwlcIUQBNoWs0X96(TDXuCv4EFkPZ31TJZf2bMYabqIkvrtnTtNWlI9TT745h2PJfeV2n0TdmQECKVximEke921jWlWSwsZYnGdMSh7h0TJpoDG4yB)WOaNocCirNjm8qOd6e01bHU3fXEMY4JYeeEqbccnRDaV2o4okDibIIVWl2uMoCc15iSPzTd3HkD99IVikiUJtSJVnrLDI8UW1XZo0l0dyfInD9CdnRObBgFrhFjB6bndOS(EUoUrXkC8y2mI7RXqt9HHo0k3YxJpTmrDUiOvWdgxFv3q((6Dqd5YfcITVwTsjA1xuxa16LOfjrlmsTqjy(g0wMYxNKEvsPlMDZQLZU9CTM3)YJWsBM)p3ixIgTbxX(X6v9HRq8qR8tIdAR2I9dmxdOs3h003QCzHI8qIAss5i1PlKmMvniVapsiPZnEXYfFz2TyQrl((vMyCWGWKEWn7vCqscLi(iDmhCT7c(x(7WyrL(jMosCkzeYCviZ3wJmHPEsGgz1yBdGiqMeQbA4Bcnpn0(7I0CoeP5yBWAQjjPXA4ZDdSST7WSO7(zXONBwurqhgAo7dAx)AQxc8mUz4uNK8g(EOatPNV4E5Qg66azesWY8TgMJ9eJIJSgs78mvxmlzLOkWt857hdcXxWuzLOZoFbhdOYWVoIPoGwu8EQsKajruz(nfaYUjQXWC(swKcKMxZO0w8TbhmBfFhG6WvL2E5AdKuPEKVTvGULOxveS(KUW7kfi)LrPllRuObtH1t6Zye9WeoaHKv4kKYLAu4wdROdhaqKQedOr2zRSPz)z3GcZzQwowcmVlgNpGr2Sy0EHLtATJNvo5u2(wmEZxqmui(uam8AoXA5Kq1jeizCS1XfudVH2gQbALCHtKZXPNJVvo5oSkEGb8o5vCZsCktjtpjm4gf1oJ0te8Pb8dWcDeHyyDIa9W4W3lAR2TpiROhTbdAkl6zCG2nSb8tiT8(n4vKPA2YBWdtEqrzvwzr)PJgPwxHA4PHJzVlzioSQTAhfdaAegWT5DnSIKHL4PyJgR5Qj4GU8hnkcSAAcoM5DFC1YLZ)4M5xRmGlO1COIzmEhvCQLciloqxvTqTMxCz2q(rNpIDvMQs4xGotzg3mHjSkykRq3FC7xp4(QQhET8YSkeeyoyXJKWd1ianb)q64NDdNnRW9xMFqJVRPIjKqp5bOgCIcVGgn5Q(6OIsNa5btN9Lz3mFnENvedR7Azq34TZz6y0ejJy11TBlL(y)siXh2nBOS1jKJSSAuqMA(calP29xIqQw9HvBwDwVv3ETEMgEk)xOyxmpk9SlsMA(q9Dhmbz9Hy5A2iicdevEzJ2HnyQqnEP6ihizljk03IEWZsZtYIWBKrVAizeg)uRlh5a0ieDZBBfRDdC2weW45xV4(VC(wvVNJ23sLZPUM3RehsG6DxqRWAyscMpSoH3X2bshviZ7rFY1g6StvQqQdwsQylKOHbCPXoUioSdptdOpElQyDBK0uQd0uugOIkEnltOjXs5drjfLxlY)Gz)e1PqzfAqd3oiCjb9XTKNNUKNacvOWGdnQbvfi7yPWCdZ4j)z5sZZ)nIgtawDMmniucp6wThj4AmDrkrOWcrAW6ubLut5CJ9DqmYVhDYrLZ4VwqUvCiEJYWhTkmKTskR4UHPwpRIFsj3e7YciPshJwOWoeTXBCf2De)CdaRqN3DTHm1YM0HCrk0n(fQs2fjjjQJQr0QBWqSegDNZkik1hJX4nOU8h5hxUl2qquJmIswBwUO5JLiBaKbMAEZikRw6vSCkyLONHAqwidwXb4c5BEkpmHpD(AkASqgxT1Sh0(7ILddqi2jHQKSc1efXSF6xX09P5vJlNwRt5xLCPm)xeE7bUuNvrn6G51UtwEO4DAFF5KkPEDGjkFsBPfzO6aMvkyi88qLrPQPsjdTkgPWDOxKqWHSjW8n4olBAx5CDLNuyzL2eWls1vLiFISR8nOkcKklzhsvQnb8evoqCNZmixrjWK5G41CNaupg4CyjGDdbadl5Las16xHY2rAEf0xJqkky)ri4wkILlsb)7tzvQg2K8QeDZCAoBCP(grAUM)XWaYQ2ZQCwXaTy1n6jFu)gJzeLuPVnHB144WbY6jIvNovhoHey9J)I5cDQB)w2O(5fgx7YwfkJ(cekUTEEKzm(Wwnkp4aExU4UfFyXTl28xKNad2sDgR5hRDwvdmNyEoj(lL8x4xQw(8mLgAxn5Ean5yQMGtRhVNiejxsDlFVE1Az73uX6a7GbVG10umEHyPY8GC19M0xfHi1Wb5w(LIsKSdbzuKa)qBnDW8bb0sJvtXZmiMF1pHcf3MaZieE6ziRcxD4wZzynCdxXrNBzPJBLwbFARwjj8ww46xlDwtRgUhR6CyRY5dyW2J4J7Z3I(58TkHA)HTaUNbTA5SjdURKhWQYqgvGkhIgiqzr29)tWmgxTcCo5WsEOzMixAe9TwtGq8TQmy0ZgArvTlAIyboqLgct4FeFs)7iTCsjTmJ8Qt3UQ77QXtL06M4A4ohiF5YRX)gnuNJWe1Ihz1tyjz8dMLV6QX6sWbVWFPc4dNc)oHVFg(wJ5)gynH)DBRX8FH1BRgrCmPApqe(dWxivnrSUr6YCBXhLeTa)9qRXdjnwR0eJR7FdKKkARPd9ypEh31(hXFDoU)gk83WD8xatpYHDLoSTeVspw6PmHU0EOYNfLi8ypbLT9vzFz(6B07YT5uZet2unNPu9MvzDPEciv5qQByvA89BhM)cQyF5USLl2SngD5HfRwLVpuqSQO2sdsbWYpkh(gqLCZ(379Dcwj5)d8Pu(KuYfRLbxdbF7CITKR9roNoVaTx7(871V0CADIErqTkcW(uKHhrgUTjdBtYqXfENGlconxiXGjz4SlzyYeH)iuHTmV27DmVQXKBxSAPitpGGYPvI)6RYQQX9HM(litnyHIxe3Yp5EfZhvqLwvS5AiZI)bnnSBK1U6Yar7pnlvmoLpjOb41JNLrTPtWxKRov3Wuos4lcuapnqdvBzZr8HVcJIDRbeKVi2iZdYQfSogYFV7JPA6VEd(Cg(riBBlvQ2Eg7OzSGTfJ5XDtpdYo(WKTlhYMi07FdeQqhcvY2oUky642cNi(Kyf9MJIrXSYmWz4tloJpaB(tGsJBp8lkUlUDeODBqo8wm)rVF6aWkJaqaDAeBe(zc5dbrEph3t1Ho6i9O93PhTJXjpVV9k9i9ND3bvhT)SNr)zUw(Bl7zWHBW9oD2tVxMzppoYFV)lr22)0ST)lt2(4i)9bpHST7pfB7Cy2o40SDWlt2(4i)9DEwMeMEqJwKT5mdCCpmB350SDNxMS9Xr(7dFQyBVwST)HiBC71j62)WSD4Pz7WxMS9Xr(7JEQyB)Nq2o60SD0lt2(4i)9XVeZKeFA2o(LjBhFKJiPE(M7KRenTplnRolPgNZzQ6W8as08z1XirR7xn8yQrbPIZNsCXQGQHQwDUqzgcY5P08KYc8FzgWcKN8LzLLhNg92o1Wu390eSPCgNzwBmjD3ECeG7jhUKG02VP1jGvQMD7S1K)oobBUC)hFgrP9OxfEtVwhzuAp99PiThusZWkCDECNtvcNuAvMEXdP90plQ3BzvfIdsCVlTGBiJkvVdK2Rq6ZqtZWKCI9GEh24eXKUpkMmqhtARdjT1rK(MbK(6as)dgp2AZQuJhQdiDAfq2Q27pIuwLwQ)xlMm4NpM0zRj)9det6()hXKX6qY4xqrKNIWKR48xoIm6xnIm8)mIi9(rIi9(VrKgCX(jSKvF5R3oFZ8x))b]],
}

HealBot_Config_SkinsDefaults={
  Skin_ID=1,
  Current_Skin=HEALBOT_SKINS_STD,
  Skins={HEALBOT_SKINS_STD, HEALBOT_OPTIONS_GROUPHEALS, HEALBOT_OPTIONS_RAID25, HEALBOT_OPTIONS_RAID40},
  DuplicateBars={},
  Author={},
  Chat={},
  General={},
  Healing={},
  BarAggro={},
  BarSort={},
  BarVisibility={},
  FocusGroups={},
  FrameAlias={},
  FrameAliasBar={},
  Frame={},
  StickyFrames={},
  HealGroups={},
  Anchors={},
  HeadBar={},
  HeadText={},
  HealBar={},
  BarCol={},
  BarIACol={},
  BarText={},
  BarTextCol={},
  Icons={},
  RaidIcon={},
  IconText={},
  IconSets={},
  IconSetsText={},
  Enemy={},
  Indicators={},
  Emerg={},
  ToolTip={},
  CustomCols={},        
  Adaptive={},
  AdaptiveOrder={},
  AdaptiveCol={},
};

Healbot_Config_AuxDefaults={
  Bar={},
  BarText={},
  Overlay={},
};


HealBot_Config={};
HealBot_Globals={};
Healbot_Config_Skins={};
Healbot_Config_Aux={};
HealBot_Config_Spells={};
HealBot_Config_Buffs={};
HealBot_Config_Cures={};
HealBot_Config_ActionIcons={}      -- Remove this soon, also from ToC's
HealBot_Config_ActionIconsData={}  -- Remove this soon, also from ToC's
HealBot_Class_Spells={};
HealBot_Spells_Loadouts={};        -- Remove this soon, also from ToC's
HealBot_Spell_Loadouts={};
HealBot_Class_Buffs={};
HealBot_Class_Cures={};
HealBot_Skins_ActionIcons={}
HealBot_Skins_ActionIconsData={}
HealBot_ActionIcons_Loadouts={}
HealBot_ActionIconsData_Loadouts={}
HealBot_customTempUserName={}

HealBot_Data={  ["TIPBUTTON"]=false,
                ["TIPTYPE"]="NONE",
                ["TIPUSE"]=false,
                ["UILOCK"]=false,
                ["PCLASSTRIM"]="",
                ["PNAME"]="",
                ["INSPECT"]=false,
                ["MAPID"]=0,
                ["UNITSLOCK"]=false,
                ["POWERTYPE"]= 0,
                ["PLAYERGROUP"]= 1,
                ["PUNIT"]="player",
};

HealBot_Unit_Status={   ["DISABLED"]=0,
                        ["CHECK"]=2,
                        ["ENABLEDOOR"]=3,
                        ["ENABLEDIR"]=4,
                        ["BUFFNOCOL"]=5,
                        ["BUFFBARCOL"]=6,
                        ["DEBUFFNOCOL"]=7,
                        ["DEBUFFBARCOL"]=8,
                        ["PLUGINBARCOL"]=15,
                        ["DEAD"]=18,
                        ["RES"]=19,
                        ["DC"]=50,
                        ["RESERVED"]=99,
}

HealBot_ReadyCheckStatus={   ["WAITING"]=0,
                             ["READY"]=1,
                             ["NOTREADY"]=2,
}

HealBot_Unit_Button={};
HealBot_Private_Button={};
HealBot_Enemy_Button={};
HealBot_UnitTarget_Button={};
HealBot_PrivateTarget_Button={};
HealBot_Extra_Button={};
HealBot_Pet_Button={};
HealBot_Vehicle_Button={};
HealBot_Emerg_Button={};
HealBot_Buttons={};
HealBot_Test_Button={};
HealBot_TimeNow=GetTime()
