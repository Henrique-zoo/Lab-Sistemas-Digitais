onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 30 Entrada
add wave -noupdate -color Blue -expand -subitemconfig {/tb_dec4x16/instancia_Dec4x16/A(3) {-color #1e88e5 -height 17} /tb_dec4x16/instancia_Dec4x16/A(2) {-color #1e88e5 -height 17} /tb_dec4x16/instancia_Dec4x16/A(1) {-color #1e88e5 -height 17} /tb_dec4x16/instancia_Dec4x16/A(0) {-color #1e88e5 -height 17}} /tb_dec4x16/instancia_Dec4x16/A
add wave -noupdate -divider -height 30 Saída
add wave -noupdate -color Green -expand -subitemconfig {/tb_dec4x16/instancia_Dec4x16/Y(15) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(14) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(13) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(12) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(11) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(10) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(9) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(8) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(7) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(6) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(5) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(4) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(3) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(2) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(1) {-color #2e7d32 -height 17} /tb_dec4x16/instancia_Dec4x16/Y(0) {-color #2e7d32 -height 17}} /tb_dec4x16/instancia_Dec4x16/Y
add wave -noupdate -divider -height 30 <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Início {0 ps} 1} {{Mudança na Entrada} {6250 ps} 1} {{Mudança na Entrada} {12500 ps} 1} {{Mudança na Entrada} {18750 ps} 1} {{Mudança na Entrada} {25000 ps} 1} {{Mudança na Entrada} {31250 ps} 1} {{Mudança na Entrada} {37500 ps} 1} {{Mudança na Entrada} {43750 ps} 1} {{Mudança na Entrada} {50000 ps} 1} {{Mudança na Entrada} {56250 ps} 1} {{Mudança na Entrada} {62500 ps} 1} {{Mudança na Entrada} {68750 ps} 1} {{Mudança na Entrada} {75000 ps} 1} {{Mudança na Entrada} {81250 ps} 1} {{Mudança na Entrada} {87500 ps} 1} {{Mudança na Entrada} {93750 ps} 1} {Final {100000 ps} 1}
quietly wave cursor active 0
configure wave -namecolwidth 169
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
WaveRestoreZoom {0 ps} {103721 ps}
