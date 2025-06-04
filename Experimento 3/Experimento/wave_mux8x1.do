onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 20 {Entrada de Seleção}
add wave -noupdate -color Blue -expand -subitemconfig {/tb_mux8x1/instancia_Mux8x1/S(2) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/S(1) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/S(0) {-color #1e88e5}} /tb_mux8x1/instancia_Mux8x1/S
add wave -noupdate -divider -height 20 {Entradas de Dados}
add wave -noupdate -color Blue -expand -subitemconfig {/tb_mux8x1/instancia_Mux8x1/D(7) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(6) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(5) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(4) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(3) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(2) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(1) {-color #1e88e5} /tb_mux8x1/instancia_Mux8x1/D(0) {-color #1e88e5}} /tb_mux8x1/instancia_Mux8x1/D
add wave -noupdate -divider -height 30 Saída
add wave -noupdate -color {Lime Green} /tb_mux8x1/instancia_Mux8x1/Y
add wave -noupdate -divider -height 30 <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Início {0 ps} 1} {{Mudança na Entrada de Dados} {6250 ps} 1} {{Mudança na Entrada de Seleção} {12500 ps} 1} {{Mudança na Entrada de Dados} {18750 ps} 1} {{Mudança na Entrada de Seleção} {25000 ps} 1} {{Mudança na Entrada de Dados} {31250 ps} 1} {{Mudança na Entrada de Seleção} {37500 ps} 1} {{Mudança na Entrada de Dados} {43750 ps} 1} {{Mudança na Entrada de Seleção} {50000 ps} 1} {{Mudança na Entrada de Dados} {56250 ps} 1} {{Mudança na Entrada de Seleção} {62500 ps} 1} {{Mudança na Entrada de Dados} {68750 ps} 1} {{Mudança na Entrada de Seleção} {75000 ps} 1} {{Mudança na Entrada de Dados} {81250 ps} 1} {{Mudança na Entrada de Seleção} {87500 ps} 1} {{Mudança na Entrada de Dados} {93750 ps} 1} {Final {100000 ps} 1}
quietly wave cursor active 0
configure wave -namecolwidth 232
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
WaveRestoreZoom {0 ps} {105 ns}
