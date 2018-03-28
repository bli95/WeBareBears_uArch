import lc3b_types::*;

module fwd_unit 
(	
	input lc3b_reg exme_dest, destmux_out, idex_src1, idex_src2,
	input lc3b_opcode idex_opcode, exme_opcode, mewb_opcode,
	input logic exme_ld_dest, mewb_ld_dest, bit_5, bit_11, stall1,
	
	output logic [1:0] fwdAmux_sel, fwdBmux_sel
);

always_comb
begin

	fwdAmux_sel = 2'b00;
	fwdBmux_sel = 2'b00;
	
	case (idex_opcode)
		op_add, op_and:
		begin
			if (bit_5 == 1'b0) begin
				if(exme_ld_dest && (exme_dest == idex_src1 || exme_dest == idex_src2)) begin
					if(exme_dest == idex_src1) begin 
						fwdAmux_sel = 2'b01;
					end
					if(exme_dest == idex_src2) begin
						fwdBmux_sel = 2'b01;
					end
				end
				else if(mewb_ld_dest && (destmux_out == idex_src1 || destmux_out == idex_src2)) begin
					if(destmux_out == idex_src1) begin
						fwdAmux_sel = 2'b10;
					end
					if(destmux_out == idex_src2) begin
						fwdBmux_sel = 2'b10;
					end
				end
			end
			else begin
				if(exme_ld_dest && (exme_dest == idex_src1)) begin
					fwdAmux_sel = 2'b01;
				end
				else if(mewb_ld_dest && (destmux_out == idex_src1)) begin
					fwdAmux_sel = 2'b10;
				end
			end
		end
		op_jsr:
		begin
			if (bit_11 == 1'b0) begin
				if(exme_ld_dest && (exme_dest == idex_src1)) begin
					fwdAmux_sel = 2'b01;
				end
				else if(mewb_ld_dest && (destmux_out == idex_src1)) begin
					fwdAmux_sel = 2'b10;
				end
			end
		end
		op_jmp, op_ldb, op_ldi, op_ldr, op_not, op_shf, op_stb, op_sti, op_str:
		begin
			if(exme_ld_dest && (exme_dest == idex_src1)) begin
				fwdAmux_sel = 2'b10;
			end
			else if(mewb_ld_dest && (destmux_out == idex_src1)) begin
				fwdAmux_sel = 2'b10;
			end
		end
		default: ;
	endcase
	
end

endmodule : fwd_unit 