-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Aug  8 13:35:35 2024
-- Host        : DESKTOP-6HQVPMI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Working/CLP_Programs/Codigos/Protocheck2_VIO/Sintesis/protocheck_VIO.srcs/sources_1/ip/vio_0/vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[11:0],probe_in1[0:0],probe_out0[0:0],probe_out1[0:0],probe_out2[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2018.1";
begin
end;
