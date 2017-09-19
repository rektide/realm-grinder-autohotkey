; run call to arms then a main spell, & then tax collect until end.
; meanwhile keep clicking

; crass numerology is stupid - be better than it

SetBatchLines 8ms
SetControlDelay 4
clickCount := 8
mpRate := 46.9
duration := 30
buffer := 1000
regenMp := buffer / mpRate
spellCycle := (duration + regenMp + 0.1) * 1000

#Persistent
SetTimer, SpellCast, %spellCycle%
Gosub, SpellCast

Loop {
	; clicks
	ControlClick, X100 Y166, Realm Grinder,,,%clickCount%,
}
return


SpellCast:
; Spell 5
;ControlClick, X666 Y370, Realm Grinder
; Spell 4
;ControlClick, X666 Y310, Realm Grinder,,,,
; Spell 3
;ControlClick, X666 Y270, Realm Grinder,,,,
; call to arms
ControlClick, X666 Y210, Realm Grinder,,,,
; tax collection
;ControlClick, X666 Y166, Realm Grinder,,,,

;SetTimer, TaxCast, 600
delay := Ceil(100 / mpRate * 1000)
SetTimer, FinishingSpells, %delay%
taxEnd := Ceil((duration - .1) * 1000) + delay
SetTimer, TaxCastOff, %taxEnd%
;SetTimer, Spell3, 14500 ; will start TaxCast
return

FinishingSpells:
; spell 3
;ControlClick, X666 Y270, Realm Grinder
; spell 4
ControlClick, X666 Y310, Realm Grinder,,,,
; build
;ControlClick, X800 Y570, Realm Grinder,,,,
;ControlClick, X800 Y520, Realm Grinder,,,,
;ControlClick, X800 Y470, Realm Grinder,,,,
;ControlClick, X800 Y370, Realm Grinder,,,,
; tax collection
;ControlClick, X666 Y166, Realm Grinder
;ControlClick, X666 Y166, Realm Grinder
;ControlClick, X666 Y166, Realm Grinder
;ControlClick, X666 Y166, Realm Grinder
SetTimer, FinishingSpells, Off
SetTimer, TaxCast, 400
return

TaxCast:
; tax collection
ControlClick, X666 Y166, Realm Grinder,,,,
return

TaxCastOff:
SetTimer, TaxCast, Off
SetTimer, TaxCastOff, Off
return
