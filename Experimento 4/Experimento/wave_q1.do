onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 25 Entradas
add wave -noupdate -height 20 /q1_topmodule/instancia_questao1/A
add wave -noupdate -height 20 /q1_topmodule/instancia_questao1/B
add wave -noupdate -height 20 /q1_topmodule/instancia_questao1/C
add wave -noupdate -divider -height 25 Saídas
add wave -noupdate -color #2e7d32 -height 20 /q1_topmodule/instancia_questao1/X
add wave -noupdate -color #2e7d32 -height 20 /q1_topmodule/instancia_questao1/Y
add wave -noupdate -divider -height 25 <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Início {0 ps} 1} {{Mudança nas Entradas} {12500 ps} 1} {{Mudança nas Entradas} {25000 ps} 1} {{Mudança nas Entradas} {37500 ps} 1} {{Mudança nas Entradas} {50000 ps} 1} {{Mudança nas Entradas} {62500 ps} 1} {{Mudança nas Entradas} {75000 ps} 1} {{Mudança nas Entradas} {87500 ps} 1} {Final {100000 ps} 1}
quietly wave cursor active 0
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {102308 ps}
