onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 25 Entradas
add wave -noupdate /q2_topmodule/instancia_questao2/A
add wave -noupdate /q2_topmodule/instancia_questao2/B
add wave -noupdate /q2_topmodule/instancia_questao2/C
add wave -noupdate /q2_topmodule/instancia_questao2/D
add wave -noupdate /q2_topmodule/instancia_questao2/E
add wave -noupdate /q2_topmodule/instancia_questao2/F
add wave -noupdate /q2_topmodule/instancia_questao2/G
add wave -noupdate -divider -height 25 Saída
add wave -noupdate -color #2e7d32 /q2_topmodule/instancia_questao2/S
add wave -noupdate -divider -height 25 <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Início {0 ps} 1} {Final {128000 ps} 1}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {134400 ps}
